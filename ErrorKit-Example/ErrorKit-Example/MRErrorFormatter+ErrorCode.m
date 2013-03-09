// MRErrorFormatter+ErrorCode.m
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

#import "MRErrorFormatter+ErrorCode.h"

#define mr_stringize_error_code(arg) [NSString stringWithUTF8String:#arg]


@implementation MRErrorFormatter (ErrorCode)

+ (NSString *)debugStringFromCocoaCode:(NSInteger)code
{
    switch (code) {
        case NSFileNoSuchFileError:
            return mr_stringize_error_code(NSFileNoSuchFileError);
        case NSFileLockingError:
            return mr_stringize_error_code(NSFileLockingError);
        case NSFileReadUnknownError:
            return mr_stringize_error_code(NSFileReadUnknownError);
        case NSFileReadNoPermissionError:
            return mr_stringize_error_code(NSFileReadNoPermissionError);
        case NSFileReadInvalidFileNameError:
            return mr_stringize_error_code(NSFileReadInvalidFileNameError);
        case NSFileReadCorruptFileError:
            return mr_stringize_error_code(NSFileReadCorruptFileError);
        case NSFileReadNoSuchFileError:
            return mr_stringize_error_code(NSFileReadNoSuchFileError);
        case NSFileReadInapplicableStringEncodingError:
            return mr_stringize_error_code(NSFileReadInapplicableStringEncodingError);
        case NSFileReadUnsupportedSchemeError:
            return mr_stringize_error_code(NSFileReadUnsupportedSchemeError);
        case NSFileReadTooLargeError:
            return mr_stringize_error_code(NSFileReadTooLargeError);
        case NSFileReadUnknownStringEncodingError:
            return mr_stringize_error_code(NSFileReadUnknownStringEncodingError);
        case NSFileWriteUnknownError:
            return mr_stringize_error_code(NSFileWriteUnknownError);
        case NSFileWriteNoPermissionError:
            return mr_stringize_error_code(NSFileWriteNoPermissionError);
        case NSFileWriteInvalidFileNameError:
            return mr_stringize_error_code(NSFileWriteInvalidFileNameError);
        case NSFileWriteFileExistsError:
            return mr_stringize_error_code(NSFileWriteFileExistsError);
        case NSFileWriteInapplicableStringEncodingError:
            return mr_stringize_error_code(NSFileWriteInapplicableStringEncodingError);
        case NSFileWriteUnsupportedSchemeError:
            return mr_stringize_error_code(NSFileWriteUnsupportedSchemeError);
        case NSFileWriteOutOfSpaceError:
            return mr_stringize_error_code(NSFileWriteOutOfSpaceError);
        case NSFileWriteVolumeReadOnlyError:
            return mr_stringize_error_code(NSFileWriteVolumeReadOnlyError);
        case NSKeyValueValidationError:
            return mr_stringize_error_code(NSKeyValueValidationError);
        case NSFormattingError:
            return mr_stringize_error_code(NSFormattingError);
        case NSUserCancelledError:
            return mr_stringize_error_code(NSUserCancelledError);
        case NSFeatureUnsupportedError:
            return mr_stringize_error_code(NSFeatureUnsupportedError);
        case NSExecutableNotLoadableError:
            return mr_stringize_error_code(NSExecutableNotLoadableError);
        case NSExecutableArchitectureMismatchError:
            return mr_stringize_error_code(NSExecutableArchitectureMismatchError);
        case NSExecutableRuntimeMismatchError:
            return mr_stringize_error_code(NSExecutableRuntimeMismatchError);
        case NSExecutableLoadError:
            return mr_stringize_error_code(NSExecutableLoadError);
        case NSExecutableLinkError:
            return mr_stringize_error_code(NSExecutableLinkError);
        case NSPropertyListReadCorruptError:
            return mr_stringize_error_code(NSPropertyListReadCorruptError);
        case NSPropertyListReadUnknownVersionError:
            return mr_stringize_error_code(NSPropertyListReadUnknownVersionError);
        case NSPropertyListReadStreamError:
            return mr_stringize_error_code(NSPropertyListReadStreamError);
        case NSPropertyListWriteStreamError:
            return mr_stringize_error_code(NSPropertyListWriteStreamError);
        case NSXPCConnectionInterrupted:
            return mr_stringize_error_code(NSXPCConnectionInterrupted);
        case NSXPCConnectionInvalid:
            return mr_stringize_error_code(NSXPCConnectionInvalid);
        case NSXPCConnectionReplyInvalid:
            return mr_stringize_error_code(NSXPCConnectionReplyInvalid);
        default:
            if (NSFileErrorMinimum >= code
                && code <= NSFileErrorMaximum) {
                return @"NSFileError";
            } else if (NSValidationErrorMinimum >= code
                       && NSValidationErrorMaximum <= code) {
                return @"NSValidationError";
            } else if (NSExecutableErrorMinimum >= code
                       && NSExecutableErrorMaximum <= code) {
                return @"NSExecutableError";
            } else if (NSFormattingErrorMinimum >= code
                       && NSFormattingErrorMaximum <= code) {
                return @"NSFormattingError";
            } else if (NSPropertyListErrorMinimum >= code
                       && NSPropertyListErrorMaximum <= code) {
                return @"NSPropertyListError";
            } else if (NSXPCConnectionErrorMinimum >= code
                       && NSXPCConnectionErrorMaximum <= code) {
                return @"NSXPCConnectionError";
            }
    }
    return @(code).stringValue;
}

