// NSJSONSerialization+JSONValues.m
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

#import "NSJSONSerialization+JSONValues.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_JSON_VALUES

@implementation NSJSONSerialization (ErrorKit_JSONValues)

+ (NSError *)mr_validationErrorWithJSONData:(id)data pattern:(id)pattern value:(id)value
{
    MRErrorBuilder *builder =
    [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain
                                 code:NSKeyValueValidationError];
    if (![data isKindOfClass:NSData.class]) {
        builder.localizedFailureReason =
        [MRErrorFormatter stringWithExceptionName:NSInvalidArgumentException];
#ifdef ERROR_KIT_CORE_DATA
        builder.validationKey = @"class";
        builder.validationValue = NSStringFromClass([data class]);
        builder.validationObject = data;
#endif
    } else {
        NSString *key = MRErrorKitString(@"JSON value", nil);
        NSString *optionalKey = [key stringByAppendingString:@"?"];
        builder.localizedFailureReason =
        [MRErrorFormatter stringWithJSONPattern:pattern
                                         forKey:optionalKey];
#ifdef ERROR_KIT_CORE_DATA
        builder.validationValue = value;
        builder.validationObject = data;
#endif
    }
    return builder.error;
}

+ (NSError *)mr_validationErrorWithJSONObject:(id)object pattern:(id)pattern
{
    MRErrorBuilder *builder =
    [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain
                                 code:NSKeyValueValidationError];
    NSString *key = MRErrorKitString(@"JSON value", nil);
    NSString *optionalKey = [key stringByAppendingString:@"?"];
    builder.localizedDescription =
    [MRErrorFormatter stringWithJSONPattern:pattern
                                     forKey:optionalKey];
    builder.localizedFailureReason =
    [MRErrorFormatter stringWithExceptionName:NSInvalidArgumentException];
#ifdef ERROR_KIT_CORE_DATA
        builder.validationKey = @"class";
        builder.validationValue = NSStringFromClass([object class]);
        builder.validationObject = object;
#endif
    return builder.error;
}

+ (NSArray *)arrayWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)errorPtr
{
    NSArray *candidate;
    if ([data isKindOfClass:NSData.data]) {
        candidate = [self JSONObjectWithData:data options:opt error:errorPtr];
        if ([candidate isKindOfClass:NSArray.class]) {
            return candidate;
        }
    } else {
        candidate = nil;
    }
    if (errorPtr) {
        *errorPtr =  [self.class mr_validationErrorWithJSONData:data
                                                        pattern:@[ ]
                                                          value:candidate];
    }
    return nil;
}

+ (NSDictionary *)dictionaryWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)errorPtr
{
    NSDictionary *candidate;
    if ([data isKindOfClass:NSData.data]) {
        candidate = [self JSONObjectWithData:data options:opt error:errorPtr];
        if ([candidate isKindOfClass:NSDictionary.class]) {
            return candidate;
        }
    } else {
        candidate = nil;
    }
    if (errorPtr) {
        *errorPtr =  [self.class mr_validationErrorWithJSONData:data
                                                        pattern:@{ }
                                                          value:candidate];
    }
    return nil;
}

+ (NSData *)dataWithArray:(NSArray *)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)errorPtr
{
    if ([obj isKindOfClass:NSArray.class]) {
        return [self dataWithJSONObject:obj options:opt error:errorPtr];
    } else if (errorPtr) {
        *errorPtr = [self mr_validationErrorWithJSONObject:obj
                                                   pattern:@[ ]];
    }
    return nil;
}

+ (NSData *)dataWithDictionary:(NSDictionary *)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)errorPtr
{
    if ([obj isKindOfClass:NSDictionary.class]) {
        return [self dataWithJSONObject:obj options:opt error:errorPtr];
    } else if (errorPtr) {
        *errorPtr = [self mr_validationErrorWithJSONObject:obj
                                                   pattern:@{ }];
    }
    return nil;
}

@end

#endif
