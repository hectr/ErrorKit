// MRErrorBuilder.m
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

#import "MRErrorBuilder.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation MRErrorBuilder

+ (instancetype)builderWithError:(NSError *)error
{
    if (error == nil) {
        return nil;
    }
    MRErrorBuilder *builder =
        [[self alloc] initWithDomain:error.domain
                                code:error.code
                            userInfo:error.userInfo];
    builder.debugDescriptionValue = error.debugDescriptionValue;
    builder.failingURL = error.failingURL;
    builder.failingURLPeerTrust = error.failingURLPeerTrust;
    builder.failingURLString = error.failingURLString;
    builder.filePathError = error.filePathError;
    builder.helpAnchor = error.helpAnchor;
    builder.localizedDescription = error.localizedDescription;
    builder.localizedFailureReason = error.localizedFailureReason;
    builder.localizedRecoveryOptions = error.localizedRecoveryOptions;
    builder.localizedRecoverySuggestion = error.localizedRecoverySuggestion;
    if (error.userInfo[NSStringEncodingErrorKey]) {
        builder.stringEncodingError = error.stringEncodingError;
    }
    builder.recoveryAttempter = error.recoveryAttempter;
    builder.underlyingError = error.underlyingError;
    builder.underlyingException = error.underlyingException;
    builder.urlError = error.urlError;
#ifdef ERROR_KIT_AFNETWORKING
    builder.failingURLRequest = error.failingURLRequest;
    builder.failingURLResponse = error.failingURLResponse;
#endif
#ifdef ERROR_KIT_AVFOUNDATION
    builder.deviceName = error.deviceName;
    if (error.userInfo[AVErrorTimeKey]) {
        builder.time = error.time;
    }
    builder.fileSize = error.fileSize;
    builder.processID = error.processID;
    if (error.userInfo[AVErrorRecordingSuccessfullyFinishedKey]) {
        builder.recordingSuccessfullyFinished = error.recordingSuccessfullyFinished;
    }
    builder.mediaType = error.mediaType;
    builder.mediaSubType = error.mediaSubType;
#endif
#ifdef ERROR_KIT_CORE_DATA
    builder.affectedObjects = error.affectedObjects;
    builder.affectedStores = error.affectedStores;
    builder.detailedErrors = error.detailedErrors;
    builder.persistentStoreSaveConflicts = error.persistentStoreSaveConflicts;
    builder.validationKey = error.validationKey;
    builder.validationObject = error.validationObject;
    builder.validationPredicate = error.validationPredicate;
    builder.validationValue = error.validationValue;
#endif
#ifdef ERROR_KIT_FACEBOOK
    builder.innerError = error.innerError;
    builder.parsedJSONResponse = error.parsedJSONResponse;
    if (error.userInfo[FBErrorHTTPStatusCodeKey]) {
        builder.HTTPStatusCode = error.HTTPStatusCode;
    }
    builder.session = error.session;
    builder.loginFailedReason = error.loginFailedReason;
    builder.nativeDialogReason = error.nativeDialogReason;
    builder.insightsReason = error.insightsReason;
#endif
#ifdef ERROR_KIT_JSON_KIT
    if (error.userInfo[@"JKAtIndexKey"]) {
        builder.atIndex = error.atIndex;
    }
    if (error.userInfo[@"JKLineNumberKey"]) {
        builder.lineNumber = error.lineNumber;
    }
#endif
    return builder;
}

+ (instancetype)builderWithDomain:(NSString *)domain code:(NSInteger)code
{
    MRErrorBuilder *builder = [[self alloc] initWithDomain:domain code:code userInfo:nil];
    builder.localizedDescription = ([MRErrorFormatter stringWithDomain:domain code:code]
                                    ?: MRErrorKitString(@"No error description provided", nil));
    return builder;
}

+ (instancetype)builderWithDomain:(NSString *)domain code:(NSInteger)code description:(NSString *)localizedDescription
{
    MRErrorBuilder *builder = [[self alloc] initWithDomain:domain code:code userInfo:nil];
    builder.localizedDescription = localizedDescription;
    return builder;
}

- (id)initWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(NSDictionary *)userInfo;
{
    NSParameterAssert(domain);
    self = [super init];
    if (self) {
        self.domain = domain;
        self.code = code;
        if (userInfo) {
            _userInfo = userInfo.mutableCopy;
        } else {
            _userInfo = NSMutableDictionary.new;
        }
    }
    return self;
}

