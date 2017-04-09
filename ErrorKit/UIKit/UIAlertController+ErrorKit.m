// UIAlertController+ErrorKit.m
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

#import "UIAlertController+ErrorKit.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_UI_KIT

static char kMRRecoveryDelegateObjectKey;


@interface MRAlertControllerRecoveryDelegate : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) void *contextInfo;
@end


@implementation MRAlertControllerRecoveryDelegate

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

- (void)alertDidClickButtonAtIndex:(NSInteger)recoveryOptionIndex
{
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
}

- (void)alertDidClickHelpAnchorButton
{
    // Show help
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:[MRErrorFormatter stringForHelpTitleFromError:self.error]
                                                                   message:self.error.helpAnchor
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:[MRErrorFormatter stringForHelpDismissButtonFromError:self.error]
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [[UIAlertController alertWithTitle:self.title
                                                                                          error:self.error
                                                                                       delegate:self.delegate
                                                                             didRecoverSelector:self.selector
                                                                                    contextInfo:self.contextInfo] mr_show];
                                                         }];
    [alert addAction:cancelAction];
    [alert mr_show];
}

- (void)alertDidClickCancelButton {
    // Cancel
#ifdef ERROR_KIT_ADDITIONS
    if (self.error.onCancelledBlock) {
        self.error.onCancelledBlock(self.error);
    }
#endif
    [self invokeRecoverSelectorWithSuccess:NO];
}

@end


#pragma mark -
#pragma mark -


@implementation UIAlertController (ErrorKit)

+ (instancetype)alertWithTitle:(NSString *const)titleOrNil error:(NSError *const)error
{
    UIAlertController *const alert = [self alertWithTitle:titleOrNil error:error delegate:nil didRecoverSelector:0x00 contextInfo:0x00];
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
    MRAlertControllerRecoveryDelegate *alertDelegate;
#ifdef ERROR_KIT_ADDITIONS
    if (error.recoveryAttempter || error.helpAnchor || error.onCancelledBlock) {
#else
    if (error.recoveryAttempter || error.helpAnchor) {
#endif
        alertDelegate = [[MRAlertControllerRecoveryDelegate alloc] init];
        alertDelegate.title = titleOrNil;
        alertDelegate.error = error;
        alertDelegate.delegate = recoveryDelegate;
        alertDelegate.selector = selector;
        alertDelegate.contextInfo = context;
    } else {
        alertDelegate = nil;
    }
    // Instantiate alert
    UIAlertController *const alert = [UIAlertController alertControllerWithTitle:alertTitle
                                                                         message:alertMessage
                                                                  preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButton
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertDelegate alertDidClickCancelButton];
                                                         }];
    [alert addAction:cancelAction];
    // Add other buttons
    NSArray *otherButtons;
    if (error.recoveryAttempter) {
        otherButtons = error.localizedRecoveryOptions;
    } else {
        otherButtons = nil;
    }
    [otherButtons enumerateObjectsUsingBlock:^(NSString *const option, NSUInteger const idx, BOOL *const stop) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:option
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           [alertDelegate alertDidClickButtonAtIndex:idx];
                                                       }];
        [alert addAction:action];
    }];
    // Add help button
    if (error.helpAnchor) {
        UIAlertAction *action = [UIAlertAction actionWithTitle:[MRErrorFormatter stringForHelpButtonFromError:error]
                                                         style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * _Nonnull action) {
                                                           [alertDelegate alertDidClickHelpAnchorButton];
                                                       }];
        [alert addAction:action];
    }
    // Retain alert delegate
    if (alertDelegate) {
        objc_setAssociatedObject(alert, &kMRRecoveryDelegateObjectKey, alertDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return alert;
}

- (void)mr_show
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = [[UIViewController alloc] init];
    
    id<UIApplicationDelegate> delegate = [UIApplication sharedApplication].delegate;
    if ([delegate respondsToSelector:@selector(window)]) {
        window.tintColor = delegate.window.tintColor;
    }
    window.windowLevel = UIWindowLevelAlert;
    [window makeKeyAndVisible];
    [window.rootViewController presentViewController:self animated:YES completion:nil];
}

@end
    
#endif