+ (NSString *)stringFromCocoaCode:(NSInteger)code
{
    switch (code) {
        case NSFileNoSuchFileError:
            return NSLocalizedString(@"No Such File", nil);
        case NSFileLockingError:
            return NSLocalizedString(@"File Locking Error", nil);
        case NSFileReadUnknownError:
            return NSLocalizedString(@"File Read Error", nil);
        case NSFileReadNoPermissionError:
            return NSLocalizedString(@"No Read Permission", nil);
        case NSFileReadInvalidFileNameError:
        case NSFileWriteInvalidFileNameError:
            return NSLocalizedString(@"Invalid File Name", nil);
        case NSFileReadCorruptFileError:
            return NSLocalizedString(@"Corrupt File", nil);
        case NSFileReadNoSuchFileError:
            return NSLocalizedString(@"No Such File", nil);
        case NSFileReadInapplicableStringEncodingError:
        case NSFileWriteInapplicableStringEncodingError:
            return NSLocalizedString(@"Inapplicable String Encoding", nil);
        case NSFileReadUnsupportedSchemeError:
        case NSFileWriteUnsupportedSchemeError:
            return NSLocalizedString(@"Unsupported Scheme", nil);
        case NSFileReadTooLargeError:
            return NSLocalizedString(@"File Too Large", nil);
        case NSFileReadUnknownStringEncodingError:
            return NSLocalizedString(@"Unknown String Encoding", nil);
        case NSFileWriteUnknownError:
            return NSLocalizedString(@"File Write Error", nil);
        case NSFileWriteNoPermissionError:
            return NSLocalizedString(@"No Write Permission", nil);
        case NSFileWriteFileExistsError:
            return NSLocalizedString(@"File Already Exists", nil);
        case NSFileWriteOutOfSpaceError:
            return NSLocalizedString(@"Out Of Space", nil);
        case NSFileWriteVolumeReadOnlyError:
            return NSLocalizedString(@"Read Only Volume", nil);
        case NSKeyValueValidationError:
            return NSLocalizedString(@"Key Value Validation Error", nil);
        case NSFormattingError:
            return NSLocalizedString(@"Formatting Error", nil);
        case NSUserCancelledError:
            return NSLocalizedString(@"Cancelled", nil);
        case NSFeatureUnsupportedError:
            return NSLocalizedString(@"Feature Unsupported", nil);
        case NSExecutableNotLoadableError:
            return NSLocalizedString(@"Executable Not Loadable", nil);
        case NSExecutableArchitectureMismatchError:
            return NSLocalizedString(@"Executable Architecture Mismatch", nil);
        case NSExecutableRuntimeMismatchError:
            return NSLocalizedString(@"Executable Runtime Mismatch", nil);
        case NSExecutableLoadError:
            return NSLocalizedString(@"Executable Load Error", nil);
        case NSExecutableLinkError:
            return NSLocalizedString(@"Executable Link Error", nil);
        case NSPropertyListReadCorruptError:
            return NSLocalizedString(@"Property List Corrupt", nil);
        case NSPropertyListReadUnknownVersionError:
            return NSLocalizedString(@"Property List Unknown Version", nil);
        case NSPropertyListReadStreamError:
        case NSPropertyListWriteStreamError:
            return NSLocalizedString(@"Property List Stream Error", nil);
        case NSXPCConnectionInterrupted:
            return NSLocalizedString(@"XPC Connection Interrupted", nil);
        case NSXPCConnectionInvalid:
            return NSLocalizedString(@"XPC Connection Invalid", nil);
        case NSXPCConnectionReplyInvalid:
            return NSLocalizedString(@"XPC Connection Reply Invalid", nil);
        default:
            if (NSFileErrorMinimum >= code
                && code <= NSFileErrorMaximum) {
                return NSLocalizedString(@"File Error", nil);
            } else if (NSValidationErrorMinimum >= code
                       && NSValidationErrorMaximum <= code) {
                return NSLocalizedString(@"Validation Error", nil);
            } else if (NSExecutableErrorMinimum >= code
                       && NSExecutableErrorMaximum <= code) {
                return NSLocalizedString(@"Executable Error", nil);
            } else if (NSFormattingErrorMinimum >= code
                       && NSFormattingErrorMaximum <= code) {
                return NSLocalizedString(@"Formatting Error", nil);
            } else if (NSPropertyListErrorMinimum >= code
                       && NSPropertyListErrorMaximum <= code) {
                return NSLocalizedString(@"Property List Error", nil);
            } else if (NSXPCConnectionErrorMinimum >= code
                       && NSXPCConnectionErrorMaximum <= code) {
                return NSLocalizedString(@"XPC Connection Error", nil);
            }
    }
    return NSLocalizedString(@"Error", nil);
}

