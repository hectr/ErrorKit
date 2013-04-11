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

/// @name NSURLError userInfo values

/// Accessors for `NSURLErrorFailingURLErrorKey` user info value.
@property (nonatomic, copy) NSURL *failingURL;

/// Accessors for `NSURLErrorFailingURLPeerTrustErrorKey` user info value.
@property (nonatomic) SecTrustRef failingURLPeerTrust;

/// Accessors for `NSURLErrorFailingURLStringErrorKey` user info value.
@property (nonatomic, copy) NSString *failingURLString;

/// @name Other userInfo values

/// Accessors for `@"NSDebugDescription"` user info value.
@property (nonatomic, copy) NSString *debugDescription;

/// Accessors for `@"NSUnderlyingException"` user info value.
@property (nonatomic, copy) NSException *underlyingException;

/// @name Creating and initializing Builder

/**
 Creates and initializes an `MRErrorBuilder` object with data from another object.
 
 If no error parameter is passed, no buider is created and the return is nil.
*/
+ (id)builderWithError:(NSError *)error;

/**
 Creates and initializes an `MRErrorBuilder` object for a given domain and code.
 
 The builder is given a predefined localized description, according its domain and code; but this string may not be adequate for being presented to the user.
 */
+ (id)builderWithDomain:(NSString *)domain code:(NSInteger)code;

/// Creates and initializes an `MRErrorBuilder` object for a given domain and code with a given localized description.
+ (id)builderWithDomain:(NSString *)domain code:(NSInteger)code description:(NSString *)localizedDescription;

/**
 Designated initializer.
 
 Returns a `MRErrorBuilder` object initialized for a given domain and code with a given userInfo dictionary.
 */
- (id)initWithDomain:(NSString *)domain code:(NSInteger)code userInfo:(NSDictionary *)userInfo;

/// Adds a given key-value pair to the user info dictionary. If given value is nil, removes the given key and its associated value from the dictionary.
- (void)setUserInfoValue:(id)value forKey:(NSString *)key;

/// @name Creating error

/// Creates and initializes an `NSError` object with the builder's domain, code and user info.
- (NSError *)error;

@end
