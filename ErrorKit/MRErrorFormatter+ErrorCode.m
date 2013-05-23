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

#if defined(ERROR_KIT_ACCOUNTS) & !defined(_ERRORKITDEFINES_H)
#import <Accounts/Accounts.h>
#endif
#if defined(ERROR_KIT_ADMOB) & !defined(_ERRORKITDEFINES_H)
#import <AdMob/GADRequestError.h>
#endif
#if defined(ERROR_KIT_AVFOUNDATION) & !defined(_ERRORKITDEFINES_H)
#import <AVFoundation/AVError.h>
#endif
#if defined(ERROR_KIT_CORE_DATA) & !defined(_ERRORKITDEFINES_H)
#import <CoreData/CoreDataErrors.h>
#endif
#if defined(ERROR_KIT_CORE_LOCATION) & !defined(_ERRORKITDEFINES_H)
#import <CoreLocation/CLError.h>
#import <CoreLocation/CLErrorDomain.h>
#endif
#if defined(ERROR_KIT_FACEBOOK) & !defined(_ERRORKITDEFINES_H)
#import <FacebookSDK/FacebookSDK.h>
#endif
#if defined(ERROR_KIT_IAD) & !defined(_ERRORKITDEFINES_H)
#import <iAd/iAd.h>
#endif
#if defined(ERROR_KIT_MAP_KIT) & !defined(_ERRORKITDEFINES_H)
#import <MapKit/MapKit.h>
#endif
#if defined(ERROR_KIT_MESSAGE_UI) & !defined(_ERRORKITDEFINES_H)
#import <MessageUI/MessageUI.h>
#endif
#if defined(ERROR_KIT_STORE_KIT) & !defined(_ERRORKITDEFINES_H)
#import <StoreKit/StoreKit.h>
#endif
#if defined(ERROR_KIT_TRANSITION_KIT) & !defined(_ERRORKITDEFINES_H)
#import <TransitionKit/TransitionKit.h>
#endif

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif

#define mr_stringize_error_code(arg) [NSString stringWithUTF8String:#arg]


@implementation MRErrorFormatter (ErrorCode)

#pragma mark - Cocoa

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
#ifdef ERROR_KIT_CORE_DATA
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
            return MRErrorKitString(@"No Such File", nil);
        case NSFileLockingError:
            return MRErrorKitString(@"File Locking Error", nil);
        case NSFileReadUnknownError:
            return MRErrorKitString(@"File Read Error", nil);
        case NSFileReadNoPermissionError:
            return MRErrorKitString(@"No Read Permission", nil);
        case NSFileReadInvalidFileNameError:
        case NSFileWriteInvalidFileNameError:
            return MRErrorKitString(@"Invalid File Name", nil);
        case NSFileReadCorruptFileError:
            return MRErrorKitString(@"Corrupt File", nil);
        case NSFileReadNoSuchFileError:
            return MRErrorKitString(@"No Such File", nil);
        case NSFileReadInapplicableStringEncodingError:
        case NSFileWriteInapplicableStringEncodingError:
            return MRErrorKitString(@"Inapplicable Encoding", nil);
        case NSFileReadUnsupportedSchemeError:
        case NSFileWriteUnsupportedSchemeError:
            return MRErrorKitString(@"Unsupported Scheme", nil);
        case NSFileReadTooLargeError:
            return MRErrorKitString(@"File Too Large", nil);
        case NSFileReadUnknownStringEncodingError:
            return MRErrorKitString(@"Unknown Encoding", nil);
        case NSFileWriteUnknownError:
            return MRErrorKitString(@"File Write Error", nil);
        case NSFileWriteNoPermissionError:
            return MRErrorKitString(@"No Write Permission", nil);
        case NSFileWriteFileExistsError:
            return MRErrorKitString(@"File Already Exists", nil);
        case NSFileWriteOutOfSpaceError:
            return MRErrorKitString(@"Out Of Space", nil);
        case NSFileWriteVolumeReadOnlyError:
            return MRErrorKitString(@"Read Only Volume", nil);
        case NSKeyValueValidationError:
            return MRErrorKitString(@"Validation Error", nil);
        case NSFormattingError:
            return MRErrorKitString(@"Formatting Error", nil);
        case NSUserCancelledError:
            return MRErrorKitString(@"Cancelled", nil);
        case NSFeatureUnsupportedError:
            return MRErrorKitString(@"Feature Unsupported", nil);
        case NSExecutableNotLoadableError:
            return MRErrorKitString(@"Executable Not Loadable", nil);
        case NSExecutableArchitectureMismatchError:
            return MRErrorKitString(@"Executable Architecture Mismatch", nil);
        case NSExecutableRuntimeMismatchError:
            return MRErrorKitString(@"Executable Runtime Mismatch", nil);
        case NSExecutableLoadError:
            return MRErrorKitString(@"Executable Load Error", nil);
        case NSExecutableLinkError:
            return MRErrorKitString(@"Executable Link Error", nil);
        case NSPropertyListReadCorruptError:
            return MRErrorKitString(@"Property List Corrupt", nil);
        case NSPropertyListReadUnknownVersionError:
            return MRErrorKitString(@"Property List Unknown Version", nil);
        case NSPropertyListReadStreamError:
        case NSPropertyListWriteStreamError:
            return MRErrorKitString(@"Property List Stream Error", nil);
        case NSXPCConnectionInterrupted:
            return MRErrorKitString(@"XPC Connection Interrupted", nil);
        case NSXPCConnectionInvalid:
            return MRErrorKitString(@"XPC Connection Invalid", nil);
        case NSXPCConnectionReplyInvalid:
            return MRErrorKitString(@"XPC Connection Reply Invalid", nil);
