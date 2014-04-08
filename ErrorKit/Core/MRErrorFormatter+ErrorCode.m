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
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation MRErrorFormatter (ErrorCode)

#pragma mark - Cocoa

+ (NSArray *)stringsForFoundationErrorCode:(NSInteger const)code
{
    NSMutableArray *const strings = [NSMutableArray arrayWithCapacity:3];
    NSBundle *const foundationBundle = [NSBundle bundleWithIdentifier:@"com.apple.Foundation"];
    NSString *const descriptionKey = [NSString stringWithFormat:@"Err%ld", (long)code];
    NSString *const description = [foundationBundle localizedStringForKey:descriptionKey value:nil table:@"FoundationErrors"];
    if (description.length > 0 && ![description isEqualToString:descriptionKey]) {
        [strings addObject:description];
    }
    NSString *const causeKey = [NSString stringWithFormat:@"Err%ld-C", (long)code];
    NSString *const cause = [foundationBundle localizedStringForKey:causeKey value:nil table:@"FoundationErrors"];
    if (cause.length > 0 && ![cause isEqualToString:causeKey]) {
        [strings addObject:cause];
    }
    NSString *const recoveryKey = [NSString stringWithFormat:@"Err%ld-R", (long)code];
    NSString *const recovery = [foundationBundle localizedStringForKey:recoveryKey value:nil table:@"FoundationErrors"];
    if (recovery.length > 0 && ![recovery isEqualToString:recoveryKey]) {
        [strings addObject:recovery];
    }
    return (strings.count > 0? strings : nil);
}

+ (NSString *)debugStringWithCocoaCode:(NSInteger const)code
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

+ (NSString *)stringWithCocoaCode:(NSInteger const)code
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
            return MRErrorKitString(@"Unsupported Feature", nil);
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

#pragma mark - XML Parser

+ (NSString *)debugStringWithXMLParserCode:(NSInteger const)code
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

+ (NSString *)stringWithXMLParserCode:(NSInteger const)code
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

@end
