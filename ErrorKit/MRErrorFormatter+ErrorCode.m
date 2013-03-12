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
#ifdef _COREDATADEFINES_H
        case NSManagedObjectValidationError:
            return mr_stringize_error_code(NSManagedObjectValidationError);
        case NSValidationMultipleErrorsError:
            return mr_stringize_error_code(NSValidationMultipleErrorsError);
        case NSValidationMissingMandatoryPropertyError:
            return mr_stringize_error_code(NSValidationMissingMandatoryPropertyError);
        case NSValidationRelationshipLacksMinimumCountError:
            return mr_stringize_error_code(NSValidationRelationshipLacksMinimumCountError);
        case NSValidationRelationshipExceedsMaximumCountError:
            return mr_stringize_error_code(NSValidationRelationshipExceedsMaximumCountError);
        case NSValidationRelationshipDeniedDeleteError:
            return mr_stringize_error_code(NSValidationRelationshipDeniedDeleteError);
        case NSValidationNumberTooLargeError:
            return mr_stringize_error_code(NSValidationNumberTooLargeError);
        case NSValidationNumberTooSmallError:
            return mr_stringize_error_code(NSValidationNumberTooSmallError);
        case NSValidationDateTooLateError:
            return mr_stringize_error_code(NSValidationDateTooLateError);
        case NSValidationDateTooSoonError:
            return mr_stringize_error_code(NSValidationDateTooSoonError);
        case NSValidationInvalidDateError:
            return mr_stringize_error_code(NSValidationInvalidDateError);
        case NSValidationStringTooLongError:
            return mr_stringize_error_code(NSValidationStringTooLongError);
        case NSValidationStringTooShortError:
            return mr_stringize_error_code(NSValidationStringTooShortError);
        case NSValidationStringPatternMatchingError:
            return mr_stringize_error_code(NSValidationStringPatternMatchingError);
        case NSManagedObjectContextLockingError:
            return mr_stringize_error_code(NSManagedObjectContextLockingError);
        case NSPersistentStoreCoordinatorLockingError:
            return mr_stringize_error_code(NSPersistentStoreCoordinatorLockingError);
        case NSManagedObjectReferentialIntegrityError:
            return mr_stringize_error_code(NSManagedObjectReferentialIntegrityError);
        case NSManagedObjectExternalRelationshipError:
            return mr_stringize_error_code(NSManagedObjectExternalRelationshipError);
        case NSManagedObjectMergeError:
            return mr_stringize_error_code(NSManagedObjectMergeError);
        case NSPersistentStoreInvalidTypeError:
            return mr_stringize_error_code(NSPersistentStoreInvalidTypeError);
        case NSPersistentStoreTypeMismatchError:
            return mr_stringize_error_code(NSPersistentStoreTypeMismatchError);
        case NSPersistentStoreIncompatibleSchemaError:
            return mr_stringize_error_code(NSPersistentStoreIncompatibleSchemaError);
        case NSPersistentStoreSaveError:
            return mr_stringize_error_code(NSPersistentStoreSaveError);
        case NSPersistentStoreIncompleteSaveError:
            return mr_stringize_error_code(NSPersistentStoreIncompleteSaveError);
        case NSPersistentStoreSaveConflictsError:
            return mr_stringize_error_code(NSPersistentStoreSaveConflictsError);
        case NSCoreDataError:
            return mr_stringize_error_code(NSCoreDataError);
        case NSPersistentStoreOperationError:
            return mr_stringize_error_code(NSPersistentStoreOperationError);
        case NSPersistentStoreOpenError:
            return mr_stringize_error_code(NSPersistentStoreOpenError);
        case NSPersistentStoreTimeoutError:
            return mr_stringize_error_code(NSPersistentStoreTimeoutError);
        case NSPersistentStoreUnsupportedRequestTypeError:
            return mr_stringize_error_code(NSPersistentStoreUnsupportedRequestTypeError);
        case NSPersistentStoreIncompatibleVersionHashError:
            return mr_stringize_error_code(NSPersistentStoreIncompatibleVersionHashError);
        case NSMigrationError:
            return mr_stringize_error_code(NSMigrationError);
        case NSMigrationCancelledError:
            return mr_stringize_error_code(NSMigrationCancelledError);
        case NSMigrationMissingSourceModelError:
            return mr_stringize_error_code(NSMigrationMissingSourceModelError);
        case NSMigrationMissingMappingModelError:
            return mr_stringize_error_code(NSMigrationMissingMappingModelError);
        case NSMigrationManagerSourceStoreError:
            return mr_stringize_error_code(NSMigrationManagerSourceStoreError);
        case NSMigrationManagerDestinationStoreError:
            return mr_stringize_error_code(NSMigrationManagerDestinationStoreError);
        case NSEntityMigrationPolicyError:
            return mr_stringize_error_code(NSEntityMigrationPolicyError);
        case NSSQLiteError:
            return mr_stringize_error_code(NSSQLiteError);
        case NSInferredMappingModelError:
            return mr_stringize_error_code(NSInferredMappingModelError);
        case NSExternalRecordImportError:
            return mr_stringize_error_code(NSExternalRecordImportError);