#ifdef ERROR_KIT_CORE_DATA
        case NSManagedObjectValidationError:
            return MRErrorKitString(@"Validation Error", nil);
        case NSValidationMultipleErrorsError:
            return MRErrorKitString(@"Multiple Validation Errors", nil);
        case NSValidationMissingMandatoryPropertyError:
            return MRErrorKitString(@"Missing Mandatory Property", nil);
        case NSValidationRelationshipLacksMinimumCountError:
            return MRErrorKitString(@"Relationship Lacks Minimum Count", nil);
        case NSValidationRelationshipExceedsMaximumCountError:
            return MRErrorKitString(@"Relationship Exceeds Maximum Count", nil);
        case NSValidationRelationshipDeniedDeleteError:
            return MRErrorKitString(@"Delete Denied", nil);
        case NSValidationNumberTooLargeError:
            return MRErrorKitString(@"Number Too Large", nil);
        case NSValidationNumberTooSmallError:
            return MRErrorKitString(@"Number Too Small", nil);
        case NSValidationDateTooLateError:
            return MRErrorKitString(@"Date Too Late", nil);
        case NSValidationDateTooSoonError:
            return MRErrorKitString(@"Date Too Soon", nil);
        case NSValidationInvalidDateError:
            return MRErrorKitString(@"Invalid Date", nil);
        case NSValidationStringTooLongError:
            return MRErrorKitString(@"String Too Long", nil);
        case NSValidationStringTooShortError:
            return MRErrorKitString(@"String Too Short", nil);
        case NSValidationStringPatternMatchingError:
            return MRErrorKitString(@"Pattern Matching Error", nil);
        case NSManagedObjectContextLockingError:
        case NSPersistentStoreCoordinatorLockingError:
            return MRErrorKitString(@"Locking Error", nil);
        case NSManagedObjectReferentialIntegrityError:
            return MRErrorKitString(@"Referential Integrity Error", nil);
        case NSManagedObjectExternalRelationshipError:
            return MRErrorKitString(@"External Relationship Error", nil);
        case NSManagedObjectMergeError:
            return MRErrorKitString(@"Merge Error", nil);
        case NSPersistentStoreInvalidTypeError:
            return MRErrorKitString(@"Invalid Type", nil);
        case NSPersistentStoreTypeMismatchError:
            return MRErrorKitString(@"Type Mismatch", nil);
        case NSPersistentStoreIncompatibleSchemaError:
            return MRErrorKitString(@"Incompatible Schema", nil);
        case NSPersistentStoreSaveError:
            return MRErrorKitString(@"Save Error", nil);
        case NSPersistentStoreIncompleteSaveError:
            return MRErrorKitString(@"Incomplete Save", nil);
        case NSPersistentStoreSaveConflictsError:
            return MRErrorKitString(@"Save Conflicts", nil);
        case NSCoreDataError:
            return MRErrorKitString(@"Data Error", nil);
        case NSPersistentStoreOperationError:
            return MRErrorKitString(@"Operation Error", nil);
        case NSPersistentStoreOpenError:
            return MRErrorKitString(@"Persistent Store Open Error", nil);
        case NSPersistentStoreTimeoutError:
            return MRErrorKitString(@"Timed Out", nil);
        case NSPersistentStoreUnsupportedRequestTypeError:
            return MRErrorKitString(@"Unsupported Request Type", nil);
        case NSPersistentStoreIncompatibleVersionHashError:
            return MRErrorKitString(@"Incompatible Version Hash", nil);
        case NSMigrationError:
            return MRErrorKitString(@"Migration Error", nil);
        case NSMigrationCancelledError:
            return MRErrorKitString(@"Migration Cancelled", nil);
        case NSMigrationMissingSourceModelError:
            return MRErrorKitString(@"Missing Source Model", nil);
        case NSMigrationMissingMappingModelError:
            return MRErrorKitString(@"Missing Mapping Model", nil);
        case NSMigrationManagerSourceStoreError:
            return MRErrorKitString(@"Source Store Error", nil);
        case NSMigrationManagerDestinationStoreError:
            return MRErrorKitString(@"Destination Store Error", nil);
        case NSEntityMigrationPolicyError:
            return MRErrorKitString(@"Entity Migration Policy Error", nil);
        case NSSQLiteError:
            return MRErrorKitString(@"Data Base Error", nil);
        case NSInferredMappingModelError:
            return MRErrorKitString(@"Inferred Mapping Model Error", nil);
        case NSExternalRecordImportError:
            return MRErrorKitString(@"External Record Import Error", nil);
#endif
        default:
            if (NSFileErrorMinimum >= code
                && code <= NSFileErrorMaximum) {
                return MRErrorKitString(@"File Error", nil);
            } else if (NSValidationErrorMinimum >= code
                       && NSValidationErrorMaximum <= code) {
                return MRErrorKitString(@"Validation Error", nil);
            } else if (NSExecutableErrorMinimum >= code
                       && NSExecutableErrorMaximum <= code) {
                return MRErrorKitString(@"Executable Error", nil);
            } else if (NSFormattingErrorMinimum >= code
                       && NSFormattingErrorMaximum <= code) {
                return MRErrorKitString(@"Formatting Error", nil);
            } else if (NSPropertyListErrorMinimum >= code
                       && NSPropertyListErrorMaximum <= code) {
                return MRErrorKitString(@"Property List Error", nil);
            } else if (NSXPCConnectionErrorMinimum >= code
                       && NSXPCConnectionErrorMaximum <= code) {
                return MRErrorKitString(@"XPC Connection Error", nil);
            }
    }
    return MRErrorKitString(@"Unknown Error", nil);
}

#pragma mark - URL

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

