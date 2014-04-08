// NSMutableArray+JSONValues.m
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

#import "NSMutableArray+JSONValues.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_JSON_VALUES

@interface NSArray ()

+ (NSError *)mr_rangeErrorWithIndex:(NSUInteger)index object:(id)object;

@end


@implementation NSMutableArray (ErrorKit_JSONValues)

+ (NSError *)mr_argumentErrorWithObject:(id const)object value:(id const)value
{
    MRErrorBuilder *const builder =
    [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain
                                 code:NSKeyValueValidationError];
    builder.localizedFailureReason =
    [MRErrorFormatter stringWithExceptionName:NSInvalidArgumentException];
#ifdef ERROR_KIT_CORE_DATA
    builder.validationKey = @"object";
    builder.validationValue = value;
    builder.validationObject = object;
#endif
    return builder.error;
}

- (BOOL)addObject:(id const)anObject withError:(NSError **const)errorPtr
{
    if (anObject == nil) {
        
    } else {
        [self addObject:anObject];
        return YES;
    }
    return NO;
}

- (BOOL)insertObject:(id)anObject atIndex:(NSUInteger const)index withError:(NSError **const)errorPtr
{
    if (index > self.count) {
        if (errorPtr) {
            *errorPtr = [self.class mr_rangeErrorWithIndex:index object:self];
        }
    } else if (anObject == nil) {
        if (errorPtr) {
            *errorPtr = [self.class mr_argumentErrorWithObject:nil value:nil];
        }
    } else {
        [self insertObject:anObject atIndex:index];
        return YES;
    }
    return NO;
}

- (BOOL)removeLastObjectWithError:(NSError **const)errorPtr
{
    if (self.count == 0) {
        if (errorPtr) {
            *errorPtr = [self.class mr_rangeErrorWithIndex:0 object:self];
        }
    } else {
        [self removeLastObject];
        return YES;
    }
    return NO;
}

- (BOOL)removeObjectAtIndex:(NSUInteger const)index withError:(NSError ** const)errorPtr
{
    NSUInteger const count = self.count;
    if (count == 0 || index > (count - 1)) {
        if (errorPtr) {
            *errorPtr = [self.class mr_rangeErrorWithIndex:index object:self];
        }
    } else {
        [self removeObjectAtIndex:index];
        return YES;
    }
    return NO;
}

- (BOOL)replaceObjectAtIndex:(NSUInteger const)index withObject:(id const)anObject error:(NSError **const)errorPtr
{
    NSUInteger const count = self.count;
    if (count == 0 || index > (count - 1)) {
        if (errorPtr) {
            *errorPtr = [self.class mr_rangeErrorWithIndex:index object:self];
        }
    } else if (anObject == nil) {
        if (errorPtr) {
            *errorPtr = [self.class mr_argumentErrorWithObject:nil value:nil];
        }
    } else {
        [self replaceObjectAtIndex:index withObject:anObject];
        return YES;
    }
    return NO;
}

@end

#endif
