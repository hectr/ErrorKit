// MRErrorBuilder+FacebookSDK.m
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

#import "MRErrorBuilder+FacebookSDK.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_FACEBOOK_SDK

@implementation MRErrorBuilder (ErrorKit_FacebookSDK)

- (NSError *)innerError
{
    return self.userInfo[FBErrorInnerErrorKey];
}

- (void)setInnerError:(NSError *const)innerError
{
    [self setUserInfoValue:innerError forKey:FBErrorInnerErrorKey];
}

- (id)parsedJSONResponse
{
    return self.userInfo[FBErrorParsedJSONResponseKey];
}

- (void)setParsedJSONResponse:(id const)parsedJSONResponse
{
    [self setUserInfoValue:parsedJSONResponse forKey:FBErrorParsedJSONResponseKey];
}

- (NSInteger)HTTPStatusCode
{
    return [self.userInfo[FBErrorHTTPStatusCodeKey] integerValue];
}

- (void)setHTTPStatusCode:(NSInteger const)HTTPStatusCode
{
    [self setUserInfoValue:@(HTTPStatusCode) forKey:FBErrorHTTPStatusCodeKey];
}

- (FBSession *)session
{
    return self.userInfo[FBErrorSessionKey];
}

- (void)setSession:(FBSession *const)session
{
    [self setUserInfoValue:session forKey:FBErrorSessionKey];
}

- (NSURL *)unprocessedURL
{
    return self.userInfo[FBErrorUnprocessedURLKey];
}

- (void)setUnprocessedURL:(NSURL *const)url
{
    [self setUserInfoValue:url.copy forKey:FBErrorUnprocessedURLKey];
}

- (NSString *)loginFailedReason
{
    return self.userInfo[FBErrorLoginFailedReason];
}

- (void)setLoginFailedReason:(NSString *const)loginFailedReason
{
    [self setUserInfoValue:loginFailedReason.copy forKey:FBErrorLoginFailedReason];
}

- (NSString *)nativeDialogReason
{
    return self.userInfo[FBErrorDialogReasonKey];
}

- (void)setNativeDialogReason:(NSString *const)nativeDialogReason
{
    [self setUserInfoValue:nativeDialogReason.copy forKey:FBErrorDialogReasonKey];
}

- (NSString *)insightsReason
{
    return self.userInfo[@"com.facebook.sdk:InsightsReasonKey"];
}

- (void)setInsightsReason:(NSString *const)insightsReason
{
    [self setUserInfoValue:insightsReason.copy forKey:@"com.facebook.sdk:InsightsReasonKey"];
}

@end

#endif