#endif
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
            return NSLocalizedString(@"Inapplicable Encoding", nil);
        case NSFileReadUnsupportedSchemeError:
        case NSFileWriteUnsupportedSchemeError:
            return NSLocalizedString(@"Unsupported Scheme", nil);
        case NSFileReadTooLargeError:
            return NSLocalizedString(@"File Too Large", nil);
        case NSFileReadUnknownStringEncodingError:
            return NSLocalizedString(@"Unknown Encoding", nil);
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
            return NSLocalizedString(@"Validation Error", nil);
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
#ifdef _COREDATADEFINES_H
        case NSManagedObjectValidationError:
            return NSLocalizedString(@"Validation Error", nil);
        case NSValidationMultipleErrorsError:
            return NSLocalizedString(@"Multiple Validation Errors", nil);
        case NSValidationMissingMandatoryPropertyError:
            return NSLocalizedString(@"Missing Mandatory Property", nil);
        case NSValidationRelationshipLacksMinimumCountError:
            return NSLocalizedString(@"Relationship Lacks Minimum Count", nil);
        case NSValidationRelationshipExceedsMaximumCountError:
            return NSLocalizedString(@"Relationship Exceeds Maximum Count", nil);
        case NSValidationRelationshipDeniedDeleteError:
            return NSLocalizedString(@"Delete Denied", nil);
        case NSValidationNumberTooLargeError:
            return NSLocalizedString(@"Number Too Large", nil);
        case NSValidationNumberTooSmallError:
            return NSLocalizedString(@"Number Too Small", nil);
        case NSValidationDateTooLateError:
            return NSLocalizedString(@"Date Too Late", nil);
        case NSValidationDateTooSoonError:
            return NSLocalizedString(@"Date Too Soon", nil);
        case NSValidationInvalidDateError:
            return NSLocalizedString(@"Invalid Date", nil);
        case NSValidationStringTooLongError:
            return NSLocalizedString(@"String Too Long", nil);
        case NSValidationStringTooShortError:
            return NSLocalizedString(@"String Too Short", nil);
        case NSValidationStringPatternMatchingError:
            return NSLocalizedString(@"Pattern Matching Error", nil);
        case NSManagedObjectContextLockingError:
        case NSPersistentStoreCoordinatorLockingError:
            return NSLocalizedString(@"Locking Error", nil);
        case NSManagedObjectReferentialIntegrityError:
            return NSLocalizedString(@"Referential Integrity Error", nil);
        case NSManagedObjectExternalRelationshipError:
            return NSLocalizedString(@"External Relationship Error", nil);
        case NSManagedObjectMergeError:
            return NSLocalizedString(@"Merge Error", nil);
        case NSPersistentStoreInvalidTypeError:
            return NSLocalizedString(@"Invalid Type", nil);
        case NSPersistentStoreTypeMismatchError:
            return NSLocalizedString(@"Type Mismatch", nil);
        case NSPersistentStoreIncompatibleSchemaError:
            return NSLocalizedString(@"Incompatible Schema", nil);
        case NSPersistentStoreSaveError:
            return NSLocalizedString(@"Save Error", nil);
        case NSPersistentStoreIncompleteSaveError:
            return NSLocalizedString(@"Incomplete Save", nil);
        case NSPersistentStoreSaveConflictsError:
            return NSLocalizedString(@"Save Conflicts", nil);
        case NSCoreDataError:
            return NSLocalizedString(@"Data Error", nil);
        case NSPersistentStoreOperationError:
            return NSLocalizedString(@"Operation Error", nil);
        case NSPersistentStoreOpenError:
            return NSLocalizedString(@"Persistent Store Open Error", nil);
        case NSPersistentStoreTimeoutError:
            return NSLocalizedString(@"Timed Out", nil);
        case NSPersistentStoreUnsupportedRequestTypeError:
            return NSLocalizedString(@"Unsupported Request Type", nil);
        case NSPersistentStoreIncompatibleVersionHashError:
            return NSLocalizedString(@"Incompatible Version Hash", nil);
        case NSMigrationError:
            return NSLocalizedString(@"Migration Error", nil);
        case NSMigrationCancelledError:
            return NSLocalizedString(@"Migration Cancelled", nil);
        case NSMigrationMissingSourceModelError:
            return NSLocalizedString(@"Missing Source Model", nil);
        case NSMigrationMissingMappingModelError:
            return NSLocalizedString(@"Missing Mapping Model", nil);
        case NSMigrationManagerSourceStoreError:
            return NSLocalizedString(@"Source Store Error", nil);
        case NSMigrationManagerDestinationStoreError:
            return NSLocalizedString(@"Destination Store Error", nil);
        case NSEntityMigrationPolicyError:
            return NSLocalizedString(@"Entity Migration Policy Error", nil);
        case NSSQLiteError:
            return NSLocalizedString(@"Data Base Error", nil);
        case NSInferredMappingModelError:
            return NSLocalizedString(@"Inferred Mapping Model Error", nil);
        case NSExternalRecordImportError:
            return NSLocalizedString(@"External Record Import Error", nil);