+ (NSString *)debugStringFromURLCode:(NSInteger)code
{
    switch (code) {
        case NSURLErrorUnknown:
            return mr_stringize_error_code(NSURLErrorUnknown);
        case NSURLErrorCancelled:
            return mr_stringize_error_code(NSURLErrorCancelled);
        case NSURLErrorBadURL:
            return mr_stringize_error_code(NSURLErrorBadURL);
        case NSURLErrorTimedOut:
            return mr_stringize_error_code(NSURLErrorTimedOut);
        case NSURLErrorUnsupportedURL:
            return mr_stringize_error_code(NSURLErrorUnsupportedURL);
        case NSURLErrorCannotFindHost:
            return mr_stringize_error_code(NSURLErrorCannotFindHost);
        case NSURLErrorCannotConnectToHost:
            return mr_stringize_error_code(NSURLErrorCannotConnectToHost);
        case NSURLErrorNetworkConnectionLost:
            return mr_stringize_error_code(NSURLErrorNetworkConnectionLost);
        case NSURLErrorDNSLookupFailed:
            return mr_stringize_error_code(NSURLErrorDNSLookupFailed);
        case NSURLErrorHTTPTooManyRedirects:
            return mr_stringize_error_code(NSURLErrorHTTPTooManyRedirects);
        case NSURLErrorResourceUnavailable:
            return mr_stringize_error_code(NSURLErrorResourceUnavailable);
        case NSURLErrorNotConnectedToInternet:
            return mr_stringize_error_code(NSURLErrorNotConnectedToInternet);
        case NSURLErrorRedirectToNonExistentLocation:
            return mr_stringize_error_code(NSURLErrorRedirectToNonExistentLocation);
        case NSURLErrorBadServerResponse:
            return mr_stringize_error_code(NSURLErrorBadServerResponse);
        case NSURLErrorUserCancelledAuthentication:
            return mr_stringize_error_code(NSURLErrorUserCancelledAuthentication);
        case NSURLErrorUserAuthenticationRequired:
            return mr_stringize_error_code(NSURLErrorUserAuthenticationRequired);
        case NSURLErrorZeroByteResource:
            return mr_stringize_error_code(NSURLErrorZeroByteResource);
        case NSURLErrorCannotDecodeRawData:
            return mr_stringize_error_code(NSURLErrorCannotDecodeRawData);
        case NSURLErrorCannotDecodeContentData:
            return mr_stringize_error_code(NSURLErrorCannotDecodeContentData);
        case NSURLErrorCannotParseResponse:
            return mr_stringize_error_code(NSURLErrorCannotParseResponse);
        case NSURLErrorFileDoesNotExist:
            return mr_stringize_error_code(NSURLErrorFileDoesNotExist);
        case NSURLErrorFileIsDirectory:
            return mr_stringize_error_code(NSURLErrorFileIsDirectory);
        case NSURLErrorNoPermissionsToReadFile:
            return mr_stringize_error_code(NSURLErrorNoPermissionsToReadFile);
        case NSURLErrorDataLengthExceedsMaximum:
            return mr_stringize_error_code(NSURLErrorDataLengthExceedsMaximum);
        case NSURLErrorSecureConnectionFailed:
            return mr_stringize_error_code(NSURLErrorSecureConnectionFailed);
        case NSURLErrorServerCertificateHasBadDate:
            return mr_stringize_error_code(NSURLErrorServerCertificateHasBadDate);
        case NSURLErrorServerCertificateUntrusted:
            return mr_stringize_error_code(NSURLErrorServerCertificateUntrusted);
        case NSURLErrorServerCertificateHasUnknownRoot:
            return mr_stringize_error_code(NSURLErrorServerCertificateHasUnknownRoot);
        case NSURLErrorServerCertificateNotYetValid:
            return mr_stringize_error_code(NSURLErrorServerCertificateNotYetValid);
        case NSURLErrorClientCertificateRejected:
            return mr_stringize_error_code(NSURLErrorClientCertificateRejected);
        case NSURLErrorClientCertificateRequired:
            return mr_stringize_error_code(NSURLErrorClientCertificateRequired);
        case NSURLErrorCannotLoadFromNetwork:
            return mr_stringize_error_code(NSURLErrorCannotLoadFromNetwork);
        case NSURLErrorCannotCreateFile:
            return mr_stringize_error_code(NSURLErrorCannotCreateFile);
        case NSURLErrorCannotOpenFile:
            return mr_stringize_error_code(NSURLErrorCannotOpenFile);
        case NSURLErrorCannotCloseFile:
            return mr_stringize_error_code(NSURLErrorCannotCloseFile);
        case NSURLErrorCannotWriteToFile:
            return mr_stringize_error_code(NSURLErrorCannotWriteToFile);
        case NSURLErrorCannotRemoveFile:
            return mr_stringize_error_code(NSURLErrorCannotRemoveFile);
        case NSURLErrorCannotMoveFile:
            return mr_stringize_error_code(NSURLErrorCannotMoveFile);
        case NSURLErrorDownloadDecodingFailedMidStream:
            return mr_stringize_error_code(NSURLErrorDownloadDecodingFailedMidStream);
        case NSURLErrorDownloadDecodingFailedToComplete:
            return mr_stringize_error_code(NSURLErrorDownloadDecodingFailedToComplete);
        case NSURLErrorInternationalRoamingOff:
            return mr_stringize_error_code(NSURLErrorInternationalRoamingOff);
        case NSURLErrorCallIsActive:
            return mr_stringize_error_code(NSURLErrorCallIsActive);
        case NSURLErrorDataNotAllowed:
            return mr_stringize_error_code(NSURLErrorDataNotAllowed);
        case NSURLErrorRequestBodyStreamExhausted:
            return mr_stringize_error_code(NSURLErrorRequestBodyStreamExhausted);
    }
    return @(code).stringValue;
}

