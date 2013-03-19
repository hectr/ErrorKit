// MRAlertRecoveryAttempter.m
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

#import "MRAlertRecoveryAttempter.h"
#import <objc/runtime.h>

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


static char kMRDelegateRecoveryAttempterAssociationKey;


@interface MRAlertRecoveryAttempter ()
@property (nonatomic, assign) CFRunLoopRef runLoop;
@property (nonatomic, assign) CFRunLoopSourceRef runLoopSource;
@property (nonatomic, assign) BOOL didRecover;
@property (nonatomic, assign) BOOL invokeDidRecoverSelector;
@property (nonatomic, weak, readwrite) id associatedObject;
@property (nonatomic, copy) NSError *error;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) void *contextInfo;
@end


@implementation MRAlertRecoveryAttempter

- (id)initWithBlock:(BOOL (^)(NSError *, NSUInteger, BOOL *))handler
{
    NSParameterAssert(handler);
    self = [super init];
    if (self) {
        self.recoveryHandler = handler;
    }
    return self;
}

- (void)associateWithObject:(id)object
{
    objc_setAssociatedObject(self.associatedObject
                             , &kMRDelegateRecoveryAttempterAssociationKey
                             , nil
                             , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (object) {
        objc_setAssociatedObject(object
                                 , &kMRDelegateRecoveryAttempterAssociationKey
                                 , self
                                 , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    self.associatedObject = object;
}

- (void)mr_didRecovery
{
    if (self.runLoopSource) {
        CFRunLoopSourceSignal(self.runLoopSource);
        CFRelease(self.runLoopSource);
        self.runLoopSource = nil;
    }
    if (self.runLoop) {
        CFRunLoopWakeUp(self.runLoop);
        CFRelease(self.runLoop);
        self.runLoop = nil;
    }
}

#pragma mark - UIAlertViewDelegate

- (void)willPresentAlertView:(UIAlertView *)alertView
{
    if (self.associatedObject == nil) {
        [self associateWithObject:alertView];
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    self.didRecover = self.delegateHandler(alertView, buttonIndex, &_invokeDidRecoverSelector);
    if (self.invokeDidRecoverSelector) {
        if (self.runLoop) {
            [self mr_didRecovery];
        } else if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
        [self associateWithObject:nil];
    }
}

#pragma mark - UIActionSheetDelegate

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    if (self.associatedObject == nil) {
        [self associateWithObject:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    self.didRecover = self.delegateHandler(actionSheet, buttonIndex, &_invokeDidRecoverSelector);
    if (self.invokeDidRecoverSelector) {
        if (self.runLoop) {
            [self mr_didRecovery];
        } else if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
        [self associateWithObject:nil];
    }
}

#pragma mark - NSErrorRecoveryAttempting

- (void)attemptRecoveryFromError:(NSError *)error optionIndex:(NSUInteger)recoveryOptionIndex delegate:(id)delegate didRecoverSelector:(SEL)didRecoverSelector contextInfo:(void *)contextInfo
{
    self.delegate = delegate;
    self.selector = didRecoverSelector;
    self.contextInfo = contextInfo;
    self.didRecover = self.recoveryHandler(error, recoveryOptionIndex, &_invokeDidRecoverSelector);
    if (self.invokeDidRecoverSelector) {
        if (self.runLoop) {
            [self mr_didRecovery];
        } else if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
        [self associateWithObject:nil];
    }
}

- (BOOL)attemptRecoveryFromError:(NSError *)error optionIndex:(NSUInteger)recoveryOptionIndex
{
    NSAssert(self.runLoop == nil, nil);
    if (self.runLoop) {
        return NO;
    }
    self.didRecover = self.recoveryHandler(error, recoveryOptionIndex, &_invokeDidRecoverSelector);
    CFRunLoopSourceContext context = {0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL};
    self.runLoopSource = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &context);
    self.runLoop = CFRunLoopGetCurrent();
    CFRetain(self.runLoop);
    CFRunLoopAddSource(self.runLoop, self.runLoopSource, kCFRunLoopCommonModes );
    while (!_invokeDidRecoverSelector) {
        CFRunLoopRunInMode(kCFRunLoopDefaultMode, 3, YES);
    }
    return self.didRecover;
}


#pragma mark - NSObject

- (void)dealloc
{
    if (!self.invokeDidRecoverSelector) {
        if (self.runLoop) {
            [self mr_didRecovery];
        } else if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
    }
}

- (NSString *)description
{
    NSString *delegateString;
    if (self.delegate) {
        delegateString = [NSString stringWithFormat:@"delegate %p"
                                                    , self.delegate];
    } else {
        delegateString = @"";
    }
    NSMutableArray *blocksComponents = [NSMutableArray arrayWithCapacity:2];
    if (self.recoveryHandler) {
        [blocksComponents addObject:@"recovery block"];
    }
    if (self.delegateHandler) {
        [blocksComponents addObject:@"delegate block"];
    }
    NSString *blocksString = [blocksComponents componentsJoinedByString:@" and "];
    if (blocksComponents.count > 0){
        blocksString = [NSString stringWithFormat:@"with %@%@"
                                                  , blocksString
                                                  , (self.delegate ? @", " : @"")];
    }
    NSString *associatedString;
    if (self.associatedObject) {
        associatedString = [NSString stringWithFormat:( @", associated with %p%@")
                            , self.associatedObject
                            , (self.delegate || self.recoveryHandler || self.delegateHandler ? @", " : @"")];
    } else {
        associatedString = (self.delegate || self.recoveryHandler || self.delegateHandler ? @", " : @"");
    }
    return [NSString stringWithFormat:@"<%@: %p%@%@%@>"
            , NSStringFromClass(self.class)
            , self
            , associatedString
            , blocksString
            , delegateString];
}

@end
