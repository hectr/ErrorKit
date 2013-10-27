// NSError+CoreData.h
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

#import "NSError+ErrorKit.h"


/**
 Adds getters for Core Data's error `userInfo` values.
 
 @warning This extension requires the Core Data framework. Add a 
 `CoreData/CoreData.h` import to the header prefix of the project.
 */
@interface NSError (ErrorKit_CoreData)

/// @name CoreDataErrors userInfo values

/// Getter for `NSAffectedObjectsErrorKey` user info value.
@property (nonatomic, readonly) NSArray *affectedObjects;

/// Getter for `NSAffectedStoresErrorKey` user info value.
@property (nonatomic, readonly) NSArray /* of NSPersistentStore */*affectedStores;

/// Getter for `NSDetailedErrorsKey` user info value.
@property (nonatomic, readonly) NSArray /* of NSError */*detailedErrors;

/// Getter for `NSPersistentStoreSaveConflictsErrorKey` user info value.
@property (nonatomic, readonly) NSArray /* of NSMergeConflict */*persistentStoreSaveConflicts;

/// Getter for `NSValidationKeyErrorKey` user info value.
@property (nonatomic, readonly) NSString *validationKey;

/// Getter for `NSValidationObjectErrorKey` user info value.
@property (nonatomic, readonly) id /* NSManagedObject */validationObject;

/// Getter for `NSValidationPredicateErrorKey` user info value.
@property (nonatomic, readonly) NSPredicate *validationPredicate;

/// Getter for `NSValidationValueErrorKey` user info value.
@property (nonatomic, readonly) id validationValue;

@end


/**
 Adds a method for combining validation errors.
 
 @warning This extension requires the Core Data framework. Add a `CoreData/CoreData.h` import to the header prefix of the project.
 */
@interface NSError (ErrorKit_CoreData_Helper)

/// Creates a new validation error by combining the receiver with the given error.
- (NSError *)errorByCombiningWithError:(NSError *)errorOrNil;

@end
