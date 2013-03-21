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

+ (NSString *)debugStringWithCocoaCode:(NSInteger)code
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

+ (NSString *)stringWithCocoaCode:(NSInteger)code
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

+ (NSString *)debugStringWithURLCode:(NSInteger)code
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

+ (NSString *)stringWithURLCode:(NSInteger)code
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

+ (NSString *)debugStringWithXMLParserCode:(NSInteger)code
{
    switch (code) {
        case NSXMLParserInternalError:
            return mr_stringize_error_code(NSXMLParserInternalError);
        case NSXMLParserOutOfMemoryError:
            return mr_stringize_error_code(NSXMLParserOutOfMemoryError);
        case NSXMLParserDocumentStartError:
            return mr_stringize_error_code(NSXMLParserDocumentStartError);
        case NSXMLParserEmptyDocumentError:
            return mr_stringize_error_code(NSXMLParserEmptyDocumentError);
        case NSXMLParserPrematureDocumentEndError:
            return mr_stringize_error_code(NSXMLParserPrematureDocumentEndError);
        case NSXMLParserInvalidHexCharacterRefError:
            return mr_stringize_error_code(NSXMLParserInvalidHexCharacterRefError);
        case NSXMLParserInvalidDecimalCharacterRefError:
            return mr_stringize_error_code(NSXMLParserInvalidDecimalCharacterRefError);
        case NSXMLParserInvalidCharacterRefError:
            return mr_stringize_error_code(NSXMLParserInvalidCharacterRefError);
        case NSXMLParserInvalidCharacterError:
            return mr_stringize_error_code(NSXMLParserInvalidCharacterError);
        case NSXMLParserCharacterRefAtEOFError:
            return mr_stringize_error_code(NSXMLParserCharacterRefAtEOFError);
        case NSXMLParserCharacterRefInPrologError:
            return mr_stringize_error_code(NSXMLParserCharacterRefInPrologError);
        case NSXMLParserCharacterRefInEpilogError:
            return mr_stringize_error_code(NSXMLParserCharacterRefInEpilogError);
        case NSXMLParserCharacterRefInDTDError:
            return mr_stringize_error_code(NSXMLParserCharacterRefInDTDError);
        case NSXMLParserEntityRefAtEOFError:
            return mr_stringize_error_code(NSXMLParserEntityRefAtEOFError);
        case NSXMLParserEntityRefInPrologError:
            return mr_stringize_error_code(NSXMLParserEntityRefInPrologError);
        case NSXMLParserEntityRefInEpilogError:
            return mr_stringize_error_code(NSXMLParserEntityRefInEpilogError);
        case NSXMLParserEntityRefInDTDError:
            return mr_stringize_error_code(NSXMLParserEntityRefInDTDError);
        case NSXMLParserParsedEntityRefAtEOFError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefAtEOFError);
        case NSXMLParserParsedEntityRefInPrologError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefInPrologError);
        case NSXMLParserParsedEntityRefInEpilogError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefInEpilogError);
        case NSXMLParserParsedEntityRefInInternalSubsetError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefInInternalSubsetError);
        case NSXMLParserEntityReferenceWithoutNameError:
            return mr_stringize_error_code(NSXMLParserEntityReferenceWithoutNameError);
        case NSXMLParserEntityReferenceMissingSemiError:
            return mr_stringize_error_code(NSXMLParserEntityReferenceMissingSemiError);
        case NSXMLParserParsedEntityRefNoNameError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefNoNameError);
        case NSXMLParserParsedEntityRefMissingSemiError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefMissingSemiError);
        case NSXMLParserUndeclaredEntityError:
            return mr_stringize_error_code(NSXMLParserUndeclaredEntityError);
        case NSXMLParserUnparsedEntityError:
            return mr_stringize_error_code(NSXMLParserUnparsedEntityError);
        case NSXMLParserEntityIsExternalError:
            return mr_stringize_error_code(NSXMLParserEntityIsExternalError);
        case NSXMLParserEntityIsParameterError:
            return mr_stringize_error_code(NSXMLParserEntityIsParameterError);
        case NSXMLParserUnknownEncodingError:
            return mr_stringize_error_code(NSXMLParserUnknownEncodingError);
        case NSXMLParserEncodingNotSupportedError:
            return mr_stringize_error_code(NSXMLParserEncodingNotSupportedError);
        case NSXMLParserStringNotStartedError:
            return mr_stringize_error_code(NSXMLParserStringNotStartedError);
        case NSXMLParserStringNotClosedError:
            return mr_stringize_error_code(NSXMLParserStringNotClosedError);
        case NSXMLParserNamespaceDeclarationError:
            return mr_stringize_error_code(NSXMLParserNamespaceDeclarationError);
        case NSXMLParserEntityNotStartedError:
            return mr_stringize_error_code(NSXMLParserEntityNotStartedError);
        case NSXMLParserEntityNotFinishedError:
            return mr_stringize_error_code(NSXMLParserEntityNotFinishedError);
        case NSXMLParserLessThanSymbolInAttributeError:
            return mr_stringize_error_code(NSXMLParserLessThanSymbolInAttributeError);
        case NSXMLParserAttributeNotStartedError:
            return mr_stringize_error_code(NSXMLParserAttributeNotStartedError);
        case NSXMLParserAttributeNotFinishedError:
            return mr_stringize_error_code(NSXMLParserAttributeNotFinishedError);
        case NSXMLParserAttributeHasNoValueError:
            return mr_stringize_error_code(NSXMLParserAttributeHasNoValueError);
        case NSXMLParserAttributeRedefinedError:
            return mr_stringize_error_code(NSXMLParserAttributeRedefinedError);
        case NSXMLParserLiteralNotStartedError:
            return mr_stringize_error_code(NSXMLParserLiteralNotStartedError);
        case NSXMLParserLiteralNotFinishedError:
            return mr_stringize_error_code(NSXMLParserLiteralNotFinishedError);
        case NSXMLParserCommentNotFinishedError:
            return mr_stringize_error_code(NSXMLParserCommentNotFinishedError);
        case NSXMLParserProcessingInstructionNotStartedError:
            return mr_stringize_error_code(NSXMLParserProcessingInstructionNotStartedError);
        case NSXMLParserProcessingInstructionNotFinishedError:
            return mr_stringize_error_code(NSXMLParserProcessingInstructionNotFinishedError);
        case NSXMLParserNotationNotStartedError:
            return mr_stringize_error_code(NSXMLParserNotationNotStartedError);
        case NSXMLParserNotationNotFinishedError:
            return mr_stringize_error_code(NSXMLParserNotationNotFinishedError);
        case NSXMLParserAttributeListNotStartedError:
            return mr_stringize_error_code(NSXMLParserAttributeListNotStartedError);
        case NSXMLParserAttributeListNotFinishedError:
            return mr_stringize_error_code(NSXMLParserAttributeListNotFinishedError);
        case NSXMLParserMixedContentDeclNotStartedError:
            return mr_stringize_error_code(NSXMLParserMixedContentDeclNotStartedError);
        case NSXMLParserMixedContentDeclNotFinishedError:
            return mr_stringize_error_code(NSXMLParserMixedContentDeclNotFinishedError);
        case NSXMLParserElementContentDeclNotStartedError:
            return mr_stringize_error_code(NSXMLParserElementContentDeclNotStartedError);
        case NSXMLParserElementContentDeclNotFinishedError:
            return mr_stringize_error_code(NSXMLParserElementContentDeclNotFinishedError);
        case NSXMLParserXMLDeclNotStartedError:
            return mr_stringize_error_code(NSXMLParserXMLDeclNotStartedError);
        case NSXMLParserXMLDeclNotFinishedError:
            return mr_stringize_error_code(NSXMLParserXMLDeclNotFinishedError);
        case NSXMLParserConditionalSectionNotStartedError:
            return mr_stringize_error_code(NSXMLParserConditionalSectionNotStartedError);
        case NSXMLParserConditionalSectionNotFinishedError:
            return mr_stringize_error_code(NSXMLParserConditionalSectionNotFinishedError);
        case NSXMLParserExternalSubsetNotFinishedError:
            return mr_stringize_error_code(NSXMLParserExternalSubsetNotFinishedError);
        case NSXMLParserDOCTYPEDeclNotFinishedError:
            return mr_stringize_error_code(NSXMLParserDOCTYPEDeclNotFinishedError);
        case NSXMLParserMisplacedCDATAEndStringError:
            return mr_stringize_error_code(NSXMLParserMisplacedCDATAEndStringError);
        case NSXMLParserCDATANotFinishedError:
            return mr_stringize_error_code(NSXMLParserCDATANotFinishedError);
        case NSXMLParserMisplacedXMLDeclarationError:
            return mr_stringize_error_code(NSXMLParserMisplacedXMLDeclarationError);
        case NSXMLParserSpaceRequiredError:
            return mr_stringize_error_code(NSXMLParserSpaceRequiredError);
        case NSXMLParserSeparatorRequiredError:
            return mr_stringize_error_code(NSXMLParserSeparatorRequiredError);
        case NSXMLParserNMTOKENRequiredError:
            return mr_stringize_error_code(NSXMLParserNMTOKENRequiredError);
        case NSXMLParserNAMERequiredError:
            return mr_stringize_error_code(NSXMLParserNAMERequiredError);
        case NSXMLParserPCDATARequiredError:
            return mr_stringize_error_code(NSXMLParserPCDATARequiredError);
        case NSXMLParserURIRequiredError:
            return mr_stringize_error_code(NSXMLParserURIRequiredError);
        case NSXMLParserPublicIdentifierRequiredError:
            return mr_stringize_error_code(NSXMLParserPublicIdentifierRequiredError);
        case NSXMLParserLTRequiredError:
            return mr_stringize_error_code(NSXMLParserLTRequiredError);
        case NSXMLParserGTRequiredError:
            return mr_stringize_error_code(NSXMLParserGTRequiredError);
        case NSXMLParserLTSlashRequiredError:
            return mr_stringize_error_code(NSXMLParserLTSlashRequiredError);
        case NSXMLParserEqualExpectedError:
            return mr_stringize_error_code(NSXMLParserEqualExpectedError);
        case NSXMLParserTagNameMismatchError:
            return mr_stringize_error_code(NSXMLParserTagNameMismatchError);
        case NSXMLParserUnfinishedTagError:
            return mr_stringize_error_code(NSXMLParserUnfinishedTagError);
        case NSXMLParserStandaloneValueError:
            return mr_stringize_error_code(NSXMLParserStandaloneValueError);
        case NSXMLParserInvalidEncodingNameError:
            return mr_stringize_error_code(NSXMLParserInvalidEncodingNameError);
        case NSXMLParserCommentContainsDoubleHyphenError:
            return mr_stringize_error_code(NSXMLParserCommentContainsDoubleHyphenError);
        case NSXMLParserInvalidEncodingError:
            return mr_stringize_error_code(NSXMLParserInvalidEncodingError);
        case NSXMLParserExternalStandaloneEntityError:
            return mr_stringize_error_code(NSXMLParserExternalStandaloneEntityError);
        case NSXMLParserInvalidConditionalSectionError:
            return mr_stringize_error_code(NSXMLParserInvalidConditionalSectionError);
        case NSXMLParserEntityValueRequiredError:
            return mr_stringize_error_code(NSXMLParserEntityValueRequiredError);
        case NSXMLParserNotWellBalancedError:
            return mr_stringize_error_code(NSXMLParserNotWellBalancedError);
        case NSXMLParserExtraContentError:
            return mr_stringize_error_code(NSXMLParserExtraContentError);
        case NSXMLParserInvalidCharacterInEntityError:
            return mr_stringize_error_code(NSXMLParserInvalidCharacterInEntityError);
        case NSXMLParserParsedEntityRefInInternalError:
            return mr_stringize_error_code(NSXMLParserParsedEntityRefInInternalError);
        case NSXMLParserEntityRefLoopError:
            return mr_stringize_error_code(NSXMLParserEntityRefLoopError);
        case NSXMLParserEntityBoundaryError:
            return mr_stringize_error_code(NSXMLParserEntityBoundaryError);
        case NSXMLParserInvalidURIError:
            return mr_stringize_error_code(NSXMLParserInvalidURIError);
        case NSXMLParserURIFragmentError:
            return mr_stringize_error_code(NSXMLParserURIFragmentError);
        case NSXMLParserNoDTDError:
            return mr_stringize_error_code(NSXMLParserNoDTDError);
        case NSXMLParserDelegateAbortedParseError:
            return mr_stringize_error_code(NSXMLParserDelegateAbortedParseError);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithXMLParserCode:(NSInteger)code
{
    switch (code) {
        case NSXMLParserInternalError:
            return NSLocalizedString(@"Internal Error", nil);
        case NSXMLParserOutOfMemoryError:
            return NSLocalizedString(@"Out Of Memory", nil);
        case NSXMLParserDocumentStartError:
            return NSLocalizedString(@"Document Start Error", nil);
        case NSXMLParserEmptyDocumentError:
            return NSLocalizedString(@"Empty Document", nil);
        case NSXMLParserPrematureDocumentEndError:
            return NSLocalizedString(@"Premature Document End", nil);
        case NSXMLParserInvalidHexCharacterRefError:
            return NSLocalizedString(@"Invalid Hex Character Reference", nil);
        case NSXMLParserInvalidDecimalCharacterRefError:
            return NSLocalizedString(@"Invalid Decimal Character Reference", nil);
        case NSXMLParserInvalidCharacterRefError:
            return NSLocalizedString(@"Invalid Character", nil);
        case NSXMLParserInvalidCharacterError:
            return NSLocalizedString(@"Invalid Character", nil);
        case NSXMLParserCharacterRefAtEOFError:
            return NSLocalizedString(@"Character Reference Target Not Found", nil);
        case NSXMLParserCharacterRefInPrologError:
            return NSLocalizedString(@"Invalid Character Reference In Prolog", nil);
        case NSXMLParserCharacterRefInEpilogError:
            return NSLocalizedString(@"Invalid Character Reference In Epilog", nil);
        case NSXMLParserCharacterRefInDTDError:
            return NSLocalizedString(@"Invalid Character Reference In DTD", nil);
        case NSXMLParserEntityRefAtEOFError:
            return NSLocalizedString(@"Entity Reference Target Not Found", nil);
        case NSXMLParserEntityRefInPrologError:
            return NSLocalizedString(@"Invalid Entity Reference In Prolog", nil);
        case NSXMLParserEntityRefInEpilogError:
            return NSLocalizedString(@"Invalid Entity Reference In Epilog", nil);
        case NSXMLParserEntityRefInDTDError:
            return NSLocalizedString(@"Invalid Entity Reference In DTD", nil);
        case NSXMLParserParsedEntityRefAtEOFError:
            return NSLocalizedString(@"Entity Reference Target Not Found", nil);
        case NSXMLParserParsedEntityRefInPrologError:
            return NSLocalizedString(@"Entity Reference Target Not Found In Prolog", nil);
        case NSXMLParserParsedEntityRefInEpilogError:
            return NSLocalizedString(@"Entity Reference Target Not Found In Epilog", nil);
        case NSXMLParserParsedEntityRefInInternalSubsetError:
            return NSLocalizedString(@"Entity Reference Target Not Found In Internal Subset", nil);
        case NSXMLParserEntityReferenceWithoutNameError:
            return NSLocalizedString(@"Entity Reference Without Name", nil);
        case NSXMLParserEntityReferenceMissingSemiError:
            return NSLocalizedString(@"Entity Reference Missing Semicolon", nil);
        case NSXMLParserParsedEntityRefNoNameError:
            return NSLocalizedString(@"Parsed Entity Reference Without Name", nil);
        case NSXMLParserParsedEntityRefMissingSemiError:
            return NSLocalizedString(@"Parsed Entity Reference Missing Semicolon", nil);
        case NSXMLParserUndeclaredEntityError:
            return NSLocalizedString(@"Undeclared Entity", nil);
        case NSXMLParserUnparsedEntityError:
            return NSLocalizedString(@"Cannot Parse Entity", nil);
        case NSXMLParserEntityIsExternalError:
            return NSLocalizedString(@"Cannot Parse External Entity", nil);
        case NSXMLParserEntityIsParameterError:
            return NSLocalizedString(@"Entity Is Parameter Error", nil);
        case NSXMLParserUnknownEncodingError:
            return NSLocalizedString(@"Unknown Encoding", nil);
        case NSXMLParserEncodingNotSupportedError:
            return NSLocalizedString(@"Encoding Not Supported", nil);
        case NSXMLParserStringNotStartedError:
            return NSLocalizedString(@"String Not Started", nil);
        case NSXMLParserStringNotClosedError:
            return NSLocalizedString(@"String Not Closed", nil);
        case NSXMLParserNamespaceDeclarationError:
            return NSLocalizedString(@"Invalid Namespace Declaration", nil);
        case NSXMLParserEntityNotStartedError:
            return NSLocalizedString(@"Entity Not Started", nil);
        case NSXMLParserEntityNotFinishedError:
            return NSLocalizedString(@"Entity Not Finished", nil);
        case NSXMLParserLessThanSymbolInAttributeError:
            return NSLocalizedString(@"'<' Used In Attribute Error", nil);
        case NSXMLParserAttributeNotStartedError:
            return NSLocalizedString(@"Attribute Not Started", nil);
        case NSXMLParserAttributeNotFinishedError:
            return NSLocalizedString(@"Attribute Not Finished", nil);
        case NSXMLParserAttributeHasNoValueError:
            return NSLocalizedString(@"Attribute Has No Value", nil);
        case NSXMLParserAttributeRedefinedError:
            return NSLocalizedString(@"Attribute Redefined", nil);
        case NSXMLParserLiteralNotStartedError:
            return NSLocalizedString(@"Literal Not Started", nil);
        case NSXMLParserLiteralNotFinishedError:
            return NSLocalizedString(@"Literal Not Finished", nil);
        case NSXMLParserCommentNotFinishedError:
            return NSLocalizedString(@"Comment Not Finished", nil);
        case NSXMLParserProcessingInstructionNotStartedError:
            return NSLocalizedString(@"Processing Instruction Not Started", nil);
        case NSXMLParserProcessingInstructionNotFinishedError:
            return NSLocalizedString(@"Processing Instruction Not Finished", nil);
        case NSXMLParserNotationNotStartedError:
            return NSLocalizedString(@"Notation Not Started", nil);
        case NSXMLParserNotationNotFinishedError:
            return NSLocalizedString(@"Notation Not Finished", nil);
        case NSXMLParserAttributeListNotStartedError:
            return NSLocalizedString(@"Attribute List Not Started", nil);
        case NSXMLParserAttributeListNotFinishedError:
            return NSLocalizedString(@"Attribute List Not Finished", nil);
        case NSXMLParserMixedContentDeclNotStartedError:
            return NSLocalizedString(@"Mixed Content Declaration Not Started", nil);
        case NSXMLParserMixedContentDeclNotFinishedError:
            return NSLocalizedString(@"Mixed Content Declaration Not Finished", nil);
        case NSXMLParserElementContentDeclNotStartedError:
            return NSLocalizedString(@"Element Content Declaration Not Started", nil);
        case NSXMLParserElementContentDeclNotFinishedError:
            return NSLocalizedString(@"Element Content Declaration Not Finished", nil);
        case NSXMLParserXMLDeclNotStartedError:
            return NSLocalizedString(@"XML Declaration Not Started", nil);
        case NSXMLParserXMLDeclNotFinishedError:
            return NSLocalizedString(@"XML Declaration Not Finished", nil);
        case NSXMLParserConditionalSectionNotStartedError:
            return NSLocalizedString(@"Conditional Section Not Started", nil);
        case NSXMLParserConditionalSectionNotFinishedError:
            return NSLocalizedString(@"Conditional Section Not Finished", nil);
        case NSXMLParserExternalSubsetNotFinishedError:
            return NSLocalizedString(@"External Subset Not Finished", nil);
        case NSXMLParserDOCTYPEDeclNotFinishedError:
            return NSLocalizedString(@"DOCTYPE Declaration Not Finished", nil);
        case NSXMLParserMisplacedCDATAEndStringError:
            return NSLocalizedString(@"Misplaced CDATA End String", nil);
        case NSXMLParserCDATANotFinishedError:
            return NSLocalizedString(@"CDATA Not Finished", nil);
        case NSXMLParserMisplacedXMLDeclarationError:
            return NSLocalizedString(@"Misplaced XML Declaration", nil);
        case NSXMLParserSpaceRequiredError:
            return NSLocalizedString(@"Space Required", nil);
        case NSXMLParserSeparatorRequiredError:
            return NSLocalizedString(@"Separator Required", nil);
        case NSXMLParserNMTOKENRequiredError:
            return NSLocalizedString(@"NAME Token Required", nil);
        case NSXMLParserNAMERequiredError:
            return NSLocalizedString(@"NAME Required", nil);
        case NSXMLParserPCDATARequiredError:
            return NSLocalizedString(@"CDATA Required", nil);
        case NSXMLParserURIRequiredError:
            return NSLocalizedString(@"URI Required", nil);
        case NSXMLParserPublicIdentifierRequiredError:
            return NSLocalizedString(@"Public Identifier Required", nil);
        case NSXMLParserLTRequiredError:
            return NSLocalizedString(@"'<' Required", nil);
        case NSXMLParserGTRequiredError:
            return NSLocalizedString(@"'>' Required", nil);
        case NSXMLParserLTSlashRequiredError:
            return NSLocalizedString(@"'</' Required", nil);
        case NSXMLParserEqualExpectedError:
            return NSLocalizedString(@"'=' Expected", nil);
        case NSXMLParserTagNameMismatchError:
            return NSLocalizedString(@"Tag Name Mismatch", nil);
        case NSXMLParserUnfinishedTagError:
            return NSLocalizedString(@"Unfinished Tag", nil);
        case NSXMLParserStandaloneValueError:
            return NSLocalizedString(@"Standalone Value Error", nil);
        case NSXMLParserInvalidEncodingNameError:
            return NSLocalizedString(@"Invalid Encoding Name", nil);
        case NSXMLParserCommentContainsDoubleHyphenError:
            return NSLocalizedString(@"Comment Contains Double Hyphen", nil);
        case NSXMLParserInvalidEncodingError:
            return NSLocalizedString(@"Invalid Encoding", nil);
        case NSXMLParserExternalStandaloneEntityError:
            return NSLocalizedString(@"External Standalone Entity Error", nil);
        case NSXMLParserInvalidConditionalSectionError:
            return NSLocalizedString(@"Invalid Conditional Section", nil);
        case NSXMLParserEntityValueRequiredError:
            return NSLocalizedString(@"Entity Value Required", nil);
        case NSXMLParserNotWellBalancedError:
            return NSLocalizedString(@"Not Well Balanced", nil);
        case NSXMLParserExtraContentError:
            return NSLocalizedString(@"Extra Content Error", nil);
        case NSXMLParserInvalidCharacterInEntityError:
            return NSLocalizedString(@"Invalid Character In Entity", nil);
        case NSXMLParserParsedEntityRefInInternalError:
            return NSLocalizedString(@"Internal Error In Parsed Entity Reference", nil);
        case NSXMLParserEntityRefLoopError:
            return NSLocalizedString(@"Entity Reference Loop Error", nil);
        case NSXMLParserEntityBoundaryError:
            return NSLocalizedString(@"Entity Boundary Error", nil);
        case NSXMLParserInvalidURIError:
            return NSLocalizedString(@"Invalid URI", nil);
        case NSXMLParserURIFragmentError:
            return NSLocalizedString(@"URI Fragment Error", nil);
        case NSXMLParserNoDTDError:
            return NSLocalizedString(@"Missing DTD", nil);
        case NSXMLParserDelegateAbortedParseError:
            return NSLocalizedString(@"Delegate Aborted Parse", nil);
    }
    return NSLocalizedString(@"XML Error", nil);
}