+ (NSString *)stringFromURLCode:(NSInteger)code
{
    switch (code) {
        case NSURLErrorUnknown:
            return NSLocalizedString(@"Unknown Error", nil);
        case NSURLErrorCancelled:
            return NSLocalizedString(@"Cancelled", nil);
        case NSURLErrorBadURL:
            return NSLocalizedString(@"Bad URL", nil);
        case NSURLErrorTimedOut:
            return NSLocalizedString(@"Timed Out", nil);
        case NSURLErrorUnsupportedURL:
            return NSLocalizedString(@"Unsupported URL", nil);
        case NSURLErrorCannotFindHost:
            return NSLocalizedString(@"Cannot Find Host", nil);
        case NSURLErrorCannotConnectToHost:
            return NSLocalizedString(@"Cannot Connect To Host", nil);
        case NSURLErrorNetworkConnectionLost:
            return NSLocalizedString(@"Network Connection Lost", nil);
        case NSURLErrorDNSLookupFailed:
            return NSLocalizedString(@"DNS Lookup Failed", nil);
        case NSURLErrorHTTPTooManyRedirects:
            return NSLocalizedString(@"HTTP Too Many Redirects", nil);
        case NSURLErrorResourceUnavailable:
            return NSLocalizedString(@"Resource Unavailable", nil);
        case NSURLErrorNotConnectedToInternet:
            return NSLocalizedString(@"NotConnectedToInternet", nil);
        case NSURLErrorRedirectToNonExistentLocation:
            return NSLocalizedString(@"RedirectToNonExistentLocation", nil);
        case NSURLErrorBadServerResponse:
            return NSLocalizedString(@"BadServerResponse", nil);
        case NSURLErrorUserCancelledAuthentication:
            return NSLocalizedString(@"User Cancelled Authentication", nil);
        case NSURLErrorUserAuthenticationRequired:
            return NSLocalizedString(@"User Authentication Required", nil);
        case NSURLErrorZeroByteResource:
            return NSLocalizedString(@"Zero Byte Resource", nil);
        case NSURLErrorCannotDecodeRawData:
            return NSLocalizedString(@"Cannot Decode Raw Data", nil);
        case NSURLErrorCannotDecodeContentData:
            return NSLocalizedString(@"Cannot Decode Content Data", nil);
        case NSURLErrorCannotParseResponse:
            return NSLocalizedString(@"Cannot Parse Response", nil);
        case NSURLErrorFileDoesNotExist:
            return NSLocalizedString(@"File Does Not Exist", nil);
        case NSURLErrorFileIsDirectory:
            return NSLocalizedString(@"File Is Directory", nil);
        case NSURLErrorNoPermissionsToReadFile:
            return NSLocalizedString(@"No Permissions To Read File", nil);
        case NSURLErrorDataLengthExceedsMaximum:
            return NSLocalizedString(@"Data Length Exceeds Maximum", nil);
        case NSURLErrorSecureConnectionFailed:
            return NSLocalizedString(@"Secure Connection Failed", nil);
        case NSURLErrorServerCertificateHasBadDate:
            return NSLocalizedString(@"Server Certificate Has Bad Date", nil);
        case NSURLErrorServerCertificateUntrusted:
            return NSLocalizedString(@"Server Certificate Untrusted", nil);
        case NSURLErrorServerCertificateHasUnknownRoot:
            return NSLocalizedString(@"Server Certificate Has Unknown Root", nil);
        case NSURLErrorServerCertificateNotYetValid:
            return NSLocalizedString(@"Server Certificate Not Yet Valid", nil);
        case NSURLErrorClientCertificateRejected:
            return NSLocalizedString(@"Client Certificate Rejected", nil);
        case NSURLErrorClientCertificateRequired:
            return NSLocalizedString(@"Client Certificate Required", nil);
        case NSURLErrorCannotLoadFromNetwork:
            return NSLocalizedString(@"Cannot Load From Network", nil);
        case NSURLErrorCannotCreateFile:
            return NSLocalizedString(@"Cannot Create File", nil);
        case NSURLErrorCannotOpenFile:
            return NSLocalizedString(@"Cannot Open File", nil);
        case NSURLErrorCannotCloseFile:
            return NSLocalizedString(@"Cannot Close File", nil);
        case NSURLErrorCannotWriteToFile:
            return NSLocalizedString(@"Cannot Write To File", nil);
        case NSURLErrorCannotRemoveFile:
            return NSLocalizedString(@"Cannot Remove File", nil);
        case NSURLErrorCannotMoveFile:
            return NSLocalizedString(@"Cannot Move File", nil);
        case NSURLErrorDownloadDecodingFailedMidStream:
            return NSLocalizedString(@"Download Decoding Failed Mid Stream", nil);
        case NSURLErrorDownloadDecodingFailedToComplete:
            return NSLocalizedString(@"Download Decoding Failed To Complete", nil);
        case NSURLErrorInternationalRoamingOff:
            return NSLocalizedString(@"International Roaming Off", nil);
        case NSURLErrorCallIsActive:
            return NSLocalizedString(@"Call Is Active", nil);
        case NSURLErrorDataNotAllowed:
            return NSLocalizedString(@"Data Not Allowed", nil);
        case NSURLErrorRequestBodyStreamExhausted:
            return NSLocalizedString(@"Request Body Stream Exhausted", nil);
    }
    return NSLocalizedString(@"URL Error", nil);
}

