// MRErrorBuilder+NSException.h
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

#import "MRErrorBuilder.h"


/**
 Adds a convenience constructor that takes an exception as parameter.
 */
@interface MRErrorBuilder (ErrorKit_NSException)

/**
 Creates and initializes an `MRErrorBuilder` object for a given domain and code.
 
 The builder is given a predefined localized description, according the given 
 exception or its domain and code; but this string may not be adequate for being
 presented to the user.
  
 @param domain The error domain.
 @param code The error code for the error.
 @param code The underlying exception.
 
 @return Builder object initialized for domain with the specified error code and
 underlying exception and some predefined localized description.
 */
+ (instancetype)builderWithDomain:(NSString *)domain code:(NSInteger)code exception:(NSException *)exception;

@end
