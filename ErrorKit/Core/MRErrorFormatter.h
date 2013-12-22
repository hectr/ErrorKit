// MRErrorFormatter.h
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


/**
 `MRErrorFormatter` creates localized string representations of `NSError` objects. There are also methods that aid in error presentation.
 */
@interface MRErrorFormatter : NSObject <NSCopying, NSCoding>

@property (nonatomic, assign) BOOL shortenStrings;

/// @name Strings for debugging

/**
 Returns a string that represents the given error.
 
 If `shortenStrings` is set you can expect the string to be shorter than the one returned by [NSError description].
 */
- (NSString *)debugStringFromError:(NSError *)error;

/**
 Returns a string that contains the key-value pairs of the given dictionary.

 If `shortenStrings` is not set, `NSLocalizedDescriptionKey` is the first pair of the returned string, otherwise it is not included.
 */
- (NSString *)stringWithErrorDetail:(NSDictionary *)userInfo;

/// Returns a debug string representation for the given domain and error code combination.
+ (NSString *)debugStringWithDomain:(NSString *)domain code:(NSInteger)errorCode;

/// @name Strings for presentation

/**
 Returns a localized string representation for the given domain and error code combination.

 This method may return `nil` if the given domain is not known.
 */
+ (NSString *)stringWithDomain:(NSString *)domain code:(NSInteger)errorCode;

/// Returns a string representation of a given error.
+ (NSString *)stringFromError:(NSError *)error;

/**
 Returns a suitable title for presenting a given error.

 Use this method in convination with `stringForMessageFromError:`.
 */
+ (NSString *)stringForTitleFromError:(NSError *)error;

/**
 Returns a suitable message for presenting a given error.
 
 Use this method in convination with `stringForTitleFromError:`.
 */
+ (NSString *)stringForMessageFromError:(NSError *)error;

/// Returns a suitable cancel button title for presenting a given error.
+ (NSString *)stringForCancelButtonFromError:(NSError *)error;

/**
 Returns a suitable help button title for the given error or `nil` if
 it does not have `helpAnchor`.
 */
+ (NSString *)stringForHelpButtonFromError:(NSError *)error;

/**
 Returns a suitable help title for the given error or `nil` if it does not have 
 `helpAnchor`.
 */
+ (NSString *)stringForHelpTitleFromError:(NSError *)error;

/**
 Returns a suitable help dismiss button title for the given error or `nil` if it
 does not have `helpAnchor`.
 */
+ (NSString *)stringForHelpDismissButtonFromError:(NSError *)error;

@end


/**
 Returns a localized version of a string.
 
 @param key The key for a string.
 @param comment Engineer comment (used by `genstrings` utility).
 
 @return A localized version of a string.
 */
NSString *MRErrorKitString(NSString *key, NSString *comment);
