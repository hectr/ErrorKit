// NSError+ErrorKit.m
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

#import "NSError+ErrorKit.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation NSError (ErrorKit)

#pragma mark - Common

- (NSString *)debugDescriptionValue
{
    return self.userInfo[@"NSDebugDescription"];
}

- (NSURL *)failingURL
{
    return self.userInfo[NSURLErrorFailingURLErrorKey];
}

- (SecTrustRef)failingURLPeerTrust
{
    return (__bridge SecTrustRef)(self.userInfo[NSURLErrorFailingURLPeerTrustErrorKey]);
}

- (NSString *)failingURLString
{
    return self.userInfo[NSURLErrorFailingURLStringErrorKey];
}

- (NSString *)filePathError
{
    return self.userInfo[NSFilePathErrorKey];
}

- (NSStringEncoding)stringEncodingError
{
    return [(NSNumber *)self.userInfo[NSStringEncodingErrorKey] unsignedIntegerValue];
}

- (NSError *)underlyingError
{
    return self.userInfo[NSUnderlyingErrorKey];
}

- (NSException *)underlyingException
{
    return self.userInfo[@"NSUnderlyingException"];
}

- (NSURL *)urlError
{
    return self.userInfo[NSURLErrorKey];
}

#pragma mark - AFNetworking

#ifdef ERROR_KIT_AFNETWORKING

- (NSURLRequest *)failingURLRequest
{
    return self.userInfo[AFNetworkingOperationFailingURLRequestErrorKey];
}

- (NSHTTPURLResponse *)failingURLResponse
{
    return self.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
}

#endif

#pragma mark - AVFoundation

#ifdef ERROR_KIT_AVFOUNDATION

- (NSString *)deviceName
{
    return self.userInfo[AVErrorDeviceKey];
}

- (CMTime)time
{
    CMTime time;
    NSValue *value = self.userInfo[AVErrorTimeKey];
    [value getValue:&time];
    return time;
}

- (NSNumber *)fileSize
{
    return self.userInfo[AVErrorFileSizeKey];
}

- (NSNumber *)processID
{
    return self.userInfo[AVErrorPIDKey];
}

- (BOOL)recordingSuccessfullyFinished
{
    NSNumber *value = self.userInfo[AVErrorRecordingSuccessfullyFinishedKey];
    return value.boolValue;
}

- (NSString *)mediaType
{
    return self.userInfo[AVErrorMediaTypeKey];
}

- (NSNumber *)mediaSubType
{
    return self.userInfo[AVErrorMediaSubTypeKey];
}

#endif

#pragma mark - CoreData

#ifdef ERROR_KIT_CORE_DATA

- (NSArray *)affectedObjects
{
    return self.userInfo[NSAffectedObjectsErrorKey];
}

- (NSArray *)affectedStores
{
    return self.userInfo[NSAffectedStoresErrorKey];
}

- (NSArray *)detailedErrors
{
    return self.userInfo[NSDetailedErrorsKey];
}

- (NSArray *)persistentStoreSaveConflicts
{
    return self.userInfo[NSPersistentStoreSaveConflictsErrorKey];
}

- (NSString *)validationKey
{
    return self.userInfo[NSValidationKeyErrorKey];
}

- (id)validationObject
{
    return self.userInfo[NSValidationObjectErrorKey];
}

- (NSPredicate *)validationPredicate
{
    return self.userInfo[NSValidationPredicateErrorKey];
}

- (id)validationValue
{
    return self.userInfo[NSValidationValueErrorKey];
}

#endif

#pragma mark - Facebook

#ifdef ERROR_KIT_FACEBOOK

- (NSError *)innerError
{
    return self.userInfo[FBErrorInnerErrorKey];
}

- (id)parsedJSONResponse
{
    return self.userInfo[FBErrorParsedJSONResponseKey];
}

- (NSInteger)HTTPStatusCode
{
    return [self.userInfo[FBErrorHTTPStatusCodeKey] integerValue];
}

