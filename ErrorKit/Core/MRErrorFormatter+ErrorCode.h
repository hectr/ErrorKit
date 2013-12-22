// MRErrorFormatter+ErrorCode.h
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

#import "MRErrorFormatter.h"


#ifndef mr_stringize_error_code
#define mr_stringize_error_code(arg) [NSString stringWithUTF8String:#arg]
#endif


/**
 Adds methods for *stringizing* error codes.
 
 @warning The strings supplied by these methods are not suitable for using in 
 production environments.
 */
@interface MRErrorFormatter (ErrorCode)

/**
 Returns an array that may contain one or more of the following strings for the 
 given error code: localized description, localized failure reason and localized
 recovery suggestion. The returned strings are gotten from *FoundationErrors* 
 string table and do not contain any format arguments.
 
 @param errorCode One of the `NSError` codes defined in `FoundationErrors.h`.
 
 @return An array with the localized strings or nil if there weren't any matches
 for the given `errorCode` (e.g. NSExecutableArchitectureMismatchError, 
 NSExecutableRuntimeMismatchError, NSExecutableLoadError and
 NSExecutableLinkError).
 */
+ (NSArray *)stringsForFoundationErrorCode:(NSInteger)errorCode;

/// @name Strings for debugging

/**
 Returns a string representation of the given `NSCocoaErrorDomain` error code.
 */
+ (NSString *)debugStringWithCocoaCode:(NSInteger)errorCode;

/**
 Returns a string representation of the given `NSXMLParserErrorDomain` error 
 code.
 */
+ (NSString *)debugStringWithXMLParserCode:(NSInteger)errorCode;

/// @name Strings for presentation

/**
 Returns a string representation of the given `NSCocoaErrorDomain` error code.
 */
+ (NSString *)stringWithCocoaCode:(NSInteger)errorCode;

/**
 Returns a string representation of the given `NSXMLParserErrorDomain` error 
 code.
 */
+ (NSString *)stringWithXMLParserCode:(NSInteger)errorCode;

@end
