// MRChainedRecoveryAttempter.h
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


/**
 Instances of `MRChainedRecoveryAttempter` behave the same as `MRBlockRecoveryAttempter` unless the `recoveryHandler` does not report its success.
 In such case the recovery attempt is forwarded to the `nextAttempter` with a copy of the error that has `nextAttempter` as its `recoveryAttempter.
*/
@interface MRChainedRecoveryAttempter : MRBlockRecoveryAttempter

/// Next chained recovery attempter.
@property (nonatomic, strong) NSObject *nextAttempter;

@end
