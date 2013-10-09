// MRErrorFormatter+MessageUI.h
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


/**
 Adds methods for *stringizing* `MFMailComposeErrorDomain` error codes.
 
 **Warning:** This extension requires the MessageUI framework.
 */
@interface MRErrorFormatter (ErrorKit_MessageUI)

/// @name Strings for debugging

/// Returns a string representation of the given `MFMailComposeErrorDomain` error code.
+ (NSString *)debugStringWithMailComposeCode:(NSInteger)errorCode;

/// Returns a string representation of the given result code.
+ (NSString *)debugStringWithMailComposeResult:(NSInteger)resultCode;

/// Returns a string representation of the given result code.
+ (NSString *)debugStringWithMessageComposeResult:(NSInteger)resultCode;

/// @name Strings for presentation

/// Returns a string representation of the given `MFMailComposeErrorDomain` error code.
+ (NSString *)stringWithMailComposeCode:(NSInteger)errorCode;

/// Returns a string representation of the given result code.
+ (NSString *)stringWithMailComposeResult:(NSInteger)resultCode;

/// Returns a string representation of the given result code.
+ (NSString *)stringWithMessageComposeResult:(NSInteger)resultCode;

@end
