// MRErrorBuilder_FacebookSDK.h
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

#ifndef FB_SESSIONSTATETERMINALBIT
#warning This extension requires the Facebook SDK framework.
#endif


/**
 Adds accessors for FBError `userInfo` values.
 
 @warning This extension requires the Facebook SDK framework. Add a `FacebookSDK.h` import to the header prefix of the project.
 */
@interface MRErrorBuilder (ErrorKit_FacebookSDK)

/// Getter for `FBErrorInnerErrorKey` user info value.
@property (nonatomic, strong) NSError *innerError;

/// Getter for `FBErrorParsedJSONResponseKey` user info value.
@property (nonatomic, strong) id parsedJSONResponse;

/// Getter for `FBErrorHTTPStatusCodeKey` user info value.
@property (nonatomic, copy) NSInteger HTTPStatusCode;

/// Getter for `FBErrorSessionKey` user info value.
@property (nonatomic, strong) FBSession *session;

/// Getter for `FBErrorLoginFailedReason` user info value.
@property (nonatomic, copy) NSString *loginFailedReason;

/// Getter for `FBErrorNativeDialogReasonKey` user info value.
@property (nonatomic, copy) NSString *nativeDialogReason;

/// Getter for `FBErrorInsightsReasonKey` user info value.
@property (nonatomic, copy) NSString *insightsReason;

@end
