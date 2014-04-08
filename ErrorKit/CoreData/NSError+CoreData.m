// NSError+CoreData.m
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

#import "NSError+CoreData.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_CORE_DATA

@implementation NSError (ErrorKit_CoreData)

- (NSArray *)affectedObjects
{
    return self.userInfo[NSAffectedObjectsErrorKey];
}

- (NSArray *)affectedStores
{
    return self.userInfo[NSAffectedStoresErrorKey];
}

- (NSArray *)detailedErrors
{
    return self.userInfo[NSDetailedErrorsKey];
}

- (NSArray *)persistentStoreSaveConflicts
{
    return self.userInfo[NSPersistentStoreSaveConflictsErrorKey];
}

- (NSString *)validationKey
{
    return self.userInfo[NSValidationKeyErrorKey];
}

- (id)validationObject
{
    return self.userInfo[NSValidationObjectErrorKey];
}

- (NSPredicate *)validationPredicate
{
    return self.userInfo[NSValidationPredicateErrorKey];
}

- (id)validationValue
{
    return self.userInfo[NSValidationValueErrorKey];
}

@end


#pragma mark -
#pragma mark -


@implementation NSError (ErrorKit_CoreData_Helper)

- (NSError *)errorByCombiningWithError:(NSError *const)errorOrNil
{
    if (errorOrNil == nil) {
        return self;
    }
    MRErrorBuilder *builder;
    if (self.code == NSValidationMultipleErrorsError) {
        builder = [MRErrorBuilder builderWithError:self];
        builder.detailedErrors = ([builder.detailedErrors arrayByAddingObject:errorOrNil]
                                  ?: @[ (errorOrNil.detailedErrors ?: errorOrNil) ]);
    } else {
        builder = [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain code:NSValidationMultipleErrorsError];
        builder.detailedErrors = @[ self, (errorOrNil.detailedErrors ?: errorOrNil) ];
    }
    return builder.error;
}

@end

#endif
