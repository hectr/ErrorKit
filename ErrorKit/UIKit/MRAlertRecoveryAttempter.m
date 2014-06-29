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
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


static char kMRDelegateRecoveryAttempterAssociationKey;


@interface MRAlertRecoveryAttempter ()
@property (nonatomic, assign) BOOL didRecover;
@property (nonatomic, assign) BOOL invokeDidRecoverSelector;
@property (nonatomic, weak, readwrite) id associatedObject;
@property (nonatomic, strong) NSError *error;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, assign) void *contextInfo;
@end


@implementation MRAlertRecoveryAttempter

+ (instancetype)attempterWithBlock:(UIAlertView *(^const)(NSError *, NSUInteger, BOOL *))handler
{
    MRAlertRecoveryAttempter *const attempter =
    [(MRAlertRecoveryAttempter *)[self alloc] initWithBlock:^BOOL(NSError *const error, NSUInteger const recoveryOption, BOOL *const finished) {
        BOOL didRecover = NO;
        UIAlertView *const alert = handler(error, recoveryOption, &didRecover);
        *finished = (alert == nil);
        if (alert.delegate != error.recoveryAttempter && [error.recoveryAttempter associatedObject] == nil) {
            [error.recoveryAttempter associateWithObject:alert];
        }
        [alert show];
        return didRecover;
    }];
    return attempter;
}

- (id)initWithBlock:(BOOL (^const)(NSError *, NSUInteger, BOOL *))handler
{
    NSParameterAssert(handler);
    self = [super init];
    if (self) {
        self.recoveryHandler = handler;
    }
    return self;
}

- (void)associateWithObject:(id const)object
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

#pragma mark - UIAlertViewDelegate

- (void)willPresentAlertView:(UIAlertView *const)alertView
{
    if (self.associatedObject == nil) {
        [self associateWithObject:alertView];
    }
}

- (void)alertView:(UIAlertView *const)alertView willDismissWithButtonIndex:(NSInteger const)buttonIndex
{
    self.didRecover = self.delegateHandler(alertView, buttonIndex, &_invokeDidRecoverSelector);
    if (self.invokeDidRecoverSelector) {
        if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
        [self associateWithObject:nil];
    }
}

#pragma mark - UIActionSheetDelegate

- (void)willPresentActionSheet:(UIActionSheet *const)actionSheet
{
    if (self.associatedObject == nil) {
        [self associateWithObject:actionSheet];
    }
}

- (void)actionSheet:(UIActionSheet *const)actionSheet clickedButtonAtIndex:(NSInteger const)buttonIndex
{
    self.didRecover = self.delegateHandler(actionSheet, buttonIndex, &_invokeDidRecoverSelector);
    if (self.invokeDidRecoverSelector) {
        if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
        [self associateWithObject:nil];
    }
}

#pragma mark - NSErrorRecoveryAttempting

- (void)attemptRecoveryFromError:(NSError *const)error optionIndex:(NSUInteger const)recoveryOptionIndex delegate:(id const)delegate didRecoverSelector:(SEL const)didRecoverSelector contextInfo:(void *const)contextInfo
{
    self.delegate = delegate;
    self.selector = didRecoverSelector;
    self.contextInfo = contextInfo;
    self.didRecover = self.recoveryHandler(error, recoveryOptionIndex, &_invokeDidRecoverSelector);
    if (self.invokeDidRecoverSelector) {
        if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
        [self associateWithObject:nil];
    }
}

- (BOOL)attemptRecoveryFromError:(NSError *const)error optionIndex:(NSUInteger const)recoveryOptionIndex
{
    self.didRecover = self.recoveryHandler(error, recoveryOptionIndex, &_invokeDidRecoverSelector);
    BOOL const recovered = self.didRecover;
    if (self.invokeDidRecoverSelector) {
        [self invokeRecoverSelector:self.selector withDelegate:self.delegate success:recovered contextInfo:self.contextInfo];
    }
    return recovered;
}


#pragma mark - NSObject

- (void)dealloc
{
    if (!self.invokeDidRecoverSelector) {
        if (self.selector && self.delegate) {
            [self invokeRecoverSelector:self.selector
                           withDelegate:self.delegate
                                success:self.didRecover
                            contextInfo:self.contextInfo];
        }
    }
}

- (NSString *)description
{
    id const delegate = self.delegate;
    id const recoveryHandler = self.recoveryHandler;
    id const delegateHandler = self.delegateHandler;
    NSString *delegateString;
    if (delegate) {
        delegateString = [NSString stringWithFormat:@"delegate %p" , delegate];
    } else {
        delegateString = @"";
    }
    NSMutableArray *const blocksComponents = [NSMutableArray arrayWithCapacity:2];
    if (recoveryHandler) {
        [blocksComponents addObject:@"recovery block"];
    }
    if (delegateHandler) {
        [blocksComponents addObject:@"delegate block"];
    }
    NSString *blocksString = [blocksComponents componentsJoinedByString:@" and "];
    if (blocksComponents.count > 0){
        NSString *const separator = (delegate ? @", " : @"");
        blocksString = [NSString stringWithFormat:@"with %@%@"
                            , blocksString
                            , separator];
    }
    NSString *associatedString;
    if (self.associatedObject) {
        NSString *const separator = (delegate || recoveryHandler || delegateHandler ? @", " : @"");
        associatedString = [NSString stringWithFormat:( @", associated with %p%@")
                                , self.associatedObject
                                , separator];
    } else {
        associatedString = (delegate || recoveryHandler || delegateHandler ? @", " : @"");
    }
    NSString *const description = [NSString stringWithFormat:@"<%@: %p%@%@%@>"
                                        , NSStringFromClass(self.class)
                                        , self
                                        , associatedString
                                        , blocksString
                                        , delegateString];
    return description;
}

@end
