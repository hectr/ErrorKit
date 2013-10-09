// MRErrorBuilder+AFNetworking.h
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
 Adds accessors for `AFNetworkingOperationFailingURLRequestErrorKey` and `AFNetworkingOperationFailingURLResponseErrorKey` user info values.
 
 **Warning:** This extension requires the AFNetworking library. Add an `AFNetworking.h` import to the header prefix of the project.
 */
@interface MRErrorBuilder (ErrorKit_AFNetworking)

/// @name AFRequestOperation error userInfo values

/// Accessors for `AFNetworkingOperationFailingURLRequestErrorKey` user info value.
@property (nonatomic, copy) NSURLRequest *failingURLRequest;

/// Accessors for `AFNetworkingOperationFailingURLResponseErrorKey` user info value.
@property (nonatomic, copy) NSHTTPURLResponse *failingURLResponse;

@end
