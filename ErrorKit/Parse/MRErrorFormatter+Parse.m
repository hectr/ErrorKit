// MRErrorFormatter+Parse.m
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

#import "MRErrorFormatter+Parse.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_PARSE

@implementation MRErrorFormatter (ErrorKit_Parse)

+ (NSString *)debugStringWithParseCode:(NSInteger const)code
{
    switch (code) {
        case -1:
            return @"OtherCause";
        case 1 /*kPFErrorInternalServer*/:
            return mr_stringize_error_code(kPFErrorInternalServer);
        case 100 /*kPFErrorConnectionFailed*/:
            return mr_stringize_error_code(kPFErrorConnectionFailed);
        case 101 /*kPFErrorObjectNotFound*/:
            return mr_stringize_error_code(kPFErrorObjectNotFound);
        case 102 /*kPFErrorInvalidQuery*/:
            return mr_stringize_error_code(kPFErrorInvalidQuery);
        case 103 /*kPFErrorInvalidClassName*/:
            return mr_stringize_error_code(kPFErrorInvalidClassName);
        case 104 /*kPFErrorMissingObjectId*/:
            return mr_stringize_error_code(kPFErrorMissingObjectId);
        case 105 /*kPFErrorInvalidKeyName*/:
            return mr_stringize_error_code(kPFErrorInvalidKeyName);
        case 106/*kPFErrorInvalidPointer*/:
            return mr_stringize_error_code(kPFErrorInvalidPointer);
        case 107 /*kPFErrorInvalidJSON*/:
            return mr_stringize_error_code(kPFErrorInvalidJSON);
        case 108 /*kPFErrorCommandUnavailable*/:
            return mr_stringize_error_code(kPFErrorCommandUnavailable);
        case 109:
            return @"NotInitialized";
        case 111 /*kPFErrorIncorrectType*/:
            return mr_stringize_error_code(kPFErrorIncorrectType);
        case 112 /*kPFErrorInvalidChannelName*/:
            return mr_stringize_error_code(kPFErrorInvalidChannelName);
        case 114 /*kPFErrorInvalidDeviceToken*/:
            return mr_stringize_error_code(kPFErrorInvalidDeviceToken);
        case 115 /*kPFErrorPushMisconfigured*/:
            return mr_stringize_error_code(kPFErrorPushMisconfigured);
        case 116 /*kPFErrorObjectTooLarge*/:
            return mr_stringize_error_code(kPFErrorObjectTooLarge);
        case 119 /*kPFErrorOperationForbidden*/:
            return mr_stringize_error_code(kPFErrorOperationForbidden);
        case 120 /*kPFErrorCacheMiss*/:
            return mr_stringize_error_code(kPFErrorCacheMiss);
        case 121 /*kPFErrorInvalidNestedKey*/:
            return mr_stringize_error_code(kPFErrorInvalidNestedKey);
        case 122 /*kPFErrorInvalidFileName*/:
            return mr_stringize_error_code(kPFErrorInvalidFileName);
        case 123 /*kPFErrorInvalidACL*/:
            return mr_stringize_error_code(kPFErrorInvalidACL);
        case 124 /*kPFErrorTimeout*/:
            return mr_stringize_error_code(kPFErrorTimeout);
        case 125 /*kPFErrorInvalidEmailAddress*/:
            return mr_stringize_error_code(kPFErrorInvalidEmailAddress);
        case 137 /*kPFErrorDuplicateValue*/:
            return mr_stringize_error_code(kPFErrorDuplicateValue);
        case 139 /*kPFErrorInvalidRoleName*/:
            return mr_stringize_error_code(kPFErrorInvalidRoleName);
        case 140 /*kPFErrorExceededQuota*/:
            return mr_stringize_error_code(kPFErrorExceededQuota);
        case 141 /*kPFScriptError*/:
            return mr_stringize_error_code(kPFScriptError);
        case 142 /*kPFValidationError*/:
            return mr_stringize_error_code(kPFValidationError);
        case 143 /*kPFErrorReceiptMissing*/:
            return mr_stringize_error_code(kPFErrorReceiptMissing);
        case 144 /*kPFErrorInvalidPurchaseReceipt*/:
            return mr_stringize_error_code(kPFErrorInvalidPurchaseReceipt);
        case 145 /*kPFErrorPaymentDisabled*/:
            return mr_stringize_error_code(kPFErrorPaymentDisabled);
        case 146 /*kPFErrorInvalidProductIdentifier*/:
            return mr_stringize_error_code(kPFErrorInvalidProductIdentifier);
        case 147 /*kPFErrorProductNotFoundInAppStore*/:
            return mr_stringize_error_code(kPFErrorProductNotFoundInAppStore);
        case 148 /*kPFErrorInvalidServerResponse*/:
            return mr_stringize_error_code(kPFErrorInvalidServerResponse);
        case 149 /*kPFErrorProductDownloadFileSystemFailure*/:
            return mr_stringize_error_code(kPFErrorProductDownloadFileSystemFailure);
        case 150 /*kPFErrorInvalidImageData*/:
            return mr_stringize_error_code(kPFErrorInvalidImageData);
        case 151 /*kPFErrorUnsavedFile*/:
            return mr_stringize_error_code(kPFErrorUnsavedFile);
        case 153 /*kPFErrorFileDeleteFailure*/:
            return mr_stringize_error_code(kPFErrorFileDeleteFailure);
        case 200 /*kPFErrorUsernameMissing*/:
            return mr_stringize_error_code(kPFErrorUsernameMissing);
        case 201 /*kPFErrorUserPasswordMissing*/:
            return mr_stringize_error_code(kPFErrorUserPasswordMissing);
        case 202 /*kPFErrorUsernameTaken*/:
            return mr_stringize_error_code(kPFErrorUsernameTaken);
        case 203 /*kPFErrorUserEmailTaken*/:
            return mr_stringize_error_code(kPFErrorUserEmailTaken);
        case 204 /*kPFErrorUserEmailMissing*/:
            return mr_stringize_error_code(kPFErrorUserEmailMissing);
        case 205 /*kPFErrorUserWithEmailNotFound*/:
            return mr_stringize_error_code(kPFErrorUserWithEmailNotFound);
        case 206 /*kPFErrorUserCannotBeAlteredWithoutSession*/:
            return mr_stringize_error_code(kPFErrorUserCannotBeAlteredWithoutSession);
        case 207 /*kPFErrorUserCanOnlyBeCreatedThroughSignUp*/:
            return mr_stringize_error_code(kPFErrorUserCanOnlyBeCreatedThroughSignUp);
        case 208 /*kPFErrorAccountAlreadyLinked*/:
            return mr_stringize_error_code(kPFErrorAccountAlreadyLinked);
        case 209 /*kPFErrorUserIdMismatch*/:
            return mr_stringize_error_code(kPFErrorUserIdMismatch);
        case 250 /*kPFErrorLinkedIdMissing*/:
            return mr_stringize_error_code(kPFErrorLinkedIdMissing);
        case 251 /*kPFErrorInvalidLinkedSession*/:
            return mr_stringize_error_code(kPFErrorInvalidLinkedSession);
        case 252:
            return @"UnsupportedService";
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithParseCode:(NSInteger const)code
{
    switch (code) {
        case -1:
            return MRErrorKitString(@"Unknown Error", nil);
        case 1 /*kPFErrorInternalServer*/:
            return MRErrorKitString(@"Internal Server Error", nil);
        case 100 /*kPFErrorConnectionFailed*/:
            return MRErrorKitString(@"Connection Failed", nil);
        case 101 /*kPFErrorObjectNotFound*/:
            return MRErrorKitString(@"Object Not Found", nil);
        case 102 /*kPFErrorInvalidQuery*/:
            return MRErrorKitString(@"Invalid Query", nil);
        case 103 /*kPFErrorInvalidClassName*/:
            return MRErrorKitString(@"Invalid Class Name", nil);
        case 104 /*kPFErrorMissingObjectId*/:
            return MRErrorKitString(@"Missing Object Id", nil);
        case 105 /*kPFErrorInvalidKeyName*/:
            return MRErrorKitString(@"Invalid Key Name", nil);
        case 106 /*kPFErrorInvalidPointer*/:
            return MRErrorKitString(@"Invalid Pointer", nil);
        case 107 /*kPFErrorInvalidJSON*/:
            return MRErrorKitString(@"Invalid JSON", nil);
        case 108 /*kPFErrorCommandUnavailable*/:
            return MRErrorKitString(@"Command Unavailable", nil);
        case 109:
            return MRErrorKitString(@"Not Initialized", nil);
        case 111 /*kPFErrorIncorrectType*/:
            return MRErrorKitString(@"Incorrect Type", nil);
        case 112 /*kPFErrorInvalidChannelName*/:
            return MRErrorKitString(@"Invalid Channel Name", nil);
        case 114 /*kPFErrorInvalidDeviceToken*/:
            return MRErrorKitString(@"Invalid Device Token", nil);
        case 115 /*kPFErrorPushMisconfigured*/:
            return MRErrorKitString(@"Push Misconfigured", nil);
        case 116 /*kPFErrorObjectTooLarge*/:
            return MRErrorKitString(@"Object Too Large", nil);
        case 119 /*kPFErrorOperationForbidden*/:
            return MRErrorKitString(@"Operation Forbidden", nil);
        case 120 /*kPFErrorCacheMiss*/:
            return MRErrorKitString(@"Cache Miss", nil);
        case 121 /*kPFErrorInvalidNestedKey*/:
            return MRErrorKitString(@"Invalid Nested Key", nil);
        case 122 /*kPFErrorInvalidFileName*/:
            return MRErrorKitString(@"Invalid File Name", nil);
        case 123 /*kPFErrorInvalidACL*/:
            return MRErrorKitString(@"Invalid ACL", nil);
        case 124 /*kPFErrorTimeout*/:
            return MRErrorKitString(@"Timeout", nil);
        case 125 /*kPFErrorInvalidEmailAddress*/:
            return MRErrorKitString(@"Invalid Email Address", nil);
        case 137 /*kPFErrorDuplicateValue*/:
            return MRErrorKitString(@"Duplicate Value", nil);
        case 139 /*kPFErrorInvalidRoleName*/:
            return MRErrorKitString(@"Invalid Role Name", nil);
        case 140 /*kPFErrorExceededQuota*/:
            return MRErrorKitString(@"Exceeded Quota", nil);
        case 141 /*kPFScriptError*/:
            return MRErrorKitString(@"Script Failed", nil);
        case 142 /*kPFValidationError*/:
            return MRErrorKitString(@"Validation Error", nil);
        case 143 /*kPFErrorReceiptMissing*/:
            return MRErrorKitString(@"Receipt Missing", nil);
        case 144 /*kPFErrorInvalidPurchaseReceipt*/:
            return MRErrorKitString(@"Invalid Purchase Receipt", nil);
        case 145 /*kPFErrorPaymentDisabled*/:
            return MRErrorKitString(@"Payment Disabled", nil);
        case 146 /*kPFErrorInvalidProductIdentifier*/:
            return MRErrorKitString(@"Invalid Product Identifier", nil);
        case 147 /*kPFErrorProductNotFoundInAppStore*/:
            return MRErrorKitString(@"Product Not Found In AppStore", nil);
        case 148 /*kPFErrorInvalidServerResponse*/:
            return MRErrorKitString(@"Invalid Server Response", nil);
        case 149 /*kPFErrorProductDownloadFileSystemFailure*/:
            return MRErrorKitString(@"Product Download File System Failure", nil);
        case 150 /*kPFErrorInvalidImageData*/:
            return MRErrorKitString(@"Invalid ImageData", nil);
        case 151 /*kPFErrorUnsavedFile*/:
            return MRErrorKitString(@"Unsaved File", nil);
        case 153 /*kPFErrorFileDeleteFailure*/:
            return MRErrorKitString(@"File Delete Failure", nil);
        case 200 /*kPFErrorUsernameMissing*/:
            return MRErrorKitString(@"Username Missing", nil);
        case 201 /*kPFErrorUserPasswordMissing*/:
            return MRErrorKitString(@"Password Missing", nil);
        case 202 /*kPFErrorUsernameTaken*/:
            return MRErrorKitString(@"Username Taken", nil);
        case 203 /*kPFErrorUserEmailTaken*/:
            return MRErrorKitString(@"Email Taken", nil);
        case 204 /*kPFErrorUserEmailMissing*/:
            return MRErrorKitString(@"Email Missing", nil);
        case 205 /*kPFErrorUserWithEmailNotFound*/:
            return MRErrorKitString(@"Email Not Found", nil);
        case 206 /*kPFErrorUserCannotBeAlteredWithoutSession*/:
            return MRErrorKitString(@"Session Missing", nil);
        case 207 /*kPFErrorUserCanOnlyBeCreatedThroughSignUp*/:
            return MRErrorKitString(@"Must Create User Through Signup", nil);
        case 208 /*kPFErrorAccountAlreadyLinked*/:
            return MRErrorKitString(@"Account Already Linked", nil);
        case 209 /*kPFErrorUserIdMismatch*/:
            return MRErrorKitString(@"User Id Mismatch", nil);
        case 250 /*kPFErrorLinkedIdMissing*/:
            return MRErrorKitString(@"LinkedId Missing", nil);
        case 251 /*kPFErrorInvalidLinkedSession*/:
            return MRErrorKitString(@"Invalid Linked Session", nil);
        case 252:
            return MRErrorKitString(@"Unsupported Service", nil);
    }
    return MRErrorKitString(@"Parse Error", nil);
}

@end

#endif