#pragma mark - XML Parser

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
            return MRErrorKitString(@"Internal Error", nil);
        case NSXMLParserOutOfMemoryError:
            return MRErrorKitString(@"Out Of Memory", nil);
        case NSXMLParserDocumentStartError:
            return MRErrorKitString(@"Document Start Error", nil);
        case NSXMLParserEmptyDocumentError:
            return MRErrorKitString(@"Empty Document", nil);
        case NSXMLParserPrematureDocumentEndError:
            return MRErrorKitString(@"Premature Document End", nil);
        case NSXMLParserInvalidHexCharacterRefError:
            return MRErrorKitString(@"Invalid Hex Character Reference", nil);
        case NSXMLParserInvalidDecimalCharacterRefError:
            return MRErrorKitString(@"Invalid Decimal Character Reference", nil);
        case NSXMLParserInvalidCharacterRefError:
            return MRErrorKitString(@"Invalid Character", nil);
        case NSXMLParserInvalidCharacterError:
            return MRErrorKitString(@"Invalid Character", nil);
        case NSXMLParserCharacterRefAtEOFError:
            return MRErrorKitString(@"Character Reference Target Not Found", nil);
        case NSXMLParserCharacterRefInPrologError:
            return MRErrorKitString(@"Invalid Character Reference In Prolog", nil);
        case NSXMLParserCharacterRefInEpilogError:
            return MRErrorKitString(@"Invalid Character Reference In Epilog", nil);
        case NSXMLParserCharacterRefInDTDError:
            return MRErrorKitString(@"Invalid Character Reference In DTD", nil);
        case NSXMLParserEntityRefAtEOFError:
            return MRErrorKitString(@"Entity Reference Target Not Found", nil);
        case NSXMLParserEntityRefInPrologError:
            return MRErrorKitString(@"Invalid Entity Reference In Prolog", nil);
        case NSXMLParserEntityRefInEpilogError:
            return MRErrorKitString(@"Invalid Entity Reference In Epilog", nil);
        case NSXMLParserEntityRefInDTDError:
            return MRErrorKitString(@"Invalid Entity Reference In DTD", nil);
        case NSXMLParserParsedEntityRefAtEOFError:
            return MRErrorKitString(@"Entity Reference Target Not Found", nil);
        case NSXMLParserParsedEntityRefInPrologError:
            return MRErrorKitString(@"Entity Reference Target Not Found In Prolog", nil);
        case NSXMLParserParsedEntityRefInEpilogError:
            return MRErrorKitString(@"Entity Reference Target Not Found In Epilog", nil);
        case NSXMLParserParsedEntityRefInInternalSubsetError:
            return MRErrorKitString(@"Entity Reference Target Not Found In Internal Subset", nil);
        case NSXMLParserEntityReferenceWithoutNameError:
            return MRErrorKitString(@"Entity Reference Without Name", nil);
        case NSXMLParserEntityReferenceMissingSemiError:
            return MRErrorKitString(@"Entity Reference Missing Semicolon", nil);
        case NSXMLParserParsedEntityRefNoNameError:
            return MRErrorKitString(@"Parsed Entity Reference Without Name", nil);
        case NSXMLParserParsedEntityRefMissingSemiError:
            return MRErrorKitString(@"Parsed Entity Reference Missing Semicolon", nil);
        case NSXMLParserUndeclaredEntityError:
            return MRErrorKitString(@"Undeclared Entity", nil);
        case NSXMLParserUnparsedEntityError:
            return MRErrorKitString(@"Cannot Parse Entity", nil);
        case NSXMLParserEntityIsExternalError:
            return MRErrorKitString(@"Cannot Parse External Entity", nil);
        case NSXMLParserEntityIsParameterError:
            return MRErrorKitString(@"Entity Is Parameter Error", nil);
        case NSXMLParserUnknownEncodingError:
            return MRErrorKitString(@"Unknown Encoding", nil);
        case NSXMLParserEncodingNotSupportedError:
            return MRErrorKitString(@"Encoding Not Supported", nil);
        case NSXMLParserStringNotStartedError:
            return MRErrorKitString(@"String Not Started", nil);
        case NSXMLParserStringNotClosedError:
            return MRErrorKitString(@"String Not Closed", nil);
        case NSXMLParserNamespaceDeclarationError:
            return MRErrorKitString(@"Invalid Namespace Declaration", nil);
        case NSXMLParserEntityNotStartedError:
            return MRErrorKitString(@"Entity Not Started", nil);
        case NSXMLParserEntityNotFinishedError:
            return MRErrorKitString(@"Entity Not Finished", nil);
        case NSXMLParserLessThanSymbolInAttributeError:
            return MRErrorKitString(@"'<' Used In Attribute Error", nil);
        case NSXMLParserAttributeNotStartedError:
            return MRErrorKitString(@"Attribute Not Started", nil);
        case NSXMLParserAttributeNotFinishedError:
            return MRErrorKitString(@"Attribute Not Finished", nil);
        case NSXMLParserAttributeHasNoValueError:
            return MRErrorKitString(@"Attribute Has No Value", nil);
        case NSXMLParserAttributeRedefinedError:
            return MRErrorKitString(@"Attribute Redefined", nil);
        case NSXMLParserLiteralNotStartedError:
            return MRErrorKitString(@"Literal Not Started", nil);
        case NSXMLParserLiteralNotFinishedError:
            return MRErrorKitString(@"Literal Not Finished", nil);
        case NSXMLParserCommentNotFinishedError:
            return MRErrorKitString(@"Comment Not Finished", nil);
        case NSXMLParserProcessingInstructionNotStartedError:
            return MRErrorKitString(@"Processing Instruction Not Started", nil);
        case NSXMLParserProcessingInstructionNotFinishedError:
            return MRErrorKitString(@"Processing Instruction Not Finished", nil);
        case NSXMLParserNotationNotStartedError:
            return MRErrorKitString(@"Notation Not Started", nil);
        case NSXMLParserNotationNotFinishedError:
            return MRErrorKitString(@"Notation Not Finished", nil);
        case NSXMLParserAttributeListNotStartedError:
            return MRErrorKitString(@"Attribute List Not Started", nil);
        case NSXMLParserAttributeListNotFinishedError:
            return MRErrorKitString(@"Attribute List Not Finished", nil);
        case NSXMLParserMixedContentDeclNotStartedError:
            return MRErrorKitString(@"Mixed Content Declaration Not Started", nil);
        case NSXMLParserMixedContentDeclNotFinishedError:
            return MRErrorKitString(@"Mixed Content Declaration Not Finished", nil);
        case NSXMLParserElementContentDeclNotStartedError:
            return MRErrorKitString(@"Element Content Declaration Not Started", nil);
        case NSXMLParserElementContentDeclNotFinishedError:
            return MRErrorKitString(@"Element Content Declaration Not Finished", nil);
        case NSXMLParserXMLDeclNotStartedError:
            return MRErrorKitString(@"XML Declaration Not Started", nil);
        case NSXMLParserXMLDeclNotFinishedError:
            return MRErrorKitString(@"XML Declaration Not Finished", nil);
        case NSXMLParserConditionalSectionNotStartedError:
            return MRErrorKitString(@"Conditional Section Not Started", nil);
        case NSXMLParserConditionalSectionNotFinishedError:
            return MRErrorKitString(@"Conditional Section Not Finished", nil);
        case NSXMLParserExternalSubsetNotFinishedError:
            return MRErrorKitString(@"External Subset Not Finished", nil);
        case NSXMLParserDOCTYPEDeclNotFinishedError:
            return MRErrorKitString(@"DOCTYPE Declaration Not Finished", nil);
        case NSXMLParserMisplacedCDATAEndStringError:
            return MRErrorKitString(@"Misplaced CDATA End String", nil);
        case NSXMLParserCDATANotFinishedError:
            return MRErrorKitString(@"CDATA Not Finished", nil);
        case NSXMLParserMisplacedXMLDeclarationError:
            return MRErrorKitString(@"Misplaced XML Declaration", nil);
        case NSXMLParserSpaceRequiredError:
            return MRErrorKitString(@"Space Required", nil);
        case NSXMLParserSeparatorRequiredError:
            return MRErrorKitString(@"Separator Required", nil);
        case NSXMLParserNMTOKENRequiredError:
            return MRErrorKitString(@"NAME Token Required", nil);
        case NSXMLParserNAMERequiredError:
            return MRErrorKitString(@"NAME Required", nil);
        case NSXMLParserPCDATARequiredError:
            return MRErrorKitString(@"CDATA Required", nil);
        case NSXMLParserURIRequiredError:
            return MRErrorKitString(@"URI Required", nil);
        case NSXMLParserPublicIdentifierRequiredError:
            return MRErrorKitString(@"Public Identifier Required", nil);
        case NSXMLParserLTRequiredError:
            return MRErrorKitString(@"'<' Required", nil);
        case NSXMLParserGTRequiredError:
            return MRErrorKitString(@"'>' Required", nil);
        case NSXMLParserLTSlashRequiredError:
            return MRErrorKitString(@"'</' Required", nil);
        case NSXMLParserEqualExpectedError:
            return MRErrorKitString(@"'=' Expected", nil);
        case NSXMLParserTagNameMismatchError:
            return MRErrorKitString(@"Tag Name Mismatch", nil);
        case NSXMLParserUnfinishedTagError:
            return MRErrorKitString(@"Unfinished Tag", nil);
        case NSXMLParserStandaloneValueError:
            return MRErrorKitString(@"Standalone Value Error", nil);
        case NSXMLParserInvalidEncodingNameError:
            return MRErrorKitString(@"Invalid Encoding Name", nil);
        case NSXMLParserCommentContainsDoubleHyphenError:
            return MRErrorKitString(@"Comment Contains Double Hyphen", nil);
        case NSXMLParserInvalidEncodingError:
            return MRErrorKitString(@"Invalid Encoding", nil);
        case NSXMLParserExternalStandaloneEntityError:
            return MRErrorKitString(@"External Standalone Entity Error", nil);
        case NSXMLParserInvalidConditionalSectionError:
            return MRErrorKitString(@"Invalid Conditional Section", nil);
        case NSXMLParserEntityValueRequiredError:
            return MRErrorKitString(@"Entity Value Required", nil);
        case NSXMLParserNotWellBalancedError:
            return MRErrorKitString(@"Not Well Balanced", nil);
        case NSXMLParserExtraContentError:
            return MRErrorKitString(@"Extra Content Error", nil);
        case NSXMLParserInvalidCharacterInEntityError:
            return MRErrorKitString(@"Invalid Character In Entity", nil);
        case NSXMLParserParsedEntityRefInInternalError:
            return MRErrorKitString(@"Internal Error In Parsed Entity Reference", nil);
        case NSXMLParserEntityRefLoopError:
            return MRErrorKitString(@"Entity Reference Loop Error", nil);
        case NSXMLParserEntityBoundaryError:
            return MRErrorKitString(@"Entity Boundary Error", nil);
        case NSXMLParserInvalidURIError:
            return MRErrorKitString(@"Invalid URI", nil);
        case NSXMLParserURIFragmentError:
            return MRErrorKitString(@"URI Fragment Error", nil);
        case NSXMLParserNoDTDError:
            return MRErrorKitString(@"Missing DTD", nil);
        case NSXMLParserDelegateAbortedParseError:
            return MRErrorKitString(@"Delegate Aborted Parse", nil);
    }
    return MRErrorKitString(@"XML Error", nil);
}

