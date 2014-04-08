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

+ (instancetype)builderWithError:(NSError *const)error
{
    if (error == nil) {
        return nil;
    }
    MRErrorBuilder *const builder =
        [[self alloc] initWithDomain:error.domain
                                code:error.code
                            userInfo:error.userInfo];
    builder.debugDescriptionValue = error.debugDescriptionValue;
    builder.filePathError = error.filePathError;
    builder.helpAnchor = error.helpAnchor;
    builder.localizedDescription = error.localizedDescription;
    builder.localizedFailureReason = error.localizedFailureReason;
    builder.localizedRecoveryOptions = error.localizedRecoveryOptions;
    builder.localizedRecoverySuggestion = error.localizedRecoverySuggestion;
    builder.stackTrace = error.stackTrace;
    if (error.userInfo[NSStringEncodingErrorKey]) {
        builder.stringEncodingError = error.stringEncodingError;
    }
    builder.recoveryAttempter = error.recoveryAttempter;
    builder.underlyingError = error.underlyingError;
    builder.underlyingException = error.underlyingException;
    builder.urlError = error.urlError;
#ifdef ERROR_KIT_HTTP
    builder.failingURL = error.failingURL;
    builder.failingURLPeerTrust = error.failingURLPeerTrust;
    builder.failingURLString = error.failingURLString;
#endif
#ifdef ERROR_KIT_ADDITIONS
    builder.onCancelledBlock = error.onCancelledBlock;
    builder.localizedCancelButtonTitle = error.localizedCancelButtonTitle;
    builder.localizedDismissButtonTitle = error.localizedDismissButtonTitle;
#endif
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
#ifdef ERROR_KIT_FACEBOOK_SDK
    builder.innerError = error.innerError;
    builder.parsedJSONResponse = error.parsedJSONResponse;
    if (error.userInfo[FBErrorHTTPStatusCodeKey]) {
        builder.HTTPStatusCode = error.HTTPStatusCode;
    }
    builder.session = error.session;
    builder.unprocessedURL = error.unprocessedURL;
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
#ifdef ERROR_KIT_PARSE
    if (error.userInfo[@"code"]) {
        builder.parseCode = error.parseCode;
    }
    builder.parseErrorMessage = error.parseErrorMessage;
#endif
    return builder;
}

+ (instancetype)builderWithDomain:(NSString *const)domain code:(NSInteger const)code
{
    MRErrorBuilder *const builder = [[self alloc] initWithDomain:domain code:code userInfo:nil];
    builder.localizedDescription = ([MRErrorFormatter stringWithDomain:domain code:code]
                                    ?: MRErrorKitString(@"No error description provided", nil));
    return builder;
}

+ (instancetype)builderWithDomain:(NSString *const)domain code:(NSInteger const)code description:(NSString *const)localizedDescription
{
    MRErrorBuilder *const builder =
    [[self alloc] initWithDomain:domain code:code userInfo:nil];
    builder.localizedDescription = localizedDescription;
    return builder;
}

- (id)initWithDomain:(NSString *const)domain code:(NSInteger const)code userInfo:(NSDictionary *const)userInfo;
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

- (void)setUserInfoValue:(id const)value forKey:(NSString *const)key
{
    if (value) {
        _userInfo[key] = value;
    } else {
        [_userInfo removeObjectForKey:key];
    }
}

