// UIAlertView+ErrorKit.m
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

#import "UIAlertView+ErrorKit.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


static char kMRAlertViewDelegateObjectKey;


@interface MRAlertViewRecoveryDelegate : NSObject <UIAlertViewDelegate>
@property (nonatomic, copy) NSError *error;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) void *contextInfo;
@property (nonatomic, strong) UIAlertView *onWillDismissAlert;
@end


@implementation MRAlertViewRecoveryDelegate

- (void)invokeRecoverSelectorWithSuccess:(BOOL)success
{
    if ([self.delegate respondsToSelector:self.selector]) {
        NSMethodSignature *signature = [self.delegate methodSignatureForSelector:self.selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setSelector:self.selector];
        [invocation setArgument:(void *)&success atIndex:2];
        [invocation setArgument:&_contextInfo atIndex:3];
        [invocation invokeWithTarget:self.delegate];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSInteger helpIndex = (self.error.helpAnchor ? alertView.numberOfButtons - 1 : NSNotFound);
    if (helpIndex == buttonIndex) {
        // Show help
        MRAlertViewRecoveryDelegate *delegate = [[self.class alloc] init];
        delegate.onWillDismissAlert = alertView;
        self.onWillDismissAlert = [[UIAlertView alloc] initWithTitle:MRErrorKitString(@"Help", nil)
                                                             message:self.error.helpAnchor
                                                            delegate:delegate
                                                   cancelButtonTitle:MRErrorKitString(@"OK", nil)
                                                   otherButtonTitles:nil];
        objc_setAssociatedObject(self.onWillDismissAlert, &kMRAlertViewDelegateObjectKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else if (alertView.cancelButtonIndex != buttonIndex) {
        NSString *recoveryOption = [alertView buttonTitleAtIndex:buttonIndex];
        NSUInteger recoveryOptionIndex = [self.error.localizedRecoveryOptions indexOfObject:recoveryOption];
        // Attempt recovery
        if ([self.error.recoveryAttempter respondsToSelector:@selector(attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo:)]) {
            [self.error.recoveryAttempter attemptRecoveryFromError:self.error
                                                       optionIndex:recoveryOptionIndex
                                                          delegate:self.delegate
                                                didRecoverSelector:self.selector
                                                       contextInfo:self.contextInfo];
        } else {
            BOOL success = [self.error.recoveryAttempter attemptRecoveryFromError:self.error optionIndex:recoveryOptionIndex];
            [self invokeRecoverSelectorWithSuccess:success];
        }
    } else {
        // Cancel
        [self invokeRecoverSelectorWithSuccess:NO];
    }
    if ([self.delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [self.delegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.delegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [self.delegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    [self invokeRecoverSelectorWithSuccess:NO];
    if ([self.delegate respondsToSelector:@selector(alertViewCancel:)]) {
        [self.delegate alertViewCancel:alertView];
    }
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if ([self.delegate respondsToSelector:@selector(willPresentAlertView:)]) {
        [self.delegate willPresentAlertView:alertView];
    }
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
    if ([self.delegate respondsToSelector:@selector(didPresentAlertView:)]) {
        [self.delegate didPresentAlertView:alertView];
    }
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (self.onWillDismissAlert) {
      [self.onWillDismissAlert show];
      self.onWillDismissAlert = nil;
    }
    if ([self.delegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [self.delegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    if ([self.delegate respondsToSelector:@selector(alertViewShouldEnableFirstOtherButton:)]) {
        [self.delegate alertViewShouldEnableFirstOtherButton:alertView];
    }
    return YES;
}

@end


#pragma mark -
#pragma mark -


@implementation UIAlertView (ErrorKit)

+ (instancetype)alertWithTitle:(NSString *)titleOrNil error:(NSError *)error
{
    UIAlertView *alert = [self alertWithTitle:titleOrNil error:error delegate:nil didRecoverSelector:0x00 contextInfo:0x00];
    return alert;
}

+ (instancetype)alertWithTitle:(NSString *)titleOrNil error:(NSError *)error delegate:(id)recoveryDelegate didRecoverSelector:(SEL)selector contextInfo:(void *)context
{
    // Compose texts
    NSString *alertTitle;
    NSString *alertMessage;
    if (titleOrNil) {
        alertTitle = titleOrNil;
        alertMessage = [MRErrorFormatter stringFromError:error];
    } else {
        alertTitle = [MRErrorFormatter stringForTitleFromError:error];
        alertMessage = [MRErrorFormatter stringForMessageFromError:error];
    }
    NSString *cancelButton = [MRErrorFormatter stringForCancelButtonFromError:error];
    // Instantiate alert delegate
    MRAlertViewRecoveryDelegate *alertDelegate;
    if (error.recoveryAttempter || error.helpAnchor) {
        alertDelegate = [[MRAlertViewRecoveryDelegate alloc] init];
        alertDelegate.error = error;
        alertDelegate.delegate = recoveryDelegate;
        alertDelegate.selector = selector;
        alertDelegate.contextInfo = context;
    }
    // Instantiate alert
	UIAlertView *alert = [[self alloc] initWithTitle:alertTitle
                                             message:alertMessage
                                            delegate:alertDelegate
                                   cancelButtonTitle:cancelButton
                                   otherButtonTitles:nil];
    // Add other buttons
    NSArray *otherButtons;
    if (error.recoveryAttempter) {
        otherButtons = error.localizedRecoveryOptions;
        objc_setAssociatedObject(alert, &kMRAlertViewDelegateObjectKey, alertDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else {
        otherButtons = nil;
    }
    for (NSString *option in otherButtons) {
        [alert addButtonWithTitle:option];
    }
    // Add help button
    if (error.helpAnchor) {
        [alert addButtonWithTitle:MRErrorKitString(@"Help", nil)];
        objc_setAssociatedObject(alert, &kMRAlertViewDelegateObjectKey, alertDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return alert;
}

@end
