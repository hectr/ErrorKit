// NSMutableDictionary+JSONValues.m
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

#import "NSMutableDictionary+JSONValues.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_JSON_VALUES

@interface NSDictionary ()

+ (NSError *)mr_validationErrorWithKey:(id)aKey JSONPattern:(id)pattern object:(id)object value:(id)value;

@end


@implementation NSMutableDictionary (ErrorKit_JSONValues)

- (BOOL)setNumber:(NSNumber *const)candidate forKey:(id<NSCopying> const)aKey withError:(NSError **const)errorPtr
{
    if (aKey && [candidate isKindOfClass:NSNumber.class]) {
        self[aKey] = candidate;
        return YES;
    } else if (errorPtr) {
        *errorPtr = [self.class mr_validationErrorWithKey:aKey
                                              JSONPattern:@"number"
                                                   object:nil
                                                    value:candidate];
    }
    return NO;
}

- (BOOL)setString:(NSString *const)candidate forKey:(id<NSCopying> const)aKey withError:(NSError **const)errorPtr
{
    if (aKey && [candidate isKindOfClass:NSString.class]) {
        self[aKey] = candidate;
        return YES;
    } else if (errorPtr) {
        *errorPtr = [self.class mr_validationErrorWithKey:aKey
                                              JSONPattern:@"string"
                                                   object:nil
                                                    value:candidate];
    }
    return NO;
}

- (BOOL)setArray:(NSArray *const)candidate forKey:(id<NSCopying> const)aKey withError:(NSError **const)errorPtr
{
    if (aKey && [candidate isKindOfClass:NSArray.class]) {
        self[aKey] = candidate;
        return YES;
    } else if (errorPtr) {
        *errorPtr = [self.class mr_validationErrorWithKey:aKey
                                              JSONPattern:@[ ]
                                                   object:nil
                                                    value:candidate];
    }
    return NO;
}

- (BOOL)setDictionary:(NSDictionary *const)candidate forKey:(id<NSCopying> const)aKey withError:(NSError **const)errorPtr
{
    if (aKey && [candidate isKindOfClass:NSDictionary.class]) {
        self[aKey] = candidate;
        return YES;
    } else if (errorPtr) {
        *errorPtr = [self.class mr_validationErrorWithKey:aKey
                                              JSONPattern:@{ }
                                                   object:nil
                                                    value:candidate];
    }
    return NO;
}

@end

#endif