+ (NSString *)stringFromHTTPCode:(NSInteger)statusCode
{
    return [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
}

#pragma mark -

#ifdef ACCOUNTS_EXTERN

+ (NSString *)debugStringFromAccountsCode:(NSInteger)code
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

+ (NSString *)stringFromAccountsCode:(NSInteger)code
{
    switch (code) {
        case ACErrorUnknown:
            return NSLocalizedString(@"Unknown Error", nil);
        case ACErrorAccountMissingRequiredProperty:
            return NSLocalizedString(@"Account Missing Required Property", nil);
        case ACErrorAccountAuthenticationFailed:
            return NSLocalizedString(@"Account Authentication Failed");
        case ACErrorAccountTypeInvalid:
            return NSLocalizedString(@"Account Type Invalid", nil);
        case ACErrorAccountAlreadyExists:
            return NSLocalizedString(@"Account Already Exists", nil);
        case ACErrorAccountNotFound:
            return NSLocalizedString(@"Account Not Found", nil);
        case ACErrorPermissionDenied:
            return NSLocalizedString(@"Permission Denied", nil);
        case ACErrorAccessInfoInvalid:
            return NSLocalizedString(@"Access Information Invalid", nil);
    }
    return NSLocalizedString(@"Account Error", nil);
}

#endif

@end