- (void)setUserInfoValue:(id)value forKey:(NSString *)key
{
    if (value) {
        [_userInfo setObject:value forKey:key];
    } else {
        [_userInfo removeObjectForKey:key];
    }
}

- (void)addRecoveryOption:(NSString *)localizedRecoveryOption withBlock:(void(^)(NSError *))recoveryOptionAttempter
{
    NSParameterAssert(localizedRecoveryOption);
    NSParameterAssert(recoveryOptionAttempter);
    NSUInteger option = self.localizedRecoveryOptions.count;
    MRChainedRecoveryAttempter *attempter =
        [MRChainedRecoveryAttempter attempterWithBlock:^(NSError *error, NSUInteger recoveryOption, BOOL *didRecover) {
            if (recoveryOption == option) {
                recoveryOptionAttempter(error);
                *didRecover = YES;
            }
        }];
    attempter.nextAttempter = self.recoveryAttempter;
    self.recoveryAttempter = attempter;
    if (!self.localizedRecoveryOptions) {
        self.localizedRecoveryOptions = @[ ];
    }
    self.localizedRecoveryOptions =
        [self.localizedRecoveryOptions arrayByAddingObject:localizedRecoveryOption];
}

- (void)addRecoveryOptions:(NSArray *)localizedRecoveryOptions withBlock:(void(^)(NSError *, NSUInteger))recoveryOptionsAttempter
{
    NSParameterAssert(localizedRecoveryOptions);
    NSParameterAssert(recoveryOptionsAttempter);
    NSUInteger option = self.localizedRecoveryOptions.count;
    MRChainedRecoveryAttempter *attempter =
    [MRChainedRecoveryAttempter attempterWithBlock:^(NSError *error, NSUInteger recoveryOption, BOOL *didRecover) {
        if (recoveryOption >= option
            && recoveryOption < option + localizedRecoveryOptions.count) {
            recoveryOptionsAttempter(error, recoveryOption);
            *didRecover = YES;
        }
    }];
    attempter.nextAttempter = self.recoveryAttempter;
    self.recoveryAttempter = attempter;
    if (!self.localizedRecoveryOptions) {
        self.localizedRecoveryOptions = @[ ];
    }
    self.localizedRecoveryOptions =
    [self.localizedRecoveryOptions arrayByAddingObjectsFromArray:localizedRecoveryOptions];
}

- (NSError *)error
{
    return [NSError errorWithDomain:self.domain
                               code:self.code
                           userInfo:self.userInfo];
}

#pragma mark Accessor methods

- (NSString *)debugDescriptionValue
{
    return self.userInfo[@"NSDebugDescription"];
}

- (void)setDebugDescriptionValue:(NSString *)debugDescription
{
    [self setUserInfoValue:debugDescription.copy forKey:@"NSDebugDescription"];
}


- (NSURL *)failingURL
{
    return self.userInfo[NSURLErrorFailingURLErrorKey];
}

- (void)setFailingURL:(NSURL *)failingURL
{
    [self setUserInfoValue:failingURL.copy forKey:NSURLErrorFailingURLErrorKey];
}

- (SecTrustRef)failingURLPeerTrust
{
    return (__bridge SecTrustRef)(self.userInfo[NSURLErrorFailingURLPeerTrustErrorKey]);
}

- (void)setFailingURLPeerTrust:(SecTrustRef)failingURLPeerTrust
{
    [self setUserInfoValue:(__bridge id)failingURLPeerTrust forKey:NSURLErrorFailingURLPeerTrustErrorKey];
}

- (NSString *)failingURLString
{
    return self.userInfo[NSURLErrorFailingURLStringErrorKey];
}

- (void)setFailingURLString:(NSString *)failingURLString
{
    [self setUserInfoValue:failingURLString.copy forKey:NSURLErrorFailingURLStringErrorKey];
}

- (NSString *)filePathError
{
    return self.userInfo[NSFilePathErrorKey];
}

- (void)setFilePathError:(NSString *)filePathError
{
    [self setUserInfoValue:filePathError.copy forKey:NSFilePathErrorKey];
}

- (NSString *)helpAnchor
{
    return self.userInfo[NSHelpAnchorErrorKey];
}

- (void)setHelpAnchor:(NSString *)helpAnchor
{
    [self setUserInfoValue:helpAnchor.copy forKey:NSHelpAnchorErrorKey];
}