#endif
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
    return NSLocalizedString(@"Unknown Error", nil);
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
            return NSLocalizedString(@"Connection Lost", nil);
        case NSURLErrorDNSLookupFailed:
            return NSLocalizedString(@"DNS Lookup Failed", nil);
        case NSURLErrorHTTPTooManyRedirects:
            return NSLocalizedString(@"HTTP Too Many Redirects", nil);
        case NSURLErrorResourceUnavailable:
            return NSLocalizedString(@"Resource Unavailable", nil);
        case NSURLErrorNotConnectedToInternet:
            return NSLocalizedString(@"Not Connected To Internet", nil);
        case NSURLErrorRedirectToNonExistentLocation:
            return NSLocalizedString(@"Redirect To Non Existent Location", nil);
        case NSURLErrorBadServerResponse:
            return NSLocalizedString(@"Bad Server Response", nil);
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
            return NSLocalizedString(@"Download Decoding Failed", nil);
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

#pragma mark -

#if defined(GAD_SIMULATOR_ID) || defined(GAD_SIZE_320x50)

+ (NSString *)debugStringFromAdmobCode:(NSInteger)errorCode
{
    switch (code) {
        case kGADErrorInvalidRequest:
            return mr_stringize_error_code(kGADErrorInvalidRequest);
        case kGADErrorNoFill:
            return mr_stringize_error_code(kGADErrorNoFill);
        case kGADErrorNetworkError:
            return mr_stringize_error_code(kGADErrorNetworkError);
        case kGADErrorServerError:
            return mr_stringize_error_code(kGADErrorServerError);
        case kGADErrorOSVersionTooLow:
            return mr_stringize_error_code(kGADErrorOSVersionTooLow);
        case kGADErrorTimeout:
            return mr_stringize_error_code(kGADErrorTimeout);
        case kGADErrorInterstitialAlreadyUsed:
            return mr_stringize_error_code(kGADErrorInterstitialAlreadyUsed);
        case kGADErrorMediationDataError:
            return mr_stringize_error_code(kGADErrorMediationDataError);
        case kGADErrorMediationAdapterError:
            return mr_stringize_error_code(kGADErrorMediationAdapterError);
        case kGADErrorMediationNoFill:
            return mr_stringize_error_code(kGADErrorMediationNoFill);
        case kGADErrorMediationInvalidAdSize:
            return mr_stringize_error_code(kGADErrorMediationInvalidAdSize);
    }
    return @(code).stringValue;
}

