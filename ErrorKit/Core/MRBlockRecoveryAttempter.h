// MRBlockRecoveryAttempter.h
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

#import "MRAbstractRecoveryAttempter.h"


/**
 Instances of `MRBlockRecoveryAttempter` implement attemptRecoveryFromError:optionIndex: and attemptRecoveryFromError:optionIndex:delegate:didRecoverSelector:contextInfo: (see `NSErrorRecoveryAttempting` informal protocol) by invoking their `recoveryHandler` block.
*/
@interface MRBlockRecoveryAttempter : MRAbstractRecoveryAttempter

/// Recovery handler block.
@property (nonatomic, copy) BOOL (^recoveryHandler)(NSError *error, NSUInteger recoveryOption);

/// Convenience constructor.
+ (instancetype)attempterWithBlock:(void (^)(NSError *error, NSUInteger recoveryOption, BOOL *didRecover))handler;

/// Designated initializer.
- (id)initWithBlock:(BOOL (^)(NSError *error, NSUInteger recoveryOption))handler;

@end
