// MRErrorFormatter+FacebookSDK.m
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

#import "MRErrorFormatter+FacebookSDK.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_FACEBOOK_SDK

@implementation MRErrorFormatter (ErrorKit_FacebookSDK)

+ (NSString *)debugStringWithFacebookCode:(NSInteger const)code
{
    switch (code) {
        case FBErrorInvalid:
            return mr_stringize_error_code(FBErrorInvalid);
        case FBErrorOperationCancelled:
            return mr_stringize_error_code(FBErrorOperationCancelled);
        case FBErrorLoginFailedOrCancelled:
            return mr_stringize_error_code(FBErrorLoginFailedOrCancelled);
        case FBErrorRequestConnectionApi:
            return mr_stringize_error_code(FBErrorRequestConnectionApi);
        case FBErrorProtocolMismatch:
            return mr_stringize_error_code(FBErrorProtocolMismatch);
        case FBErrorHTTPError:
            return mr_stringize_error_code(FBErrorHTTPError);
        case FBErrorNonTextMimeTypeReturned:
            return mr_stringize_error_code(FBErrorNonTextMimeTypeReturned);
        case FBErrorDialog:
            return mr_stringize_error_code(FBErrorDialog);
        case FBErrorAppEvents:
            return mr_stringize_error_code(FBErrorAppEvents);
        case FBErrorSystemAPI:
            return mr_stringize_error_code(FBErrorSystemAPI);
        case FBErrorPublishInstallResponse:
            return mr_stringize_error_code(FBErrorPublishInstallResponse);
        case FBErrorAppActivatedWhilePendingAppCall:
            return mr_stringize_error_code(FBErrorAppActivatedWhilePendingAppCall);
        case FBErrorUntrustedURL:
            return mr_stringize_error_code(FBErrorUntrustedURL);
        case FBErrorMalformedURL:
            return mr_stringize_error_code(FBErrorMalformedURL);
        case FBErrorSessionReconnectInProgess:
            return mr_stringize_error_code(FBErrorSessionReconnectInProgess);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithFacebookCode:(NSInteger const)code
{
    switch (code) {
        case FBErrorInvalid:
            return MRErrorKitString(@"Invalid Error", nil);
        case FBErrorOperationCancelled:
            return MRErrorKitString(@"Operation Cancelled", nil);
        case FBErrorLoginFailedOrCancelled:
            return MRErrorKitString(@"Login Failed Or Cancelled", nil);
        case FBErrorRequestConnectionApi:
            return MRErrorKitString(@"Graph Error", nil);
        case FBErrorProtocolMismatch:
            return MRErrorKitString(@"Protocol Mismatch", nil);
        case FBErrorHTTPError:
            return MRErrorKitString(@"HTTP Error", nil);
        case FBErrorNonTextMimeTypeReturned:
            return MRErrorKitString(@"Invalid Response", nil);
        case FBErrorDialog:
            return MRErrorKitString(@"Native Dialog Error", nil);
        case FBErrorAppEvents:
            return MRErrorKitString(@"FBAppEvents Error", nil);
        case FBErrorSystemAPI:
            return MRErrorKitString(@"iOS API Call Error", nil);
        case FBErrorPublishInstallResponse:
            return MRErrorKitString(@"Publish Install Response Error", nil);
        case FBErrorAppActivatedWhilePendingAppCall:
            return MRErrorKitString(@"Activated While Waiting Error", nil);
        case FBErrorUntrustedURL:
            return MRErrorKitString(@"Untrusted URL", nil);
        case FBErrorMalformedURL:
            return MRErrorKitString(@"Bad URL", nil);
        case FBErrorSessionReconnectInProgess:
            return MRErrorKitString(@"Session Busy", nil);
    }
    return MRErrorKitString(@"Facebook Error", nil);
}

@end

#endif
