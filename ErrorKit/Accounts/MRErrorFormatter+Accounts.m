// MRErrorFormatter+Accounts.m
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

#import "MRErrorFormatter+Accounts.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_ACCOUNTS

@implementation MRErrorFormatter (ErrorKit_Accounts)

+ (NSString *)debugStringWithAccountsCode:(NSInteger const)code
{
    switch (code) {
        case ACErrorUnknown:
            return mr_stringize_error_code(ACErrorUnknown);
        case ACErrorAccountMissingRequiredProperty:
            return mr_stringize_error_code(ACErrorAccountMissingRequiredProperty);
        case ACErrorAccountAuthenticationFailed:
            return mr_stringize_error_code(ACErrorAccountAuthenticationFailed);
        case ACErrorAccountTypeInvalid:
            return mr_stringize_error_code(ACErrorAccountTypeInvalid);
        case ACErrorAccountAlreadyExists:
            return mr_stringize_error_code(ACErrorAccountAlreadyExists);
        case ACErrorAccountNotFound:
            return mr_stringize_error_code(ACErrorAccountNotFound);
        case ACErrorPermissionDenied:
            return mr_stringize_error_code(ACErrorPermissionDenied);
        case ACErrorAccessInfoInvalid:
            return mr_stringize_error_code(ACErrorAccessInfoInvalid);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithAccountsCode:(NSInteger const)code
{
    switch (code) {
        case ACErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case ACErrorAccountMissingRequiredProperty:
            return MRErrorKitString(@"Account Missing Required Property", nil);
        case ACErrorAccountAuthenticationFailed:
            return MRErrorKitString(@"Account Authentication Failed", nil);
        case ACErrorAccountTypeInvalid:
            return MRErrorKitString(@"Account Type Invalid", nil);
        case ACErrorAccountAlreadyExists:
            return MRErrorKitString(@"Account Already Exists", nil);
        case ACErrorAccountNotFound:
            return MRErrorKitString(@"Account Not Found", nil);
        case ACErrorPermissionDenied:
            return MRErrorKitString(@"Permission Denied", nil);
        case ACErrorAccessInfoInvalid:
            return MRErrorKitString(@"Access Information Invalid", nil);
    }
    return MRErrorKitString(@"Account Error", nil);
}

@end

#endif