- (FBSession *)session
{
    return self.userInfo[FBErrorSessionKey];
}

- (NSString *)loginFailedReason
{
    return self.userInfo[FBErrorLoginFailedReason];
}

- (NSString *)nativeDialogReason
{
    return self.userInfo[FBErrorNativeDialogReasonKey];
}

- (NSString *)insightsReason
{
    return self.userInfo[FBErrorInsightsReasonKey];
}

#endif

#pragma mark - JSONKit

- (unsigned long)atIndex
{
    return [self.userInfo[@"JKAtIndexKey"] unsignedLongValue];
}

- (unsigned long)lineNumber
{
    return [self.userInfo[@"JKLineNumberKey"] unsignedLongValue];
}

@end


#pragma mark -
#pragma mark -


@implementation NSError (ErrorKit_Helper)

- (NSString *)debugString
{
    return [MRErrorFormatter debugStringWithDomain:self.domain code:self.code];
}

- (BOOL)isCancelledError
{
#ifdef ERROR_KIT_AFNETWORKING
    if ([self.domain isEqualToString:AFNetworkingErrorDomain]) {
        return (self.code == NSURLErrorUserCancelledAuthentication ||
                self.code == NSURLErrorCancelled);
    }
#endif
#ifdef ERROR_KIT_CORE_LOCATION
    if ([self.domain isEqualToString:kCLErrorDomain]) {
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        return (self.code == kCLErrorGeocodeCanceled);
#else
        return (self.code == kCLErrorGeocodeCanceled ||
                self.code == kCLErrorDeferredCanceled);
#endif
    }
#endif
#ifdef ERROR_KIT_FACEBOOK
    if ([self.domain isEqualToString:FacebookSDKDomain]) {
        return (self.code == FBErrorOperationCancelled);
    }
#endif
#ifdef ERROR_KIT_STORE_KIT
    if ([self.domain isEqualToString:SKErrorDomain]) {
        return (self.code == SKErrorPaymentCancelled);
    }
#endif
    if ([self.domain isEqualToString:NSURLErrorDomain]) {
        return (self.code == NSURLErrorUserCancelledAuthentication ||
                self.code == NSURLErrorCancelled);
    }
#ifdef ERROR_KIT_CORE_DATA
    return ((self.code == NSUserCancelledError || self.code == NSMigrationCancelledError) &&
            [self.domain isEqualToString:NSCocoaErrorDomain]);
#else
    return (self.code == NSUserCancelledError &&
            [self.domain isEqualToString:NSCocoaErrorDomain]);
#endif
}

- (BOOL)isValidationError
{
    return (self.code >= NSValidationErrorMinimum &&
            self.code <= NSValidationErrorMaximum &&
            [self.domain isEqualToString:NSCocoaErrorDomain]);
}

@end


#pragma mark -
#pragma mark -


@implementation NSError (ErrorKit_CoreData_Helper)

#ifdef ERROR_KIT_CORE_DATA

- (NSError *)errorByCombiningWithError:(NSError *)errorOrNil
{
    if (errorOrNil == nil) {
        return self;
    }
    MRErrorBuilder *builder;
    if (self.code == NSValidationMultipleErrorsError) {
        builder = [MRErrorBuilder builderWithError:self];
        builder.detailedErrors = ([builder.detailedErrors arrayByAddingObject:errorOrNil]
                                  ?: @[ (errorOrNil.detailedErrors ?: errorOrNil) ]);
    } else {
        builder = [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain code:NSValidationMultipleErrorsError];
        builder.detailedErrors = @[ self, (errorOrNil.detailedErrors ?: errorOrNil) ];
    }
    return builder.error;
}

#endif

@end


#pragma mark -
#pragma mark -


@implementation NSError (ErrorKit_HTTP)

- (BOOL)isHTTPError
{
#ifdef ERROR_KIT_AFNETWORKING
    if ([self.domain isEqualToString:AFNetworkingErrorDomain]) {
        return YES;
    }
#endif
    return [self.domain isEqualToString:NSURLErrorDomain];
}

@end