- (void)addRecoveryOption:(NSString *const)localizedRecoveryOption withBlock:(void(^)(NSError *))recoveryOptionAttempter
{
    NSParameterAssert(localizedRecoveryOption);
    NSParameterAssert(recoveryOptionAttempter);
    NSUInteger const option = self.localizedRecoveryOptions.count;
    MRChainedRecoveryAttempter *const attempter =
    [MRChainedRecoveryAttempter attempterWithBlock:^(NSError *const error, NSUInteger const recoveryOption, BOOL *const didRecover) {
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

- (void)addRecoveryOptions:(NSArray *const)localizedRecoveryOptions withBlock:(void(^)(NSError *, NSUInteger))recoveryOptionsAttempter
{
    NSParameterAssert(localizedRecoveryOptions);
    NSParameterAssert(recoveryOptionsAttempter);
    NSUInteger const option = self.localizedRecoveryOptions.count;
    MRChainedRecoveryAttempter *const attempter =
    [MRChainedRecoveryAttempter attempterWithBlock:^(NSError *const error, NSUInteger const recoveryOption, BOOL *const didRecover) {
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

- (void)setDebugDescriptionValue:(NSString *const)debugDescription
{
    [self setUserInfoValue:debugDescription.copy forKey:@"NSDebugDescription"];
}

- (NSString *)filePathError
{
    return self.userInfo[NSFilePathErrorKey];
}

- (void)setFilePathError:(NSString *const)filePathError
{
    [self setUserInfoValue:filePathError.copy forKey:NSFilePathErrorKey];
}

- (NSString *)helpAnchor
{
    return self.userInfo[NSHelpAnchorErrorKey];
}

- (void)setHelpAnchor:(NSString *const)helpAnchor
{
    [self setUserInfoValue:helpAnchor.copy forKey:NSHelpAnchorErrorKey];
}

- (NSString *)localizedDescription
{
    return self.userInfo[NSLocalizedDescriptionKey];
}

- (void)setLocalizedDescription:(NSString *const)localizedDescription
{
    [self setUserInfoValue:localizedDescription.copy forKey:NSLocalizedDescriptionKey];
}

- (NSString *)localizedFailureReason
{
    return self.userInfo[NSLocalizedFailureReasonErrorKey];
}

- (void)setLocalizedFailureReason:(NSString *const)localizedFailureReason
{
    [self setUserInfoValue:localizedFailureReason.copy forKey:NSLocalizedFailureReasonErrorKey];
}

- (NSArray *)localizedRecoveryOptions
{
    return self.userInfo[NSLocalizedRecoveryOptionsErrorKey];
}

- (void)setLocalizedRecoveryOptions:(NSArray *const)localizedRecoveryOptions
{
    [self setUserInfoValue:localizedRecoveryOptions.copy forKey:NSLocalizedRecoveryOptionsErrorKey];
}

- (NSString *)localizedRecoverySuggestion
{
    return self.userInfo[NSLocalizedRecoverySuggestionErrorKey];
}

- (void)setLocalizedRecoverySuggestion:(NSString *const)localizedRecoverySuggestion
{
    [self setUserInfoValue:localizedRecoverySuggestion.copy forKey:NSLocalizedRecoverySuggestionErrorKey];
}

- (NSArray *)recoveryAttempter
{
    return self.userInfo[NSRecoveryAttempterErrorKey];
}

- (void)setRecoveryAttempter:(NSArray *const)recoveryAttempter
{
    [self setUserInfoValue:recoveryAttempter forKey:NSRecoveryAttempterErrorKey];
}

- (NSString *)stackTrace
{
    return self.userInfo[@"NSStackTraceKey"];
}

- (void)setStackTrace:(NSString *const)stackTrace
{
    [self setUserInfoValue:stackTrace forKey:@"NSStackTraceKey"];
}

- (NSStringEncoding)stringEncodingError
{
    return [(NSNumber *)self.userInfo[NSStringEncodingErrorKey] unsignedIntegerValue];
}

- (void)setStringEncodingError:(NSStringEncoding const)stringEncodingError
{
    [self setUserInfoValue:@(stringEncodingError) forKey:NSStringEncodingErrorKey];
}

- (NSError *)underlyingError
{
    return self.userInfo[NSUnderlyingErrorKey];
}

- (void)setUnderlyingError:(NSError *const)underlyingError
{
    [self setUserInfoValue:underlyingError forKey:NSUnderlyingErrorKey];
}

- (NSException *)underlyingException
{
    return self.userInfo[@"NSUnderlyingException"];
}

- (void)setUnderlyingException:(NSException *const)underlyingException
{
    [self setUserInfoValue:underlyingException forKey:@"NSUnderlyingException"];
}

- (NSURL *)urlError
{
    return self.userInfo[NSURLErrorKey];
}

- (void)setUrlError:(NSURL *const)urlError
{
    [self setUserInfoValue:urlError.copy forKey:NSURLErrorKey];
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *const)zone
{
    MRErrorBuilder *const builer =
    [[self.class allocWithZone:zone] initWithDomain:self.domain
                                               code:self.code
                                           userInfo:self.userInfo];
    return builer;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *const)aCoder
{
    [aCoder encodeInteger:self.code forKey:@"code"];
    [aCoder encodeObject:self.domain forKey:@"domain"];
    [aCoder encodeObject:self.userInfo forKey:@"userInfo"];
}

- (id)initWithCoder:(NSCoder *const)aDecoder
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
    return
    [NSString stringWithFormat:@"ErrorBuilder Domain=%@ Code=%ld UserInfo=%p {%@}"
                              , self.domain
                              , (long)self.code
                              , self.userInfo
                              , ([__formatter stringWithErrorDetail:self.userInfo] ?: @" ")];
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
#ifdef ERROR_KIT_FACEBOOK_SDK
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