+ (NSString *)stringFromAdmobCode:(NSInteger)errorCode
{
    switch (code) {
        case kGADErrorInvalidRequest:
            return NSLocalizedString(@"Invalid Request", nil);
        case kGADErrorNoFill:
        case kGADErrorMediationNoFill:
            return NSLocalizedString(@"No Ad Error", nil);
        case kGADErrorNetworkError:
            return NSLocalizedString(@"Network Error", nil);
        case kGADErrorServerError:
            return NSLocalizedString(@"Server Error", nil);
        case kGADErrorOSVersionTooLow:
            return NSLocalizedString(@"OS Version Too Low", nil);
        case kGADErrorTimeout:
            return NSLocalizedString(@"Timed Out", nil);
        case kGADErrorInterstitialAlreadyUsed:
            return NSLocalizedString(@"Interstitial Already Used", nil);
        case kGADErrorMediationDataError:
            return NSLocalizedString(@"Invalid Response", nil);
        case kGADErrorMediationAdapterError:
            return NSLocalizedString(@"Mediation Adapter Error", nil);
        case kGADErrorMediationInvalidAdSize:
            return NSLocalizedString(@"Invalid Ad Size", nil);
    }
    return NSLocalizedString(@"Admob Error", nil);
}

#endif

#pragma mark -

#ifdef __CORELOCATION__

+ (NSString *)debugStringFromCoreLocationCode:(NSInteger)code
{
    switch (code) {
        case kCLErrorLocationUnknown:
            return mr_stringize_error_code(kCLErrorLocationUnknown);
        case kCLErrorDenied:
            return mr_stringize_error_code(kCLErrorDenied);
        case kCLErrorNetwork:
            return mr_stringize_error_code(kCLErrorNetwork);
        case kCLErrorHeadingFailure:
            return mr_stringize_error_code(kCLErrorHeadingFailure);
        case kCLErrorRegionMonitoringDenied:
            return mr_stringize_error_code(kCLErrorRegionMonitoringDenied);
        case kCLErrorRegionMonitoringFailure:
            return mr_stringize_error_code(kCLErrorRegionMonitoringFailure);
        case kCLErrorRegionMonitoringSetupDelayed:
            return mr_stringize_error_code(kCLErrorRegionMonitoringSetupDelayed);
        case kCLErrorRegionMonitoringResponseDelayed:
            return mr_stringize_error_code(kCLErrorRegionMonitoringResponseDelayed);
        case kCLErrorGeocodeFoundNoResult:
            return mr_stringize_error_code(kCLErrorGeocodeFoundNoResult);
        case kCLErrorGeocodeFoundPartialResult:
            return mr_stringize_error_code(kCLErrorGeocodeFoundPartialResult);
        case kCLErrorGeocodeCanceled:
            return mr_stringize_error_code(kCLErrorGeocodeCanceled);
        case kCLErrorDeferredFailed:
            return mr_stringize_error_code(kCLErrorDeferredFailed);
        case kCLErrorDeferredNotUpdatingLocation:
            return mr_stringize_error_code(kCLErrorDeferredNotUpdatingLocation);
        case kCLErrorDeferredAccuracyTooLow:
            return mr_stringize_error_code(kCLErrorDeferredAccuracyTooLow);
        case kCLErrorDeferredDistanceFiltered:
            return mr_stringize_error_code(kCLErrorDeferredDistanceFiltered);
        case kCLErrorDeferredCanceled:
            return mr_stringize_error_code(kCLErrorDeferredCanceled);
    }
    return @(code).stringValue;
}