- (NSString *)localizedDescription
{
    return self.userInfo[NSLocalizedDescriptionKey];
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
    [self setUserInfoValue:localizedDescription.copy forKey:NSLocalizedDescriptionKey];
}

- (NSString *)localizedFailureReason
{
    return self.userInfo[NSLocalizedFailureReasonErrorKey];
}

- (void)setLocalizedFailureReason:(NSString *)localizedFailureReason
{
    [self setUserInfoValue:localizedFailureReason.copy forKey:NSLocalizedFailureReasonErrorKey];
}

- (NSArray *)localizedRecoveryOptions
{
    return self.userInfo[NSLocalizedRecoveryOptionsErrorKey];
}

- (void)setLocalizedRecoveryOptions:(NSArray *)localizedRecoveryOptions
{
    [self setUserInfoValue:localizedRecoveryOptions.copy forKey:NSLocalizedRecoveryOptionsErrorKey];
}

- (NSString *)localizedRecoverySuggestion
{
    return self.userInfo[NSLocalizedRecoverySuggestionErrorKey];
}

- (void)setLocalizedRecoverySuggestion:(NSString *)localizedRecoverySuggestion
{
    [self setUserInfoValue:localizedRecoverySuggestion.copy forKey:NSLocalizedRecoverySuggestionErrorKey];
}

- (NSArray *)recoveryAttempter
{
    return self.userInfo[NSRecoveryAttempterErrorKey];
}

- (void)setRecoveryAttempter:(NSArray *)recoveryAttempter
{
    [self setUserInfoValue:recoveryAttempter forKey:NSRecoveryAttempterErrorKey];
}

- (NSStringEncoding)stringEncodingError
{
    return [(NSNumber *)self.userInfo[NSStringEncodingErrorKey] unsignedIntegerValue];
}

- (void)setStringEncodingError:(NSStringEncoding)stringEncodingError
{
    [self setUserInfoValue:@(stringEncodingError) forKey:NSStringEncodingErrorKey];
}

- (NSError *)underlyingError
{
    return self.userInfo[NSUnderlyingErrorKey];
}

- (void)setUnderlyingError:(NSError *)underlyingError
{
    [self setUserInfoValue:underlyingError forKey:NSUnderlyingErrorKey];
}

- (NSException *)underlyingException
{
    return self.userInfo[@"NSUnderlyingException"];
}

- (void)setUnderlyingException:(NSException *)underlyingException
{
    [self setUserInfoValue:underlyingException forKey:@"NSUnderlyingException"];
}

- (NSURL *)urlError
{
    return self.userInfo[NSURLErrorKey];
}

- (void)setUrlError:(NSURL *)urlError
{
    [self setUserInfoValue:urlError.copy forKey:NSURLErrorKey];
}

#pragma mark - AFNetwokring

#ifdef ERROR_KIT_AFNETWORKING

- (NSURLRequest *)failingURLRequest
{
    return self.userInfo[AFNetworkingOperationFailingURLRequestErrorKey];
}

- (void)setFailingURLRequest:(NSURLRequest *)failingURLRequest
{
    [self setUserInfoValue:failingURLRequest.copy forKey:AFNetworkingOperationFailingURLRequestErrorKey];
}

- (NSHTTPURLResponse *)failingURLResponse
{
    return self.userInfo[AFNetworkingOperationFailingURLResponseErrorKey];
}

- (void)setFailingURLResponse:(NSHTTPURLResponse *)failingURLResponse
{
    [self setUserInfoValue:failingURLResponse.copy forKey:AFNetworkingOperationFailingURLResponseErrorKey];
}

#endif

#pragma mark - AVFoundation

#ifdef ERROR_KIT_AVFOUNDATION

- (NSString *)deviceName
{
    return self.userInfo[AVErrorDeviceKey];
}

- (void)setDeviceName:(NSString *)deviceName
{
    [self setUserInfoValue:deviceName.copy forKey:AVErrorDeviceKey];
}

- (CMTime)time
{
    NSValue *value = self.userInfo[AVErrorTimeKey];
    return value.CMTimeValue;
}

- (void)setTime:(CMTime)time
{
    NSValue *value = [NSValue valueWithCMTime:time];
    [self setUserInfoValue:value forKey:AVErrorTimeKey];
}