#pragma mark -

#ifdef ACCOUNTS_EXTERN

+ (NSString *)debugStringWithAccountsCode:(NSInteger)code
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

+ (NSString *)stringWithAccountsCode:(NSInteger)code
{
    switch (code) {
        case ACErrorUnknown:
            return NSLocalizedString(@"Unknown Error", nil);
        case ACErrorAccountMissingRequiredProperty:
            return NSLocalizedString(@"Account Missing Required Property", nil);
        case ACErrorAccountAuthenticationFailed:
            return NSLocalizedString(@"Account Authentication Failed", nil);
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

+ (NSString *)debugStringWithAdmobCode:(NSInteger)code
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

+ (NSString *)stringWithAdmobCode:(NSInteger)code
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

+ (NSString *)debugStringWithCoreLocationCode:(NSInteger)code
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
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
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
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithCoreLocationCode:(NSInteger)code
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
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
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
#endif
    }
    return NSLocalizedString(@"Location Error", nil);
}

#endif

#pragma mark -

#ifdef FB_SESSIONSTATETERMINALBIT

+ (NSString *)debugStringWithFacebookCode:(NSInteger)code
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
        case FBErrorNativeDialog:
            return mr_stringize_error_code(FBErrorNativeDialog);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithFacebookCode:(NSInteger)errorCode
{
    switch (code) {
        case FBErrorInvalid:
            return NSlocalizedString(@"Invalid Error", nil);
        case FBErrorOperationCancelled:
            return NSlocalizedString(@"Operation Cancelled", nil);
        case FBErrorLoginFailedOrCancelled:
            return NSlocalizedString(@"Login Failed Or Cancelled", nil);
        case FBErrorRequestConnectionApi:
            return NSlocalizedString(@"Graph Error", nil);
        case FBErrorProtocolMismatch:
            return NSlocalizedString(@"Protocol Mismatch", nil);
        case FBErrorHTTPError:
            return NSlocalizedString(@"HTTP Error", nil);
        case FBErrorNonTextMimeTypeReturned:
            return NSlocalizedString(@"Invalid Response", nil);
        case FBErrorNativeDialog:
            return NSlocalizedString(@"Native Dialog Error", nil);
    }
    return NSLocalizedString(@"Facebook Error", nil);
}

