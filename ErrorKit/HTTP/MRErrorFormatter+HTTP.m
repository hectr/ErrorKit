// MRErrorFormatter+HTTP.m
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

#import "MRErrorFormatter+HTTP.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_HTTP

@implementation MRErrorFormatter (ErrorKit_HTTP)

+ (NSString *)debugStringWithURLCode:(NSInteger const)code
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

+ (NSString *)stringWithURLCode:(NSInteger const)code
{
    switch (code) {
        case NSURLErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case NSURLErrorCancelled:
            return MRErrorKitString(@"Cancelled", nil);
        case NSURLErrorBadURL:
            return MRErrorKitString(@"Bad URL", nil);
        case NSURLErrorTimedOut:
            return MRErrorKitString(@"Timed Out", nil);
        case NSURLErrorUnsupportedURL:
            return MRErrorKitString(@"Unsupported URL", nil);
        case NSURLErrorCannotFindHost:
            return MRErrorKitString(@"Cannot Find Host", nil);
        case NSURLErrorCannotConnectToHost:
            return MRErrorKitString(@"Cannot Connect To Host", nil);
        case NSURLErrorNetworkConnectionLost:
            return MRErrorKitString(@"Connection Lost", nil);
        case NSURLErrorDNSLookupFailed:
            return MRErrorKitString(@"DNS Lookup Failed", nil);
        case NSURLErrorHTTPTooManyRedirects:
            return MRErrorKitString(@"HTTP Too Many Redirects", nil);
        case NSURLErrorResourceUnavailable:
            return MRErrorKitString(@"Resource Unavailable", nil);
        case NSURLErrorNotConnectedToInternet:
            return MRErrorKitString(@"Not Connected To Internet", nil);
        case NSURLErrorRedirectToNonExistentLocation:
            return MRErrorKitString(@"Redirect To Non Existent Location", nil);
        case NSURLErrorBadServerResponse:
            return MRErrorKitString(@"Bad Server Response", nil);
        case NSURLErrorUserCancelledAuthentication:
            return MRErrorKitString(@"User Cancelled Authentication", nil);
        case NSURLErrorUserAuthenticationRequired:
            return MRErrorKitString(@"User Authentication Required", nil);
        case NSURLErrorZeroByteResource:
            return MRErrorKitString(@"Zero Byte Resource", nil);
        case NSURLErrorCannotDecodeRawData:
            return MRErrorKitString(@"Cannot Decode Raw Data", nil);
        case NSURLErrorCannotDecodeContentData:
            return MRErrorKitString(@"Cannot Decode Content Data", nil);
        case NSURLErrorCannotParseResponse:
            return MRErrorKitString(@"Cannot Parse Response", nil);
        case NSURLErrorFileDoesNotExist:
            return MRErrorKitString(@"File Does Not Exist", nil);
        case NSURLErrorFileIsDirectory:
            return MRErrorKitString(@"File Is Directory", nil);
        case NSURLErrorNoPermissionsToReadFile:
            return MRErrorKitString(@"No Permissions To Read File", nil);
        case NSURLErrorDataLengthExceedsMaximum:
            return MRErrorKitString(@"Data Length Exceeds Maximum", nil);
        case NSURLErrorSecureConnectionFailed:
            return MRErrorKitString(@"Secure Connection Failed", nil);
        case NSURLErrorServerCertificateHasBadDate:
            return MRErrorKitString(@"Server Certificate Has Bad Date", nil);
        case NSURLErrorServerCertificateUntrusted:
            return MRErrorKitString(@"Server Certificate Untrusted", nil);
        case NSURLErrorServerCertificateHasUnknownRoot:
            return MRErrorKitString(@"Server Certificate Has Unknown Root", nil);
        case NSURLErrorServerCertificateNotYetValid:
            return MRErrorKitString(@"Server Certificate Not Yet Valid", nil);
        case NSURLErrorClientCertificateRejected:
            return MRErrorKitString(@"Client Certificate Rejected", nil);
        case NSURLErrorClientCertificateRequired:
            return MRErrorKitString(@"Client Certificate Required", nil);
        case NSURLErrorCannotLoadFromNetwork:
            return MRErrorKitString(@"Cannot Load From Network", nil);
        case NSURLErrorCannotCreateFile:
            return MRErrorKitString(@"Cannot Create File", nil);
        case NSURLErrorCannotOpenFile:
            return MRErrorKitString(@"Cannot Open File", nil);
        case NSURLErrorCannotCloseFile:
            return MRErrorKitString(@"Cannot Close File", nil);
        case NSURLErrorCannotWriteToFile:
            return MRErrorKitString(@"Cannot Write To File", nil);
        case NSURLErrorCannotRemoveFile:
            return MRErrorKitString(@"Cannot Remove File", nil);
        case NSURLErrorCannotMoveFile:
            return MRErrorKitString(@"Cannot Move File", nil);
        case NSURLErrorDownloadDecodingFailedMidStream:
            return MRErrorKitString(@"Download Decoding Failed", nil);
        case NSURLErrorDownloadDecodingFailedToComplete:
            return MRErrorKitString(@"Download Decoding Failed To Complete", nil);
        case NSURLErrorInternationalRoamingOff:
            return MRErrorKitString(@"International Roaming Off", nil);
        case NSURLErrorCallIsActive:
            return MRErrorKitString(@"Call Is Active", nil);
        case NSURLErrorDataNotAllowed:
            return MRErrorKitString(@"Data Not Allowed", nil);
        case NSURLErrorRequestBodyStreamExhausted:
            return MRErrorKitString(@"Request Body Stream Exhausted", nil);
    }
    return MRErrorKitString(@"URL Error", nil);
}

+ (NSString *)stringWithHTTPCode:(NSInteger const)statusCode
{
    return [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
}

@end

#endif