- (NSNumber *)fileSize
{
    return self.userInfo[AVErrorFileSizeKey];
}

- (void)setFileSize:(NSNumber *)fileSize
{
    [self setUserInfoValue:fileSize.copy forKey:AVErrorFileSizeKey];
}

- (NSNumber *)processID
{
    return self.userInfo[AVErrorPIDKey];
}

- (void)setProcessID:(NSNumber *)processID
{
    [self setUserInfoValue:processID.copy forKey:AVErrorPIDKey];
}

- (BOOL)recordingSuccessfullyFinished
{
    NSNumber *value = self.userInfo[AVErrorRecordingSuccessfullyFinishedKey];
    return value.boolValue;
}

- (void)setRecordingSuccessfullyFinished:(BOOL)recordingSuccessfullyFinished
{
    [self setUserInfoValue:@(recordingSuccessfullyFinished) forKey:AVErrorRecordingSuccessfullyFinishedKey];
}

- (NSString *)mediaType
{
    return self.userInfo[AVErrorMediaTypeKey];
}

- (void)setMediaType:(NSString *)mediaType
{
    [self setUserInfoValue:mediaType.copy forKey:AVErrorMediaTypeKey];
}

- (NSNumber *)mediaSubType
{
    return self.userInfo[AVErrorMediaSubTypeKey];
}

- (void)setMediaSubType:(NSNumber *)mediaSubType
{
    [self setUserInfoValue:mediaSubType.copy forKey:AVErrorMediaSubTypeKey];
}

#endif

#pragma mark - CoreData

#ifdef ERROR_KIT_CORE_DATA

- (NSArray *)affectedObjects
{
    return self.userInfo[NSAffectedObjectsErrorKey];
}

- (void)setAffectedObjects:(NSArray *)affectedObjects
{
    [self setUserInfoValue:affectedObjects.copy forKey:NSAffectedObjectsErrorKey];
}

- (NSArray *)affectedStores
{
    return self.userInfo[NSAffectedStoresErrorKey];
}

-(void)setAffectedStores:(NSArray *)affectedStores
{
    [self setUserInfoValue:affectedStores.copy forKey:NSAffectedStoresErrorKey];
}

- (NSArray *)detailedErrors
{
    return self.userInfo[NSDetailedErrorsKey];
}

- (void)setDetailedErrors:(NSArray *)detailedErrors
{
    [self setUserInfoValue:detailedErrors.copy forKey:NSDetailedErrorsKey];
}

- (NSArray *)persistentStoreSaveConflicts
{
    return self.userInfo[NSPersistentStoreSaveConflictsErrorKey];
}

- (void)setPersistentStoreSaveConflicts:(NSArray *)persistentStoreSaveConflicts
{
    [self setUserInfoValue:persistentStoreSaveConflicts.copy forKey:NSPersistentStoreSaveConflictsErrorKey];
}

- (NSString *)validationKey
{
    return self.userInfo[NSValidationKeyErrorKey];
}

- (void)setValidationKey:(NSString *)validationKey
{
    [self setUserInfoValue:validationKey.copy forKey:NSValidationKeyErrorKey];
}

- (id)validationObject
{
    return self.userInfo[NSValidationObjectErrorKey];
}

- (void)setValidationObject:(id)validationObject
{
    [self setUserInfoValue:validationObject forKey:NSValidationObjectErrorKey];
}

- (NSPredicate *)validationPredicate
{
    return self.userInfo[NSValidationPredicateErrorKey];
}

- (void)setValidationPredicate:(NSPredicate *)validationPredicate
{
    [self setUserInfoValue:validationPredicate.copy forKey:NSValidationPredicateErrorKey];
}

- (id)validationValue
{
    return self.userInfo[NSValidationValueErrorKey];
}

- (void)setValidationValue:(id)validationValue
{
    [self setUserInfoValue:validationValue forKey:NSValidationValueErrorKey];
}

#endif

#pragma mark - Facebook

#ifdef ERROR_KIT_FACEBOOK

- (NSError *)innerError
{
    return self.userInfo[FBErrorInnerErrorKey];
}

- (void)setInnerError:(NSError *)innerError
{
    [self setUserInfoValue:innerError forKey:FBErrorInnerErrorKey];
}

- (id)parsedJSONResponse
{
    return self.userInfo[FBErrorParsedJSONResponseKey];
}

