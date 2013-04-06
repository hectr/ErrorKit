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


@interface MRViewController () <UIAlertViewDelegate, UITextFieldDelegate> {
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

- (IBAction)connectAction:(id)sender
{
    [self.view endEditing:YES];
    if (sender) {
        self.responseTextView.text = MRErrorKitString(@"Connecting...", nil);
    } else {
        self.responseTextView.text = MRErrorKitString(@"Retrying...", nil);
    }
    NSURL *url = [NSURL URLWithString:self.urlTextField.text];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    MRLogError(error);
    self.responseTextView.text = MRErrorKitString(@"Connection failed", nil);
    [self presentError:error];
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSString *responseUTF8String = [NSString stringWithUTF8String:data.bytes];
    if (responseUTF8String.length > 0) {
        self.responseTextView.text = responseUTF8String;
    } else {
        self.responseTextView.text = [data description];
    }
}

- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    if ([self.trustedDomains containsObject:challenge.protectionSpace.host]) {
			NSURLCredential *credential = [NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust];
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

- (NSError *)willPresentError:(NSError *)error
{
    if (error.code == NSURLErrorCannotFindHost) {
        MRAlertRecoveryAttempter *attempter = [[MRAlertRecoveryAttempter alloc] initWithBlock:^BOOL(NSError *error, NSUInteger recoveryOption, BOOL *finished) {
            if (recoveryOption == 0) {
                if (error.code == NSURLErrorCannotFindHost) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:MRErrorKitString(@"Connect to", nil)
                                                                   message:nil
                                                                  delegate:error.recoveryAttempter
                                                         cancelButtonTitle:MRErrorKitString(@"Cancel", nil)
                                                         otherButtonTitles:MRErrorKitString(@"Retry", nil), nil];
                    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
                    [alert textFieldAtIndex:0].text = self.urlTextField.text;
                    [alert show];
                }
            }
            return NO;
        }];
        attempter.delegateHandler = ^BOOL(UIAlertView *alertView, NSInteger buttonIndex, BOOL *finished) {
            *finished = YES;
            if (buttonIndex != alertView.cancelButtonIndex) {
                self.urlTextField.text = [alertView textFieldAtIndex:0].text;
                [self connectAction:nil];
                return YES;
            }
            return NO;
        };
        MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
        builder.recoveryAttempter = attempter;
        builder.localizedRecoveryOptions = @[ MRErrorKitString(@"Change URL", nil) ];
        return builder.error;
    } else {
        MRBlockRecoveryAttempter *attempter = [[MRBlockRecoveryAttempter alloc] initWithBlock:^BOOL(NSError *error, NSUInteger recoveryOption) {
            if (recoveryOption == 0) {
                NSURL *failingURL = [NSURL URLWithString:error.failingURLString];
                if (error.code == NSURLErrorServerCertificateUntrusted) {
                    [self.trustedDomains addObject:failingURL.host];
                }
                [self connectAction:nil];
                return YES;
            }
            return NO;
        }];
        if (error.code == NSURLErrorServerCertificateUntrusted) {
            MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
            builder.recoveryAttempter = attempter;
            builder.localizedRecoveryOptions = @[ MRErrorKitString(@"YES", nil) ];
            return builder.error;
        } else if (error.code == NSURLErrorNotConnectedToInternet) {
            MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
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
