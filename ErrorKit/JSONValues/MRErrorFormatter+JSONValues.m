// MRErrorFormatter+JSONValues.m
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

#import "MRErrorFormatter+JSONValues.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_JSON_VALUES

@implementation MRErrorFormatter (NSError_JSONValues)

+ (NSString *)stringWithJSONPattern:(id const)pattern forKey:(NSString *)key
{
    NSString *format;
    NSString *type;
    if ([pattern isKindOfClass:NSArray.class]) {
        type = MRErrorKitString(@"an array", nil);
    } else if ([pattern isKindOfClass:NSDictionary.class]) {
        type = MRErrorKitString(@"an associative array", nil);
    } else if ([pattern isKindOfClass:NSString.class]) {
        if ([pattern isEqualToString:@"number"]) {
            type = MRErrorKitString(@"a number", nil);
        } else if ([pattern isEqualToString:@"bool"]) {
            type = MRErrorKitString(@"a boolean value", nil);
        } else if ([pattern isEqualToString:@"url"]) {
            type = MRErrorKitString(@"a URL", nil);
        } else if ([pattern isEqualToString:@"url:http"]) {
            type = MRErrorKitString(@"an HTTP URL", nil);
        } else if ([pattern isEqualToString:@"string"]) {
            type = MRErrorKitString(@"a character string", nil);
        } else if ([pattern rangeOfString:@"string:"].location != NSNotFound) {
            type = MRErrorKitString(@"a valid character string", nil);
        } else {
            return MRErrorKitString(@"Invalid pattern.", nil);
        }
    } else {
        return MRErrorKitString(@"Invalid pattern.", nil);
    }
    NSUInteger const lastIndex = [key length] - 1;
    if ([key rangeOfString:@"?"].location == lastIndex) {
        format = MRErrorKitString(@"'%@' must be %@.", nil);
        key = [key substringToIndex:lastIndex];
    } else {
        format = MRErrorKitString(@"'%@' is not optional and must be %@.", nil);
    }
    return [NSString stringWithFormat:format, key, type];
}

@end

#endif