#endif

#pragma mark -

+ (NSString *)stringWithHTTPCode:(NSInteger)statusCode
{
    return [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
}

#pragma mark -

#ifdef ERROR_KIT_IAD

+ (NSString *)debugStringWithIADCode:(NSInteger)code
{
    switch (code) {
        case ADErrorUnknown:
            return mr_stringize_error_code(ADErrorUnknown);
        case ADErrorServerFailure:
            return mr_stringize_error_code(ADErrorServerFailure);
        case ADErrorLoadingThrottled:
            return mr_stringize_error_code(ADErrorLoadingThrottled);
        case ADErrorInventoryUnavailable:
            return mr_stringize_error_code(ADErrorInventoryUnavailable);
        case ADErrorConfigurationError:
            return mr_stringize_error_code(ADErrorConfigurationError);
        case ADErrorBannerVisibleWithoutContent:
            return mr_stringize_error_code(ADErrorBannerVisibleWithoutContent);
        case ADErrorApplicationInactive:
            return mr_stringize_error_code(ADErrorApplicationInactive);
#if __IPHONE_6_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
        case ADErrorAdUnloaded:
            return mr_stringize_error_code(ADErrorAdUnloaded);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithIADCode:(NSInteger)code
{
    switch (code) {
        case ADErrorUnknown:
            return NSLocalizedString(@"Unknown Error", nil);
        case ADErrorServerFailure:
            return NSLocalizedString(@"Server Failure", nil);
        case ADErrorLoadingThrottled:
            return NSLocalizedString(@"Loading Throttled", nil);
        case ADErrorInventoryUnavailable:
            return NSLocalizedString(@"Inventory Unavailable", nil);
        case ADErrorConfigurationError:
            return NSLocalizedString(@"Configuration Error", nil);
        case ADErrorBannerVisibleWithoutContent:
            return NSLocalizedString(@"Banner Visible Without Content", nil);
        case ADErrorApplicationInactive:
            return NSLocalizedString(@"Application Inactive Error", nil);
#if __IPHONE_6_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
        case ADErrorAdUnloaded:
            return NSLocalizedString(@"Ad Unloaded Error", nil);
#endif
    }
    return NSLocalizedString(@"iAd Error", nil);
}

#endif

#pragma mark -

+ (NSString *)debugStringWithJSONKitCode:(NSInteger)code
{
    return @(code).stringValue;
}

+ (NSString *)stringWithJSONKitCode:(NSInteger)code
{
    return NSLocalizedString(@"JSON Error", nil);
}

#pragma mark -

#ifdef MK_EXTERN

+ (NSString *)debugStringWithMapKitCode:(NSInteger)code
{
    switch (code) {
        case MKErrorUnknown:
            return mr_stringize_error_code(MKErrorUnknown);
        case MKErrorServerFailure:
            return mr_stringize_error_code(MKErrorServerFailure);
        case MKErrorLoadingThrottled:
            return mr_stringize_error_code(MKErrorLoadingThrottled);
        case MKErrorPlacemarkNotFound:
            return mr_stringize_error_code(MKErrorPlacemarkNotFound);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithMapKitCode:(NSInteger)code
{
    switch (code) {
        case MKErrorUnknown:
            return NSLocalizedString(@"Unknown Error", nil);
        case MKErrorServerFailure:
            return NSLocalizedString(@"Server Error", nil);
        case MKErrorLoadingThrottled:
            return NSLocalizedString(@"Loading Throttled Error", nil);
        case MKErrorPlacemarkNotFound:
            return NSLocalizedString(@"Placemark Not Found", nil);
    }
    return NSLocalizedString(@"Map Error", nil);
}

#endif

#pragma mark -

#ifdef ERROR_KIT_MESSAGE_UI

+ (NSString *)debugStringWithMailComposeCode:(NSInteger)code
{
    switch (code) {
        case MFMailComposeErrorCodeSaveFailed:
            return mr_stringize_error_code(MFMailComposeErrorCodeSaveFailed);
        case MFMailComposeErrorCodeSendFailed:
            return mr_stringize_error_code(MFMailComposeErrorCodeSendFailed);
    }
    return @(code).stringValue;
}

+ (NSString *)debugStringWithMailComposeResult:(NSInteger)code
{
    switch (code) {
        case MFMailComposeResultCancelled:
            return mr_stringize_error_code(MFMailComposeResultCancelled);
        case MFMailComposeResultSaved:
            return mr_stringize_error_code(MFMailComposeResultSaved);
        case MFMailComposeResultSent:
            return mr_stringize_error_code(MFMailComposeResultSent);
        case MFMailComposeResultFailed:
            return mr_stringize_error_code(MFMailComposeResultFailed);
    }
    return @(code).stringValue;
}

+ (NSString *)debugStringWithMessageComposeResult:(NSInteger)code
{
    switch (code) {
        case MessageComposeResultCancelled:
            return mr_stringize_error_code(MessageComposeResultCancelled);
        case MessageComposeResultSent:
            return mr_stringize_error_code(MessageComposeResultSent);
        case MessageComposeResultFailed:
            return mr_stringize_error_code(MessageComposeResultFailed);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithMailComposeCode:(NSInteger)code
{
    switch (code) {
        case MFMailComposeErrorCodeSaveFailed:
            return NSLocalizedString(@"Mail Save Failed", nil);
        case MFMailComposeErrorCodeSendFailed:
            return NSLocalizedString(@"Mail Send Failed", nil);
    }
    return NSLocalizedString(@"Mail Error", nil);
}

+ (NSString *)stringWithMailComposeResult:(NSInteger)code
{
    switch (code) {
        case MFMailComposeResultCancelled:
            return NSLocalizedString(@"Mail Cancelled", nil);
        case MFMailComposeResultSaved:
            return NSLocalizedString(@"Mail Saved", nil);
        case MFMailComposeResultSent:
            return NSLocalizedString(@"Mail Sent", nil);
        case MFMailComposeResultFailed:
            return NSLocalizedString(@"Mail Failed", nil);
    }
    return NSLocalizedString(@"Unknown Result", nil);
}

+ (NSString *)stringWithMessageComposeResult:(NSInteger)code
{
    switch (code) {
        case MessageComposeResultCancelled:
            return NSLocalizedString(@"Message Cancelled", nil);
        case MessageComposeResultSent:
            return NSLocalizedString(@"Message Sent", nil);
        case MessageComposeResultFailed:
            return NSLocalizedString(@"Message Failed", nil);
    }
    return NSLocalizedString(@"Unknown Result", nil);
}

#endif

#pragma mark -

#ifdef _SECURITY_SECITEM_H_

+ (NSString *)debugStringWithKeychainServiceCode:(NSInteger)code
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
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case errSecReadOnly:
            return mr_stringize_error_code(errSecReadOnly);
        case errSecNoSuchKeychain:
            return mr_stringize_error_code(errSecNoSuchKeychain);
        case errSecInvalidKeychain:
            return mr_stringize_error_code(errSecInvalidKeychain);
        case errSecDuplicateKeychain:
            return mr_stringize_error_code(errSecDuplicateKeychain);
        case errSecDuplicateCallback:
            return mr_stringize_error_code(errSecDuplicateCallback);
        case errSecInvalidCallback:
            return mr_stringize_error_code(errSecInvalidCallback);
        case errSecBufferTooSmall:
            return mr_stringize_error_code(errSecBufferTooSmall);
        case errSecDataTooLarge:
            return mr_stringize_error_code(errSecDataTooLarge);
        case errSecNoSuchAttr:
            return mr_stringize_error_code(errSecNoSuchAttr);
        case errSecInvalidItemRef:
            return mr_stringize_error_code(errSecInvalidItemRef);
        case errSecInvalidSearchRef:
            return mr_stringize_error_code(errSecInvalidSearchRef);
        case errSecNoSuchClass:
            return mr_stringize_error_code(errSecNoSuchClass);
        case errSecNoDefaultKeychain:
            return mr_stringize_error_code(errSecNoDefaultKeychain);
        case errSecReadOnlyAttr:
            return mr_stringize_error_code(errSecReadOnlyAttr);
        case errSecWrongSecVersion:
            return mr_stringize_error_code(errSecWrongSecVersion);
        case errSecKeySizeNotAllowed:
            return mr_stringize_error_code(errSecKeySizeNotAllowed);
        case errSecNoStorageModule:
            return mr_stringize_error_code(errSecNoStorageModule);
        case errSecNoCertificateModule:
            return mr_stringize_error_code(errSecNoCertificateModule);
        case errSecNoPolicyModule:
            return mr_stringize_error_code(errSecNoPolicyModule);
        case errSecInteractionRequired:
            return mr_stringize_error_code(errSecInteractionRequired);
        case errSecDataNotAvailable:
            return mr_stringize_error_code(errSecDataNotAvailable);
        case errSecDataNotModifiable:
            return mr_stringize_error_code(errSecDataNotModifiable);
        case errSecCreateChainFailed:
            return mr_stringize_error_code(errSecCreateChainFailed);
        case errSecACLNotSimple:
            return mr_stringize_error_code(errSecACLNotSimple);
        case errSecPolicyNotFound:
            return mr_stringize_error_code(errSecPolicyNotFound);
        case errSecInvalidTrustSetting:
            return mr_stringize_error_code(errSecInvalidTrustSetting);
        case errSecNoAccessForItem:
            return mr_stringize_error_code(errSecNoAccessForItem);
        case errSecInvalidOwnerEdit:
            return mr_stringize_error_code(errSecInvalidOwnerEdit);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithKeychainServiceCode:(NSInteger)code
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
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case errSecReadOnly:
            return NSLocalizedString(@"Read Only Error", nil);
        case errSecNoSuchKeychain:
            return NSLocalizedString(@"Keychain Non Existent", nil);
        case errSecInvalidKeychain:
            return NSLocalizedString(@"Invalid Keychain", nil);
        case errSecDuplicateKeychain:
            return NSLocalizedString(@"Duplicate Keychain", nil);
        case errSecDuplicateCallback:
            return NSLocalizedString(@"Duplicate Callback", nil);
        case errSecInvalidCallback:
            return NSLocalizedString(@"Invalid Callback", nil);
        case errSecBufferTooSmall:
            return NSLocalizedString(@"Buffer Too Small", nil);
        case errSecDataTooLarge:
            return NSLocalizedString(@"Data Too Large", nil);
        case errSecNoSuchAttr:
            return NSLocalizedString(@"Attribute Non Existent", nil);
        case errSecInvalidItemRef:
            return NSLocalizedString(@"Invalid Item Reference", nil);
        case errSecInvalidSearchRef:
            return NSLocalizedString(@"Invalid Search Reference", nil);
        case errSecNoSuchClass:
            return NSLocalizedString(@"Keychain Class Non Existent", nil);
        case errSecNoDefaultKeychain:
            return NSLocalizedString(@"Default Keychain Non Existent", nil);
        case errSecReadOnlyAttr:
            return NSLocalizedString(@"Read Only Attribute", nil);
        case errSecWrongSecVersion:
            return NSLocalizedString(@"Wrong Version", nil);
        case errSecKeySizeNotAllowed:
            return NSLocalizedString(@"Key Size Not Allowed", nil);
        case errSecNoStorageModule:
            return NSLocalizedString(@"No Storage Module", nil);
        case errSecNoCertificateModule:
            return NSLocalizedString(@"No Certificate Module Available", nil);
        case errSecNoPolicyModule:
            return NSLocalizedString(@"No Policy Module Available", nil);
        case errSecInteractionRequired:
            return NSLocalizedString(@"User Interaction Required", nil);
        case errSecDataNotAvailable:
            return NSLocalizedString(@"Data Not Available", nil);
        case errSecDataNotModifiable:
            return NSLocalizedString(@"Data Not Modifiable", nil);
        case errSecCreateChainFailed:
            return NSLocalizedString(@"Certificate chain Creation Failed", nil);
        case errSecACLNotSimple:
            return NSLocalizedString(@"Access Control List Not In Standard Simple Form", nil);
        case errSecPolicyNotFound:
            return NSLocalizedString(@"Policy Not Found", nil);
        case errSecInvalidTrustSetting:
            return NSLocalizedString(@"Invalid Trust Setting", nil);
        case errSecNoAccessForItem:
            return NSLocalizedString(@"No Access Control For Item", nil);
        case errSecInvalidOwnerEdit:
            return NSLocalizedString(@"Invalid Owner Edit Attempt", nil);
#endif
    }
    return NSLocalizedString(@"Keychain Error", nil);
}

#endif

#pragma mark -

#ifdef SK_EXTERN

+ (NSString *)debugStringWithStoreKitCode:(NSInteger)code
{
    switch (code) {
        case SKErrorUnknown:
            return mr_stringize_error_code(SKErrorUnknown);
        case SKErrorClientInvalid:
            return mr_stringize_error_code(SKErrorClientInvalid);
        case SKErrorPaymentCancelled:
            return mr_stringize_error_code(SKErrorPaymentCancelled);
        case SKErrorPaymentInvalid:
            return mr_stringize_error_code(SKErrorPaymentInvalid);
        case SKErrorPaymentNotAllowed:
            return mr_stringize_error_code(SKErrorPaymentNotAllowed);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case SKErrorStoreProductNotAvailable:
            return mr_stringize_error_code(SKErrorStoreProductNotAvailable);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithStoreKitCode:(NSInteger)code
{
    switch (code) {
        case SKErrorUnknown:
            return NSLocalizedString(@"Unknown Error", nil);
        case SKErrorClientInvalid:
            return NSLocalizedString(@"Invalid Client", nil);
        case SKErrorPaymentCancelled:
            return NSLocalizedString(@"Payment Cancelled", nil);
        case SKErrorPaymentInvalid:
            return NSLocalizedString(@"Invalid Payment", nil);
        case SKErrorPaymentNotAllowed:
            return NSLocalizedString(@"Payment Not Allowed", nil);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case SKErrorStoreProductNotAvailable:
            return NSLocalizedString(@"Product Not Available", nil);
#endif
    }
    return NSLocalizedString(@"Store Error", nil);
}

#endif

#pragma mark -

#ifdef TransitionKit_TransitionKit_h

+ (NSString *)debugStringWithTransitionKitCode:(NSInteger)code
{
    switch (code) {
        case TKInvalidTransitionError:
            return mr_stringize_error_code(TKInvalidTransitionError);
        case TKTransitionDeclinedError:
            return mr_stringize_error_code(TKTransitionDeclinedError);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithTransitionKitCode:(NSInteger)code
{
    switch (code) {
        case TKInvalidTransitionError:
            return NSLocalizedString(@"Transition Invalid", nil);
        case TKTransitionDeclinedError:
            return NSLocalizedString(@"Transition Declined", nil);
    }
    return NSLocalizedString(@"State Machine Error", nil);
}

#endif

@end