#pragma mark - Accounts

#ifdef ERROR_KIT_ACCOUNTS

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

#endif

#pragma mark - AdMob

#ifdef ERROR_KIT_ADMOB

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
            return MRErrorKitString(@"Invalid Request", nil);
        case kGADErrorNoFill:
        case kGADErrorMediationNoFill:
            return MRErrorKitString(@"No Ad Error", nil);
        case kGADErrorNetworkError:
            return MRErrorKitString(@"Network Error", nil);
        case kGADErrorServerError:
            return MRErrorKitString(@"Server Error", nil);
        case kGADErrorOSVersionTooLow:
            return MRErrorKitString(@"OS Version Too Low", nil);
        case kGADErrorTimeout:
            return MRErrorKitString(@"Timed Out", nil);
        case kGADErrorInterstitialAlreadyUsed:
            return MRErrorKitString(@"Interstitial Already Used", nil);
        case kGADErrorMediationDataError:
            return MRErrorKitString(@"Invalid Response", nil);
        case kGADErrorMediationAdapterError:
            return MRErrorKitString(@"Mediation Adapter Error", nil);
        case kGADErrorMediationInvalidAdSize:
            return MRErrorKitString(@"Invalid Ad Size", nil);
    }
    return MRErrorKitString(@"Admob Error", nil);
}

