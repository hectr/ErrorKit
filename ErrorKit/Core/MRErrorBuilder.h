// MRErrorBuilder.h
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

#import <Foundation/Foundation.h>

@class NSManagedObject;


/**
 Concrete builder of `NSError` instances.
 */
@interface MRErrorBuilder : NSObject <NSCopying, NSCoding> {
    NSMutableDictionary *_userInfo;
}

/// @name Defining error

/// Error code.
@property (nonatomic, assign) NSInteger code;

/// Error domain.
@property (nonatomic, copy) NSString *domain;

/// User info.
@property (nonatomic, copy, readonly) NSDictionary *userInfo;

/// @name NSError userInfo values

/// Accessors for `NSFilePathErrorKey` user info value.
@property (nonatomic, copy) NSString *filePathError;

/// Accessors for `NSHelpAnchorErrorKey` user info value.
@property (nonatomic, copy) NSString *helpAnchor;

/// Accessors for `NSLocalizedDescriptionKey` user info value.
@property (nonatomic, copy) NSString *localizedDescription;

/// Accessors for `NSLocalizedFailureReasonErrorKey` user info value.
@property (nonatomic, copy) NSString *localizedFailureReason;

/// Accessors for `NSLocalizedRecoveryOptionsErrorKey` user info value.
@property (nonatomic, copy) NSArray /* of NSString */*localizedRecoveryOptions;

/// Accessors for `NSLocalizedRecoverySuggestionErrorKey` user info value.
@property (nonatomic, copy) NSString *localizedRecoverySuggestion;

/// Accessors for `NSRecoveryAttempterErrorKey` user info value.
@property (nonatomic, strong) NSObject /* NSErrorRecoveryAttempting */*recoveryAttempter;

/// Accessors for `NSStringEncodingErrorKey` user info value.
@property (nonatomic) NSStringEncoding stringEncodingError;

/// Accessors for `NSUnderlyingErrorKey` user info value.
@property (nonatomic, strong) NSError *underlyingError;

/// Accessors for `NSURLErrorKey` user info value.
@property (nonatomic, copy) NSURL *urlError;

/// @name Other userInfo values

/// Accessors for `@"NSDebugDescription"` user info value.
@property (nonatomic, copy) NSString *debugDescriptionValue;

/// Accessors for `@"NSUnderlyingException"` user info value.
@property (nonatomic, strong) NSException *underlyingException;

/// Accessors for `@"NSStackTraceKey"` user info value.
@property (nonatomic, strong) NSString *stackTrace;

/// @name Creating and initializing Builder

/**
 Creates and initializes an `MRErrorBuilder` object with data from another
 object.
 
 If no error parameter is passed, no buider is created and the return is `nil`.
 
 @param error Source error object or `nil`.
 
 @return Builder object initialized with all data gathered from the given error
 or `nil`.
 */
+ (instancetype)builderWithError:(NSError *)error;

/**
 Creates and initializes an `MRErrorBuilder` object for a given domain and code.
 
 The builder is given a predefined localized description, according its domain 
 and code; but this string may not be adequate for being presented to the user.
 
 @param domain The error domain.
 @param code The error code for the error.
 
 @return Builder object initialized for domain with the specified error code and
 some predefined localized description.
 */
+ (instancetype)builderWithDomain:(NSString *)domain code:(NSInteger)code;

/**
 Creates and initializes an `MRErrorBuilder` object for a given domain and code 
 with a given localized description.
 
 @param domain The error domain.
 @param code The error code for the error.
 param userInfo The userInfo dictionary for the builder. `userInfo` may be 
 `nil`.
 
 @return Builder object initialized for domain with the specified error code and
 localized description.
 */
+ (instancetype)builderWithDomain:(NSString *)domain code:(NSInteger)code description:(NSString *)localizedDescription;

/**
 Designated initializer.
 
 Returns a `MRErrorBuilder` object initialized for a given domain and code with 
 a given userInfo dictionary.
 
 @param domain The error domain.
 @param code The error code for the error.
 param userInfo The userInfo dictionary for the builder. `userInfo` may be 
 `nil`.
 
 @return Builder object initialized for domain with the specified error code and
 the dictionary of arbitrary data userInfo.
 */
- (id)initWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(NSDictionary *)userInfo;

/**
 Adds a given key-value pair to the user info dictionary. If given value is 
 `nil`, removes the given key and its associated value from the dictionary.
 
 @param value The value for key or `nil`.
 @param key The key for value or the key to remove.
 */
- (void)setUserInfoValue:(id)value forKey:(NSString *)key;

/// Adds a recovery option and its recovery attempter block to the receiver.
- (void)addRecoveryOption:(NSString *)localizedRecoveryOption withBlock:(void(^)(NSError *error))recoveryOptionAttempter;

/**
 Adds an array of recovery options and their recovery attempter block to the 
 receiver.
 */
- (void)addRecoveryOptions:(NSArray *)localizedRecoveryOptions withBlock:(void(^)(NSError *error, NSUInteger recoveryOption))recoveryOptionsAttempter;

/// @name Creating error

/**
 Creates and initializes an `NSError` object with the builder's domain, code and
 user info.
 
 @return An `NSError` object for builder's domain and error code and userInfo 
 dictionary.
 */
- (NSError *)error;

@end


/**
 This category adds methods that may help you decide whether or not to display
 an error dialog.
 */
@interface MRErrorBuilder (ErrorKit_Helper)

/**
 Wrapper for 
 `[MRErrorFormatter debugStringWithDomain:self.domain code:self.code]`.
 */
- (NSString *)debugString;

/**
 Returns YES if the error code corresponds to a cancelled operation in 
 `NSURLErrorDomain` (or `AFNetworkingErrorDomain`), `NSCocoaErrorDomain`, 
 `kCLErrorDomain`, `SKErrorDomain` or `FacebookSDKDomain`.
 **/
- (BOOL)isCancelledError;

/** Returns YES if the error code corresponds to a validation error in 
 `NSCocoaErrorDomain`.
 */
- (BOOL)isValidationError;

@end