+ (NSString *)stringFromCoreLocationCode:(NSInteger)code
{
    switch (code) {
        case kCLErrorLocationUnknown:
            return NSLocalizedString(@"Location Unknown", nil);
        case kCLErrorDenied:
            return NSLocalizedString(@"Denied", nil);
        case kCLErrorNetwork:
            return NSLocalizedString(@"Network Error", nil);
        case kCLErrorHeadingFailure:
            return NSLocalizedString(@"Heading Failure", nil);
        case kCLErrorRegionMonitoringDenied:
            return NSLocalizedString(@"Region Monitoring Denied", nil);
        case kCLErrorRegionMonitoringFailure:
            return NSLocalizedString(@"Region Monitoring Failure", nil);
        case kCLErrorRegionMonitoringSetupDelayed:
            return NSLocalizedString(@"Region Monitoring Setup Delayed", nil);
        case kCLErrorRegionMonitoringResponseDelayed:
            return NSLocalizedString(@"Region Monitoring Response Delayed", nil);
        case kCLErrorGeocodeFoundNoResult:
            return NSLocalizedString(@"Geocode Found No Result", nil);
        case kCLErrorGeocodeFoundPartialResult:
            return NSLocalizedString(@"Geocode Found Partial Result", nil);
        case kCLErrorGeocodeCanceled:
            return NSLocalizedString(@"Geocode Canceled", nil);
        case kCLErrorDeferredFailed:
            return NSLocalizedString(@"Deferred Update Failed", nil);
        case kCLErrorDeferredNotUpdatingLocation:
            return NSLocalizedString(@"Deferred Not Updating Location", nil);
        case kCLErrorDeferredAccuracyTooLow:
            return NSLocalizedString(@"Deferred Accuracy Too Low", nil);
        case kCLErrorDeferredDistanceFiltered:
            return NSLocalizedString(@"Cannot Filter Deferred Distance", nil);
        case kCLErrorDeferredCanceled:
            return NSLocalizedString(@"Deferred Update Canceled", nil);
    }
    return NSLocalizedString(@"Location Error", nil);
}

#endif

#pragma mark -

#ifdef _JSONKIT_H_

+ (NSString *)debugStringFromJSONKitCode:(NSInteger)code
{
    return @(code).stringValue;
}

+ (NSString *)stringFromCoreLocationCode:(NSInteger)code
{
    return NSLocalizedString(@"JSON Error", nil);
}

#endif

#pragma mark -

#ifdef _SECURITY_SECITEM_H_

+ (NSString *)debugStringFromKeychainServiceCode:(NSInteger)code
{
    switch (code) {
        case errSecSuccess:
            return mr_stringize_error_code(errSecSuccess);
        case errSecUnimplemented:
            return mr_stringize_error_code(errSecUnimplemented);
        case errSecParam:
            return mr_stringize_error_code(errSecParam);
        case errSecAllocate:
            return mr_stringize_error_code(errSecAllocate);
        case errSecNotAvailable:
            return mr_stringize_error_code(errSecNotAvailable);
        case errSecAuthFailed:
            return mr_stringize_error_code(errSecAuthFailed);
        case errSecDuplicateItem:
            return mr_stringize_error_code(errSecDuplicateItem);
        case errSecItemNotFound:
            return mr_stringize_error_code(errSecItemNotFound);
        case errSecInteractionNotAllowed:
            return mr_stringize_error_code(errSecInteractionNotAllowed);
    }
    return @(code).stringValue;
}

+ (NSString *)stringFromKeychainServiceCode:(NSInteger)code
{
    switch (code) {
        case errSecSuccess:
            return NSLocalizedString(@"No Error", nil);
        case errSecUnimplemented:
            return NSLocalizedString(@"Unimplemented", nil);
        case errSecParam:
            return NSLocalizedString(@"Invalid Parameter", nil);
        case errSecAllocate:
            return NSLocalizedString(@"Memory Allocation Error", nil);
        case errSecNotAvailable:
            return NSLocalizedString(@"No Trust Results Available", nil);
        case errSecAuthFailed:
            return NSLocalizedString(@"Authorization/Authentication Failed", nil);
        case errSecDuplicateItem:
            return NSLocalizedString(@"Item Already Exists", nil);
        case errSecItemNotFound:
            return NSLocalizedString(@"Item Not Found", nil);
        case errSecInteractionNotAllowed:
            return NSLocalizedString(@"Interaction Not Allowed", nil);
    }
    return NSLocalizedString(@"Keychain Error", nil);
}

#endif

@end
