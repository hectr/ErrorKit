// MRChainedRecoveryAttempter.m
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

#import "MRChainedRecoveryAttempter.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation MRChainedRecoveryAttempter

#pragma mark - NSErrorRecoveryAttempting

- (void)attemptRecoveryFromError:(NSError *const)error optionIndex:(NSUInteger const)recoveryOptionIndex delegate:(id const)delegate didRecoverSelector:(SEL const)didRecoverSelector contextInfo:(void *const)contextInfo
{
    BOOL success = self.recoveryHandler(error, recoveryOptionIndex);
    if (!success && self.nextAttempter) {
        MRErrorBuilder *const builder = [MRErrorBuilder builderWithError:error];
        builder.recoveryAttempter = self.nextAttempter;
        [self.nextAttempter attemptRecoveryFromError:builder.error
                                         optionIndex:recoveryOptionIndex
                                            delegate:delegate
                                  didRecoverSelector:didRecoverSelector
                                         contextInfo:contextInfo];
    } else if (didRecoverSelector && delegate) {
        [self invokeRecoverSelector:didRecoverSelector
                       withDelegate:delegate
                            success:success
                        contextInfo:contextInfo];
    }
}

- (BOOL)attemptRecoveryFromError:(NSError *const)error optionIndex:(NSUInteger const)recoveryOptionIndex
{
    BOOL success = self.recoveryHandler(error, recoveryOptionIndex);
    if (!success) {
        MRErrorBuilder *const builder = [MRErrorBuilder builderWithError:error];
        builder.recoveryAttempter = self.nextAttempter;
        success = [self.nextAttempter attemptRecoveryFromError:builder.error optionIndex:recoveryOptionIndex];
    }
    return success;
}

#pragma mark - NSObject

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %p, next attempter %p>"
            , NSStringFromClass(self.class)
            , self
            , self.nextAttempter];
}

@end