#endif

#pragma mark - AVFoundation

#ifdef ERROR_KIT_AVFOUNDATION

+ (NSString *)debugStringWithAVCode:(NSInteger)code
{
    switch (code) {
        case AVErrorUnknown:
            return mr_stringize_error_code(AVErrorUnknown);
        case AVErrorOutOfMemory:
            return mr_stringize_error_code(AVErrorOutOfMemory);
        case AVErrorSessionNotRunning:
            return mr_stringize_error_code(AVErrorSessionNotRunning);
        case AVErrorDeviceAlreadyUsedByAnotherSession:
            return mr_stringize_error_code(AVErrorDeviceAlreadyUsedByAnotherSession);
        case AVErrorNoDataCaptured:
            return mr_stringize_error_code(AVErrorNoDataCaptured);
        case AVErrorSessionConfigurationChanged:
            return mr_stringize_error_code(AVErrorSessionConfigurationChanged);
        case AVErrorDiskFull:
            return mr_stringize_error_code(AVErrorDiskFull);
        case AVErrorDeviceWasDisconnected:
            return mr_stringize_error_code(AVErrorDeviceWasDisconnected);
        case AVErrorMediaChanged:
            return mr_stringize_error_code(AVErrorMediaChanged);
        case AVErrorMaximumDurationReached:
            return mr_stringize_error_code(AVErrorMaximumDurationReached);
        case AVErrorMaximumFileSizeReached:
            return mr_stringize_error_code(AVErrorMaximumFileSizeReached);
        case AVErrorMediaDiscontinuity:
            return mr_stringize_error_code(AVErrorMediaDiscontinuity);
        case AVErrorMaximumNumberOfSamplesForFileFormatReached:
            return mr_stringize_error_code(AVErrorMaximumNumberOfSamplesForFileFormatReached);
        case AVErrorDeviceNotConnected:
            return mr_stringize_error_code(AVErrorDeviceNotConnected);
        case AVErrorDeviceInUseByAnotherApplication:
            return mr_stringize_error_code(AVErrorDeviceInUseByAnotherApplication);
        case AVErrorDeviceLockedForConfigurationByAnotherProcess:
            return mr_stringize_error_code(AVErrorDeviceLockedForConfigurationByAnotherProcess);
#if TARGET_OS_IPHONE
        case AVErrorSessionWasInterrupted:
            return mr_stringize_error_code(AVErrorSessionWasInterrupted);
        case AVErrorMediaServicesWereReset:
            return mr_stringize_error_code(AVErrorMediaServicesWereReset);
#endif
        case AVErrorExportFailed:
            return mr_stringize_error_code(AVErrorExportFailed);
        case AVErrorDecodeFailed:
            return mr_stringize_error_code(AVErrorDecodeFailed);
        case AVErrorInvalidSourceMedia:
            return mr_stringize_error_code(AVErrorInvalidSourceMedia);
        case AVErrorFileAlreadyExists:
            return mr_stringize_error_code(AVErrorFileAlreadyExists);
        case AVErrorCompositionTrackSegmentsNotContiguous:
            return mr_stringize_error_code(AVErrorCompositionTrackSegmentsNotContiguous);
        case AVErrorInvalidCompositionTrackSegmentDuration:
            return mr_stringize_error_code(AVErrorInvalidCompositionTrackSegmentDuration);
        case AVErrorInvalidCompositionTrackSegmentSourceStartTime:
            return mr_stringize_error_code(AVErrorInvalidCompositionTrackSegmentSourceStartTime);
        case AVErrorInvalidCompositionTrackSegmentSourceDuration:
            return mr_stringize_error_code(AVErrorInvalidCompositionTrackSegmentSourceDuration);
        case AVErrorFileFormatNotRecognized:
            return mr_stringize_error_code(AVErrorFileFormatNotRecognized);
        case AVErrorFileFailedToParse:
            return mr_stringize_error_code(AVErrorFileFailedToParse);
        case AVErrorMaximumStillImageCaptureRequestsExceeded:
            return mr_stringize_error_code(AVErrorMaximumStillImageCaptureRequestsExceeded);
        case AVErrorContentIsProtected:
            return mr_stringize_error_code(AVErrorContentIsProtected);
        case AVErrorNoImageAtTime:
            return mr_stringize_error_code(AVErrorNoImageAtTime);
        case AVErrorDecoderNotFound:
            return mr_stringize_error_code(AVErrorDecoderNotFound);
        case AVErrorEncoderNotFound:
            return mr_stringize_error_code(AVErrorEncoderNotFound);
        case AVErrorContentIsNotAuthorized:
            return mr_stringize_error_code(AVErrorContentIsNotAuthorized);
        case AVErrorApplicationIsNotAuthorized:
            return mr_stringize_error_code(AVErrorApplicationIsNotAuthorized);
#if TARGET_OS_IPHONE
        case AVErrorDeviceIsNotAvailableInBackground:
            return mr_stringize_error_code(AVErrorDeviceIsNotAvailableInBackground);
#endif
        case AVErrorOperationNotSupportedForAsset:
            return mr_stringize_error_code(AVErrorOperationNotSupportedForAsset);
        case AVErrorDecoderTemporarilyUnavailable:
            return mr_stringize_error_code(AVErrorDecoderTemporarilyUnavailable);
        case AVErrorEncoderTemporarilyUnavailable:
            return mr_stringize_error_code(AVErrorEncoderTemporarilyUnavailable);
        case AVErrorInvalidVideoComposition:
            return mr_stringize_error_code(AVErrorInvalidVideoComposition);
        case AVErrorReferenceForbiddenByReferencePolicy:
            return mr_stringize_error_code(AVErrorReferenceForbiddenByReferencePolicy);
        case AVErrorInvalidOutputURLPathExtension:
            return mr_stringize_error_code(AVErrorInvalidOutputURLPathExtension);
        case AVErrorScreenCaptureFailed:
            return mr_stringize_error_code(AVErrorScreenCaptureFailed);
        case AVErrorDisplayWasDisabled:
            return mr_stringize_error_code(AVErrorDisplayWasDisabled);
        case AVErrorTorchLevelUnavailable:
            return mr_stringize_error_code(AVErrorTorchLevelUnavailable);
#if TARGET_OS_IPHONE
        case AVErrorOperationInterrupted:
            return mr_stringize_error_code(AVErrorOperationInterrupted);
#endif
        case AVErrorIncompatibleAsset:
            return mr_stringize_error_code(AVErrorIncompatibleAsset);
        case AVErrorFailedToLoadMediaData:
            return mr_stringize_error_code(AVErrorFailedToLoadMediaData);
        case AVErrorServerIncorrectlyConfigured:
            return mr_stringize_error_code(AVErrorServerIncorrectlyConfigured);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithAVCode:(NSInteger)code
{
    switch (code) {
        case AVErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case AVErrorOutOfMemory:
            return MRErrorKitString(@"Out Of Memory", nil);
        case AVErrorSessionNotRunning:
            return MRErrorKitString(@"Session Not Running", nil);
        case AVErrorDeviceAlreadyUsedByAnotherSession:
            return MRErrorKitString(@"Device Busy", nil);
        case AVErrorNoDataCaptured:
            return MRErrorKitString(@"No Data Captured", nil);
        case AVErrorSessionConfigurationChanged:
            return MRErrorKitString(@"Session Configuration Changed", nil);
        case AVErrorDiskFull:
            return MRErrorKitString(@"Disk Full", nil);
        case AVErrorDeviceWasDisconnected:
            return MRErrorKitString(@"Device Disconnected", nil);
        case AVErrorMediaChanged:
            return MRErrorKitString(@"Media Changed", nil);
        case AVErrorMaximumDurationReached:
            return MRErrorKitString(@"Maximum Duration Reached", nil);
        case AVErrorMaximumFileSizeReached:
            return MRErrorKitString(@"Maximum File Size Reached", nil);
        case AVErrorMediaDiscontinuity:
            return MRErrorKitString(@"Media Discontinuity", nil);
        case AVErrorMaximumNumberOfSamplesForFileFormatReached:
            return MRErrorKitString(@"Maximum Number Of Samples Reached", nil);
        case AVErrorDeviceNotConnected:
            return MRErrorKitString(@"Device Not Connected", nil);
        case AVErrorDeviceInUseByAnotherApplication:
            return MRErrorKitString(@"Device Busy", nil);
        case AVErrorDeviceLockedForConfigurationByAnotherProcess:
            return MRErrorKitString(@"Device Busy", nil);
#if TARGET_OS_IPHONE
        case AVErrorSessionWasInterrupted:
            return MRErrorKitString(@"Session Interrupted", nil);
        case AVErrorMediaServicesWereReset:
            return MRErrorKitString(@"Media Services Unavailable", nil);
#endif
        case AVErrorExportFailed:
            return MRErrorKitString(@"Export Failed", nil);
        case AVErrorDecodeFailed:
            return MRErrorKitString(@"Decode Failed", nil);
        case AVErrorInvalidSourceMedia:
            return MRErrorKitString(@"Invalid Source Media", nil);
        case AVErrorFileAlreadyExists:
            return MRErrorKitString(@"File Already Exists", nil);
        case AVErrorCompositionTrackSegmentsNotContiguous:
            return MRErrorKitString(@"Source Media Contains Gaps", nil);
        case AVErrorInvalidCompositionTrackSegmentDuration:
            return MRErrorKitString(@"Invalid Destination Duration", nil);
        case AVErrorInvalidCompositionTrackSegmentSourceStartTime:
            return MRErrorKitString(@"Invalid Source Start Time", nil);
        case AVErrorInvalidCompositionTrackSegmentSourceDuration:
            return MRErrorKitString(@"Invalid Source Duration", nil);
        case AVErrorFileFormatNotRecognized:
            return MRErrorKitString(@"Unrecognized File Format", nil);
        case AVErrorFileFailedToParse:
            return MRErrorKitString(@"Parse Failed", nil);
        case AVErrorMaximumStillImageCaptureRequestsExceeded:
            return MRErrorKitString(@"Too Many Requests", nil);
        case AVErrorContentIsProtected:
            return MRErrorKitString(@"Content Is Protected", nil);
        case AVErrorNoImageAtTime:
            return MRErrorKitString(@"No Image At Time", nil);
        case AVErrorDecoderNotFound:
            return MRErrorKitString(@"Decoder Not Found", nil);
        case AVErrorEncoderNotFound:
            return MRErrorKitString(@"Encoder Not Found", nil);
        case AVErrorContentIsNotAuthorized:
            return MRErrorKitString(@"Content Not Authorized", nil);
        case AVErrorApplicationIsNotAuthorized:
            return MRErrorKitString(@"Application Not Authorized", nil);
#if TARGET_OS_IPHONE
        case AVErrorDeviceIsNotAvailableInBackground:
            return MRErrorKitString(@"Background Capture Not Available", nil);
#endif
        case AVErrorOperationNotSupportedForAsset:
            return MRErrorKitString(@"Operation Not Supported", nil);
        case AVErrorDecoderTemporarilyUnavailable:
            return MRErrorKitString(@"Decoder Temporarily Unavailable", nil);
        case AVErrorEncoderTemporarilyUnavailable:
            return MRErrorKitString(@"Encoder Temporarily Unavailable", nil);
        case AVErrorInvalidVideoComposition:
            return MRErrorKitString(@"Invalid Video Composition", nil);
        case AVErrorReferenceForbiddenByReferencePolicy:
            return MRErrorKitString(@"Reference Not Allowed", nil);
        case AVErrorInvalidOutputURLPathExtension:
            return MRErrorKitString(@"URL Path Extension Invalid", nil);
        case AVErrorScreenCaptureFailed:
            return MRErrorKitString(@"Screen Capture Failed", nil);
        case AVErrorDisplayWasDisabled:
            return MRErrorKitString(@"Display Inactive", nil);
        case AVErrorTorchLevelUnavailable:
            return MRErrorKitString(@"Torch Level Unavailable", nil);
#if TARGET_OS_IPHONE
        case AVErrorOperationInterrupted:
            return MRErrorKitString(@"Operation Interrupted", nil);
#endif
        case AVErrorIncompatibleAsset:
            return MRErrorKitString(@"Incompatible Asset", nil);
        case AVErrorFailedToLoadMediaData:
            return MRErrorKitString(@"Missing Required Data", nil);
        case AVErrorServerIncorrectlyConfigured:
            return MRErrorKitString(@"Server Incorrectly Configured", nil);
    }
    return MRErrorKitString(@"AV Error", nil);
}

#endif

#pragma mark - CoreLocation

#ifdef ERROR_KIT_CORE_LOCATION

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
            return MRErrorKitString(@"Location Unknown", nil);
        case kCLErrorDenied:
            return MRErrorKitString(@"Denied", nil);
        case kCLErrorNetwork:
            return MRErrorKitString(@"Network Error", nil);
        case kCLErrorHeadingFailure:
            return MRErrorKitString(@"Heading Failure", nil);
        case kCLErrorRegionMonitoringDenied:
            return MRErrorKitString(@"Region Monitoring Denied", nil);
        case kCLErrorRegionMonitoringFailure:
            return MRErrorKitString(@"Region Monitoring Failure", nil);
        case kCLErrorRegionMonitoringSetupDelayed:
            return MRErrorKitString(@"Region Monitoring Setup Delayed", nil);
        case kCLErrorRegionMonitoringResponseDelayed:
            return MRErrorKitString(@"Region Monitoring Response Delayed", nil);
        case kCLErrorGeocodeFoundNoResult:
            return MRErrorKitString(@"Geocode Found No Result", nil);
        case kCLErrorGeocodeFoundPartialResult:
            return MRErrorKitString(@"Geocode Found Partial Result", nil);
        case kCLErrorGeocodeCanceled:
            return MRErrorKitString(@"Geocode Canceled", nil);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case kCLErrorDeferredFailed:
            return MRErrorKitString(@"Deferred Update Failed", nil);
        case kCLErrorDeferredNotUpdatingLocation:
            return MRErrorKitString(@"Deferred Not Updating Location", nil);
        case kCLErrorDeferredAccuracyTooLow:
            return MRErrorKitString(@"Deferred Accuracy Too Low", nil);
        case kCLErrorDeferredDistanceFiltered:
            return MRErrorKitString(@"Cannot Filter Deferred Distance", nil);
        case kCLErrorDeferredCanceled:
            return MRErrorKitString(@"Deferred Update Canceled", nil);
#endif
    }
    return MRErrorKitString(@"Location Error", nil);
}