- (void)setParsedJSONResponse:(id)parsedJSONResponse
{
    [self setUserInfoValue:parsedJSONResponse forKey:FBErrorParsedJSONResponseKey];
}

- (NSInteger)HTTPStatusCode
{
    return [self.userInfo[FBErrorHTTPStatusCodeKey] integerValue];
}

- (void)setHTTPStatusCode:(NSInteger)HTTPStatusCode
{
    [self setUserInfoValue:@(HTTPStatusCode) forKey:FBErrorHTTPStatusCodeKey];
}

- (FBSession *)session
{
    return self.userInfo[FBErrorSessionKey];
}

- (void)setSession:(FBSession *)session
{
    [self setUserInfoValue:session forKey:FBErrorSessionKey];
}

- (NSString *)loginFailedReason
{
    return self.userInfo[FBErrorLoginFailedReason];
}

- (void)setLoginFailedReason:(NSString *)loginFailedReason
{
    [self setUserInfoValue:loginFailedReason.copy forKey:FBErrorLoginFailedReason];
}

- (NSString *)nativeDialogReason
{
    return self.userInfo[FBErrorNativeDialogReasonKey];
}

- (void)setNativeDialogReason:(NSString *)nativeDialogReason
{
    [self setUserInfoValue:nativeDialogReason.copy forKey:FBErrorNativeDialogReasonKey];
}

- (NSString *)insightsReason
{
    return self.userInfo[FBErrorInsightsReasonKey];
}

- (void)setInsightsReason:(NSString *)insightsReason
{
    [self setUserInfoValue:insightsReason.copy forKey:FBErrorInsightsReasonKey];
}

#endif

#pragma mark - JSONKit

#ifdef ERROR_KIT_JSON_KIT

- (unsigned long)atIndex
{
    return [self.userInfo[@"JKAtIndexKey"] unsignedLongValue];
}

- (void)setAtIndex:(unsigned long)atIndex
{
    [self setUserInfoValue:@(atIndex) forKey:@"JKAtIndexKey"];
}

- (unsigned long)lineNumber
{
    return [self.userInfo[@"JKLineNumberKey"] unsignedLongValue];
}

- (void)setLineNumber:(unsigned long)lineNumber
{
    [self setUserInfoValue:@(lineNumber) forKey:@"JKLineNumberKey"];
}

#endif

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    MRErrorBuilder *builer = [[[self class] allocWithZone:zone] initWithDomain:self.domain
                                                                          code:self.code
                                                                      userInfo:self.userInfo];
    return builer;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeInteger:self.code forKey:@"code"];
    [aCoder encodeObject:self.domain forKey:@"domain"];
    [aCoder encodeObject:self.userInfo forKey:@"userInfo"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self initWithDomain:[aDecoder decodeObjectForKey:@"domain"]
                           code:[aDecoder decodeIntegerForKey:@"code"]
                       userInfo:[aDecoder decodeObjectForKey:@"userInfo"]];
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    static MRErrorFormatter *__formatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __formatter = [[MRErrorFormatter alloc] init];
    });
    return [NSString stringWithFormat:@"ErrorBuilder Domain=%@ Code=%d UserInfo=%p {%@}"
                                      , self.domain
                                      , self.code
                                      , self.userInfo
                                      , [__formatter stringWithErrorDetail:self.userInfo]];
}

@end


#pragma mark -
#pragma mark -


@implementation MRErrorBuilder (ErrorKit_Helper)

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


@implementation MRErrorBuilder (ErrorKit_CoreData_Helper)

#ifdef ERROR_KIT_CORE_DATA

- (NSError *)errorByCombiningWithError:(NSError *)errorOrNil
{
    if (errorOrNil == nil) {
        return self.error;
    }
    MRErrorBuilder *builder;
    if (self.code == NSValidationMultipleErrorsError) {
        builder = self;
        builder.detailedErrors = ([builder.detailedErrors arrayByAddingObject:errorOrNil]
                                  ?: @[ (errorOrNil.detailedErrors ?: errorOrNil) ]);
    } else {
        builder = [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain code:NSValidationMultipleErrorsError];
        builder.detailedErrors = @[ self.error, (errorOrNil.detailedErrors ?: errorOrNil) ];
    }
    return builder.error;
}

#endif

@end


#pragma mark -
#pragma mark -


@implementation MRErrorBuilder (ErrorKit_HTTP)

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
