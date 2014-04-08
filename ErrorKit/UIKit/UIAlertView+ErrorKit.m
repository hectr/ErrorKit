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


#ifdef ERROR_KIT_UI_KIT

static char kMRAlertViewDelegateObjectKey;


@interface MRAlertViewRecoveryDelegate : NSObject <UIAlertViewDelegate>
@property (nonatomic, strong) NSError *error;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) void *contextInfo;
@property (nonatomic, strong) UIAlertView *onWillDismissAlert;
@end


@implementation MRAlertViewRecoveryDelegate

- (void)invokeRecoverSelectorWithSuccess:(BOOL const)success
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

- (void)alertView:(UIAlertView *const)alertView clickedButtonAtIndex:(NSInteger const)buttonIndex
{
    NSInteger const helpIndex = (self.error.helpAnchor ? alertView.numberOfButtons - 1 : NSNotFound);
    if (helpIndex == buttonIndex) {
        // Show help
        MRAlertViewRecoveryDelegate *const delegate = [[self.class alloc] init];
        delegate.onWillDismissAlert = alertView;
        self.onWillDismissAlert =
        [[UIAlertView alloc] initWithTitle:[MRErrorFormatter stringForHelpTitleFromError:self.error]
                                   message:self.error.helpAnchor
                                  delegate:delegate
                         cancelButtonTitle:[MRErrorFormatter stringForHelpDismissButtonFromError:self.error]
                         otherButtonTitles:nil];
        objc_setAssociatedObject(self.onWillDismissAlert, &kMRAlertViewDelegateObjectKey, delegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    } else if (alertView.cancelButtonIndex != buttonIndex) {
        NSString *const recoveryOption = [alertView buttonTitleAtIndex:buttonIndex];
        NSUInteger const recoveryOptionIndex = [self.error.localizedRecoveryOptions indexOfObject:recoveryOption];
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
#ifdef ERROR_KIT_ADDITIONS
        if (self.error.onCancelledBlock) {
            self.error.onCancelledBlock(self.error);
        }
#endif
        [self invokeRecoverSelectorWithSuccess:NO];
    }
    if ([self.delegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
        [self.delegate alertView:alertView clickedButtonAtIndex:buttonIndex];
    }
}

- (void)alertView:(UIAlertView *const)alertView didDismissWithButtonIndex:(NSInteger const)buttonIndex
{
    if ([self.delegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
        [self.delegate alertView:alertView didDismissWithButtonIndex:buttonIndex];
    }
}

- (void)alertViewCancel:(UIAlertView *const)alertView
{
#ifdef ERROR_KIT_ADDITIONS
    if (self.error.onCancelledBlock) {
        self.error.onCancelledBlock(self.error);
    }
#endif
    [self invokeRecoverSelectorWithSuccess:NO];
    if ([self.delegate respondsToSelector:@selector(alertViewCancel:)]) {
        [self.delegate alertViewCancel:alertView];
    }
}

- (void)willPresentAlertView:(UIAlertView *const)alertView
{
    if ([self.delegate respondsToSelector:@selector(willPresentAlertView:)]) {
        [self.delegate willPresentAlertView:alertView];
    }
}

- (void)didPresentAlertView:(UIAlertView *const)alertView
{
    if ([self.delegate respondsToSelector:@selector(didPresentAlertView:)]) {
        [self.delegate didPresentAlertView:alertView];
    }
}

- (void)alertView:(UIAlertView *const)alertView willDismissWithButtonIndex:(NSInteger const)buttonIndex
{
    if (self.onWillDismissAlert) {
      [self.onWillDismissAlert show];
      self.onWillDismissAlert = nil;
    }
    if ([self.delegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
        [self.delegate alertView:alertView willDismissWithButtonIndex:buttonIndex];
    }
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *const)alertView
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

+ (instancetype)alertWithTitle:(NSString *const)titleOrNil error:(NSError *const)error
{
    UIAlertView *const alert = [self alertWithTitle:titleOrNil error:error delegate:nil didRecoverSelector:0x00 contextInfo:0x00];
    return alert;
}

+ (instancetype)alertWithTitle:(NSString *const)titleOrNil error:(NSError *const)error delegate:(id const)recoveryDelegate didRecoverSelector:(SEL const)selector contextInfo:(void *const)context
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
    NSString *const cancelButton = [MRErrorFormatter stringForCancelButtonFromError:error];
    // Instantiate alert delegate
    MRAlertViewRecoveryDelegate *alertDelegate;
#ifdef ERROR_KIT_ADDITIONS
    if (error.recoveryAttempter || error.helpAnchor || error.onCancelledBlock) {
#else
    if (error.recoveryAttempter || error.helpAnchor) {
#endif
        alertDelegate = [[MRAlertViewRecoveryDelegate alloc] init];
        alertDelegate.error = error;
        alertDelegate.delegate = recoveryDelegate;
        alertDelegate.selector = selector;
        alertDelegate.contextInfo = context;
    } else {
        alertDelegate = nil;
    }
    // Instantiate alert
	UIAlertView *const alert = [[self alloc] initWithTitle:alertTitle
                                             message:alertMessage
                                            delegate:alertDelegate
                                   cancelButtonTitle:cancelButton
                                   otherButtonTitles:nil];
    // Add other buttons
    NSArray *otherButtons;
    if (error.recoveryAttempter) {
        otherButtons = error.localizedRecoveryOptions;
    } else {
        otherButtons = nil;
    }
    for (NSString *const option in otherButtons) {
        [alert addButtonWithTitle:option];
    }
    // Add help button
    if (error.helpAnchor) {
        [alert addButtonWithTitle:[MRErrorFormatter stringForHelpButtonFromError:error]];
    }
    // Retain alert delegate
    if (alertDelegate) {
        objc_setAssociatedObject(alert, &kMRAlertViewDelegateObjectKey, alertDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return alert;
}

@end

#endif
