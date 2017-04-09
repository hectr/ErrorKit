// MRViewController.m
//
// Copyright (c) 2013 Héctor Marqués
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MRViewController.h"
#import "ErrorKit.h"


@interface MRViewController () <UITextFieldDelegate> {
    NSMutableSet *_trustedDomains;
}

@end


@implementation MRViewController

- (NSMutableSet *)trustedDomains
{
    if (_trustedDomains == nil) {
        _trustedDomains = NSMutableSet.new;
    }
    return _trustedDomains;
}

#pragma mark - IBAction methods

- (IBAction)connectAction:(id const)sender
{
    [self.view endEditing:YES];
    if (sender) {
        self.responseTextView.text = MRErrorKitString(@"Connecting...", nil);
    } else {
        self.responseTextView.text = MRErrorKitString(@"Retrying...", nil);
    }
    NSURL *const url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *const request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *const)connection didFailWithError:(NSError *const)error
{
    MRLogError(error);
    self.responseTextView.text = MRErrorKitString(@"Connection failed", nil);
    [self presentError:error];
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *const)connection didReceiveData:(NSData *const)data
{
    NSString *const responseUTF8String = [NSString stringWithUTF8String:data.bytes];
    if (responseUTF8String.length > 0) {
        self.responseTextView.text = responseUTF8String;
    } else {
        self.responseTextView.text = [data description];
    }
}

- (void)connection:(NSURLConnection *const)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *const)challenge
{
    if ([self.trustedDomains containsObject:challenge.protectionSpace.host]) {
			NSURLCredential *const credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
			[challenge.sender useCredential:credential forAuthenticationChallenge:challenge];
    } else {
        [challenge.sender performDefaultHandlingForAuthenticationChallenge:challenge];
    }
}

#pragma mark - UIViewController methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.connectButton setTitle:MRErrorKitString(@"Connect", nil) forState:UIControlStateNormal];
}

#pragma mark - UIResponder+ErrorKit methods

- (NSError *)willPresentError:(NSError *const)error
{
    __weak typeof(self) weakSelf = self;
    if (error.code == NSURLErrorCannotFindHost && error.isHTTPError) {
        MRBlockRecoveryAttempter *const attempter =
        [MRBlockRecoveryAttempter attempterWithBlock:^(NSError *error, NSUInteger recoveryOption, BOOL *didRecover) {
                if (recoveryOption == 0) {
                    if (error.code == NSURLErrorCannotFindHost && error.isHTTPError) {
                        UIAlertController *const alert =
                        [UIAlertController alertControllerWithTitle:MRErrorKitString(@"Connect to", nil)
                                                            message:nil
                                                     preferredStyle:UIAlertControllerStyleAlert];
                        [alert addTextFieldWithConfigurationHandler:nil];
                        UITextField *textField = alert.textFields.firstObject;
                        textField.text = weakSelf.urlTextField.text;
                        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:MRErrorKitString(@"Cancel", nil)
                                                                               style:UIAlertActionStyleCancel
                                                                             handler:nil];
                        [alert addAction:cancelAction];
                        UIAlertAction *retryAction = [UIAlertAction actionWithTitle:MRErrorKitString(@"Retry", nil)
                                                                               style:UIAlertActionStyleDefault
                                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                                 weakSelf.urlTextField.text = textField.text;
                                                                                 [weakSelf connectAction:nil];
                                                                             }];
                        [alert addAction:retryAction];
                        [alert mr_show];
                        *didRecover = YES;
                    }
                }
            }];
        MRErrorBuilder *const builder = [MRErrorBuilder builderWithError:error];
        builder.recoveryAttempter = attempter;
        builder.localizedRecoveryOptions = @[ MRErrorKitString(@"Change URL", nil) ];
        return builder.error;
    } else {
        MRBlockRecoveryAttempter *const attempter =
            [MRBlockRecoveryAttempter attempterWithBlock:^(NSError *const error, NSUInteger const recoveryOption, BOOL *const didRecover) {
            if (recoveryOption == 0) {
                NSURL *const failingURL = [NSURL URLWithString:error.failingURLString];
                if (error.code == NSURLErrorServerCertificateUntrusted && error.isHTTPError) {
                    [weakSelf.trustedDomains addObject:failingURL.host];
                }
                [weakSelf connectAction:nil];
                *didRecover = YES;
            }
        }];
        if (error.code == NSURLErrorServerCertificateUntrusted && error.isHTTPError) {
            MRErrorBuilder *const builder = [MRErrorBuilder builderWithError:error];
            builder.recoveryAttempter = attempter;
            builder.localizedRecoveryOptions = @[ MRErrorKitString(@"YES", nil) ];
            return builder.error;
        } else if (error.code == NSURLErrorNotConnectedToInternet && error.isHTTPError) {
            MRErrorBuilder *const builder = [MRErrorBuilder builderWithError:error];
            builder.recoveryAttempter = attempter;
            builder.localizedRecoverySuggestion = MRErrorKitString(@"Please check your internet connection and try again.", nil);
            builder.helpAnchor = MRErrorKitString(@"You can adjust cellular network settings on iPhone in Settings > General > Cellular. On iPad the settings are located in Settings > Cellular Data\n\nTo locate nearby Wi-Fi networks, tap Settings > Wi-Fi", nil);
            builder.localizedRecoveryOptions = @[ MRErrorKitString(@"Retry", nil) ];
            return builder.error;
        } else if (error.isCancelledError) {
            return nil;
        }
    }
    return error;
}

@end
