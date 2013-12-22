// NSMutableArray+JSONValues.h
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
 Adds methods for safely inserting and removing objects from an array.
 */
@interface NSMutableArray (ErrorKit_JSONValues)

/**
 Inserts a given object at the end of the array.
 
 If `anObject` is nil, no `NSInvalidArgumentException` is raised, but `errorPtr`
 will contain an `NSError` object.
 
 @param anObject The object to add to the end of the array's content.
 This value may be nil.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the object was inserted, NO otherwise.
 */
- (BOOL)addObject:(id)anObject withError:(NSError **)errorPtr;

/**
 Inserts a given object into the array's contents at a given index.

 If `index` is greater than the number of elements in the array, no 
 `NSRangeException` is raised, but `errorPtr` will contain an `NSError` object.
 
 If `anObject` is nil, no `NSInvalidArgumentException` is raised, but `errorPtr`
 will contain an `NSError` object.
 
 @param anObject The object to add to the array's content. This value may be
 nil, but then the object will not be inserted in the array.
 @param index The index in the array at which to insert anObject. This value may
 be greater than the count of elements in the array, but then the object will 
 not be inserted in the array.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the object was inserted, NO otherwise.
 */
- (BOOL)insertObject:(id)anObject atIndex:(NSUInteger)index withError:(NSError **)errorPtr;

/**
 Removes the object with the highest-valued index in the array.
 
 If there are no objects in the array, no `NSRangeException` is raised,
 but `errorPtr` will contain an `NSError` object.
 
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the object was removed, NO otherwise.
*/
- (BOOL)removeLastObjectWithError:(NSError **)errorPtr;

/**
 Removes the object at `index`.
 
 If index is beyond the end of the array, no `NSRangeException` is raised, but
 `errorPtr` will contain an `NSError` object.
 
 @param index The index from which to remove the object in the array. The value
 may exceed the bounds of the array, but then the object will not be removed 
 from the array.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the object was removed, NO otherwise.
 */
- (BOOL)removeObjectAtIndex:(NSUInteger)index withError:(NSError **)errorPtr;

/**
 Replaces the object at `index` with `anObject`.
 
 If `index` is greater than the number of elements in the array, no
 `NSRangeException` is raised, but `errorPtr` will contain an `NSError` object.
 
 If `anObject` is nil, no `NSInvalidArgumentException` is raised, but `errorPtr`
 will contain an `NSError` object.

 @param index The index of the object to be replaced. This value may exceed the
 bounds of the array, but then the object will not be replaced.
 @param anObject The object with which to replace the object at index index in
 the array. This value may be nil, but then the object will not be replaced.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the object was replaced, NO otherwise.
 */
- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject error:(NSError **)errorPtr;

@end