#endif

#pragma mark - Facebook

#ifdef ERROR_KIT_FACEBOOK

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

+ (NSString *)stringWithFacebookCode:(NSInteger)code
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
        case FBErrorNativeDialog:
            return MRErrorKitString(@"Native Dialog Error", nil);
    }
    return MRErrorKitString(@"Facebook Error", nil);
}

#endif

#pragma mark - HTTP

+ (NSString *)stringWithHTTPCode:(NSInteger)statusCode
{
    return [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
}

#pragma mark - iAD

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
            return MRErrorKitString(@"Unknown Error", nil);
        case ADErrorServerFailure:
            return MRErrorKitString(@"Server Failure", nil);
        case ADErrorLoadingThrottled:
            return MRErrorKitString(@"Loading Throttled", nil);
        case ADErrorInventoryUnavailable:
            return MRErrorKitString(@"Inventory Unavailable", nil);
        case ADErrorConfigurationError:
            return MRErrorKitString(@"Configuration Error", nil);
        case ADErrorBannerVisibleWithoutContent:
            return MRErrorKitString(@"Banner Visible Without Content", nil);
        case ADErrorApplicationInactive:
            return MRErrorKitString(@"Application Inactive Error", nil);
#if __IPHONE_6_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
        case ADErrorAdUnloaded:
            return MRErrorKitString(@"Ad Unloaded Error", nil);
#endif
    }
    return MRErrorKitString(@"iAd Error", nil);
}

