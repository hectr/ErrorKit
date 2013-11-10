// NSError+ErrorKit.h
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
 Adds getter methods for common `userInfo` values.
 */
@interface NSError (ErrorKit)

/// @name NSError userInfo values

/// Getter for `NSFilePathErrorKey` user info value.
@property (nonatomic, readonly) NSString *filePathError;

/// Getter for `NSStringEncodingErrorKey` user info value.
@property (nonatomic, readonly) NSStringEncoding stringEncodingError;

/// Getter for `NSUnderlyingErrorKey` user info value.
@property (nonatomic, readonly) NSError *underlyingError;

/// Getter for `NSURLErrorKey` user info value.
@property (nonatomic, readonly) NSURL *urlError;

/// @name NSURLError userInfo values

/// Getter for `NSURLErrorFailingURLErrorKey` user info value.
@property (nonatomic, readonly) NSURL *failingURL;

/// Getter for `NSURLErrorFailingURLPeerTrustErrorKey` user info value.
@property (nonatomic, readonly) SecTrustRef failingURLPeerTrust;

/// Getter for `NSURLErrorFailingURLStringErrorKey` user info value.
@property (nonatomic, readonly) NSString *failingURLString;

/// @name Other userInfo values

/// Getter for `@"NSDebugDescription"` user info value.
@property (nonatomic, readonly) NSString *debugDescriptionValue;

/// Getter for `@"NSUnderlyingException"` user info value.
@property (nonatomic, readonly) NSException *underlyingException;

/// Getter for `@"NSStackTraceKey"` user info value.
@property (nonatomic, readonly) NSString *stackTrace;

@end


/**
 This category adds methods that may help you decide whether or not to display 
 an error dialog.
 */
@interface NSError (ErrorKit_Helper)

/**
 Wrapper for 
 `[MRErrorFormatter debugStringWithDomain:self.domain code:self.code]`.
 */
- (NSString *)debugString;

/**
 Returns YES if the error code corresponds to a cancelled operation in 
 `NSURLErrorDomain` (or `AFNetworkingErrorDomain`), `NSCocoaErrorDomain`, 
 `kCLErrorDomain`, `SKErrorDomain` or `FacebookSDKDomain`.
 */
- (BOOL)isCancelledError;

/**
 Returns YES if the error code corresponds to a validation error in 
 `NSCocoaErrorDomain`.
 */
- (BOOL)isValidationError;

@end
