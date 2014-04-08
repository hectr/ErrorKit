// MRBlockRecoveryAttempter.m
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

#import "MRBlockRecoveryAttempter.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation MRBlockRecoveryAttempter

+ (instancetype)attempterWithBlock:(void (^)(NSError *, NSUInteger, BOOL *))handler
{
    return [(MRBlockRecoveryAttempter *)[self alloc] initWithBlock:^BOOL(NSError *const error, NSUInteger const recoveryOption) {
        BOOL didRecover = NO;
        handler(error, recoveryOption, &didRecover);
        return didRecover;
    }];
}

- (id)initWithBlock:(BOOL (^)(NSError *, NSUInteger))handler
{
    NSParameterAssert(handler);
    self = [super init];
    if (self) {
        self.recoveryHandler = handler;
    }
    return self;
}

#pragma mark - NSErrorRecoveryAttempting

- (void)attemptRecoveryFromError:(NSError *const)error optionIndex:(NSUInteger const)recoveryOptionIndex delegate:(id const)delegate didRecoverSelector:(SEL const)didRecoverSelector contextInfo:(void *const)contextInfo
{
    BOOL const success = self.recoveryHandler(error, recoveryOptionIndex);
    if (didRecoverSelector && delegate) {
        [self invokeRecoverSelector:didRecoverSelector
                       withDelegate:delegate
                            success:success
                        contextInfo:contextInfo];
    }
}

- (BOOL)attemptRecoveryFromError:(NSError *const)error optionIndex:(NSUInteger const)recoveryOptionIndex
{
    return self.recoveryHandler(error, recoveryOptionIndex);
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, recovery block %p>"
            , NSStringFromClass(self.class)
            , self
            , self.recoveryHandler];
}

@end