#endif

#pragma mark - JSONKit

+ (NSString *)debugStringWithJSONKitCode:(NSInteger)code
{
    return @(code).stringValue;
}

+ (NSString *)stringWithJSONKitCode:(NSInteger)code
{
    return MRErrorKitString(@"JSON Error", nil);
}

#pragma mark - MapKit

#ifdef ERROR_KIT_MAP_KIT

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
            return MRErrorKitString(@"Unknown Error", nil);
        case MKErrorServerFailure:
            return MRErrorKitString(@"Server Error", nil);
        case MKErrorLoadingThrottled:
            return MRErrorKitString(@"Loading Throttled", nil);
        case MKErrorPlacemarkNotFound:
            return MRErrorKitString(@"Placemark Not Found", nil);
    }
    return MRErrorKitString(@"Map Error", nil);
}

#endif

#pragma mark - MessageUI

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
            return MRErrorKitString(@"Mail Save Failed", nil);
        case MFMailComposeErrorCodeSendFailed:
            return MRErrorKitString(@"Mail Send Failed", nil);
    }
    return MRErrorKitString(@"Mail Error", nil);
}

+ (NSString *)stringWithMailComposeResult:(NSInteger)code
{
    switch (code) {
        case MFMailComposeResultCancelled:
            return MRErrorKitString(@"Mail Cancelled", nil);
        case MFMailComposeResultSaved:
            return MRErrorKitString(@"Mail Saved", nil);
        case MFMailComposeResultSent:
            return MRErrorKitString(@"Mail Sent", nil);
        case MFMailComposeResultFailed:
            return MRErrorKitString(@"Mail Failed", nil);
    }
    return MRErrorKitString(@"Unknown Result", nil);
}

+ (NSString *)stringWithMessageComposeResult:(NSInteger)code
{
    switch (code) {
        case MessageComposeResultCancelled:
            return MRErrorKitString(@"Message Cancelled", nil);
        case MessageComposeResultSent:
            return MRErrorKitString(@"Message Sent", nil);
        case MessageComposeResultFailed:
            return MRErrorKitString(@"Message Failed", nil);
    }
    return MRErrorKitString(@"Unknown Result", nil);
}

#endif

#pragma mark - Security

#ifdef ERROR_KIT_SECURITY

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
            return MRErrorKitString(@"No Error", nil);
        case errSecUnimplemented:
            return MRErrorKitString(@"Unimplemented", nil);
        case errSecParam:
            return MRErrorKitString(@"Invalid Parameter", nil);
        case errSecAllocate:
            return MRErrorKitString(@"Memory Allocation Error", nil);
        case errSecNotAvailable:
            return MRErrorKitString(@"No Trust Results Available", nil);
        case errSecAuthFailed:
            return MRErrorKitString(@"Authorization/Authentication Failed", nil);
        case errSecDuplicateItem:
            return MRErrorKitString(@"Item Already Exists", nil);
        case errSecItemNotFound:
            return MRErrorKitString(@"Item Not Found", nil);
        case errSecInteractionNotAllowed:
            return MRErrorKitString(@"Interaction Not Allowed", nil);
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case errSecReadOnly:
            return MRErrorKitString(@"Read Only Error", nil);
        case errSecNoSuchKeychain:
            return MRErrorKitString(@"Keychain Non Existent", nil);
        case errSecInvalidKeychain:
            return MRErrorKitString(@"Invalid Keychain", nil);
        case errSecDuplicateKeychain:
            return MRErrorKitString(@"Duplicate Keychain", nil);
        case errSecDuplicateCallback:
            return MRErrorKitString(@"Duplicate Callback", nil);
        case errSecInvalidCallback:
            return MRErrorKitString(@"Invalid Callback", nil);
        case errSecBufferTooSmall:
            return MRErrorKitString(@"Buffer Too Small", nil);
        case errSecDataTooLarge:
            return MRErrorKitString(@"Data Too Large", nil);
        case errSecNoSuchAttr:
            return MRErrorKitString(@"Attribute Non Existent", nil);
        case errSecInvalidItemRef:
            return MRErrorKitString(@"Invalid Item Reference", nil);
        case errSecInvalidSearchRef:
            return MRErrorKitString(@"Invalid Search Reference", nil);
        case errSecNoSuchClass:
            return MRErrorKitString(@"Keychain Class Non Existent", nil);
        case errSecNoDefaultKeychain:
            return MRErrorKitString(@"Default Keychain Non Existent", nil);
        case errSecReadOnlyAttr:
            return MRErrorKitString(@"Read Only Attribute", nil);
        case errSecWrongSecVersion:
            return MRErrorKitString(@"Wrong Version", nil);
        case errSecKeySizeNotAllowed:
            return MRErrorKitString(@"Key Size Not Allowed", nil);
        case errSecNoStorageModule:
            return MRErrorKitString(@"No Storage Module", nil);
        case errSecNoCertificateModule:
            return MRErrorKitString(@"No Certificate Module Available", nil);
        case errSecNoPolicyModule:
            return MRErrorKitString(@"No Policy Module Available", nil);
        case errSecInteractionRequired:
            return MRErrorKitString(@"User Interaction Required", nil);
        case errSecDataNotAvailable:
            return MRErrorKitString(@"Data Not Available", nil);
        case errSecDataNotModifiable:
            return MRErrorKitString(@"Data Not Modifiable", nil);
        case errSecCreateChainFailed:
            return MRErrorKitString(@"Certificate Chain Creation Failed", nil);
        case errSecACLNotSimple:
            return MRErrorKitString(@"Access Control List Not In Standard Simple Form", nil);
        case errSecPolicyNotFound:
            return MRErrorKitString(@"Policy Not Found", nil);
        case errSecInvalidTrustSetting:
            return MRErrorKitString(@"Invalid Trust Setting", nil);
        case errSecNoAccessForItem:
            return MRErrorKitString(@"No Access Control For Item", nil);
        case errSecInvalidOwnerEdit:
            return MRErrorKitString(@"Invalid Owner Edit Attempt", nil);
#endif
    }
    return MRErrorKitString(@"Keychain Error", nil);
}

#endif

#pragma mark - StoreKit

#ifdef ERROR_KIT_STORE_KIT

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
            return MRErrorKitString(@"Unknown Error", nil);
        case SKErrorClientInvalid:
            return MRErrorKitString(@"Invalid Client", nil);
        case SKErrorPaymentCancelled:
            return MRErrorKitString(@"Payment Cancelled", nil);
        case SKErrorPaymentInvalid:
            return MRErrorKitString(@"Invalid Payment", nil);
        case SKErrorPaymentNotAllowed:
            return MRErrorKitString(@"Payment Not Allowed", nil);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case SKErrorStoreProductNotAvailable:
            return MRErrorKitString(@"Product Not Available", nil);
#endif
    }
    return MRErrorKitString(@"Store Error", nil);
}

#endif

#pragma mark - TransitionKit

#ifdef ERROR_KIT_TRANSITION_KIT

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
            return MRErrorKitString(@"Transition Invalid", nil);
        case TKTransitionDeclinedError:
            return MRErrorKitString(@"Transition Declined", nil);
    }
    return MRErrorKitString(@"State Machine Error", nil);
}

#endif

@end
