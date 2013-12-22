// NSMutableDictionary+JSONValues.h
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
 Adds methods for safely inserting and removing objects from an dictionary.
 */
@interface NSMutableDictionary (ErrorKit_JSONValues)

/**
 If `aNumber` is an `NSNumber`, the given key-value pair is added to the
 dictionary.
 
 If `aKey` and/or `aNumber` are nil, no `NSInvalidArgumentException` is raised,
 but `errorPtr` will contain an `NSError` object.
 
 @param aNumber The value for aKey. `aNumber` may be nil, but then the key-value
 pair is not added to the dictionary.
 @param aKey The key for value. `aKey` may be nil nil, but then the key-value
 pair is not added to the dictionary.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the key-value pair was added, NO otherwise.
 */
- (BOOL)setNumber:(NSNumber *)aNumber forKey:(id<NSCopying>)aKey withError:(NSError **)errorPtr;

/**
 If `aString` is an `NSString`, the given key-value pair is added to the
 dictionary.
 
 If `aKey` and/or `aString` are nil, no `NSInvalidArgumentException` is raised,
 but `errorPtr` will contain an `NSError` object.
 
 @param aString The value for aKey. `aString` may be nil, but then the key-value
 pair is not added to the dictionary.
 @param aKey The key for value. `aKey` may be nil nil, but then the key-value
 pair is not added to the dictionary.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the key-value pair was added, NO otherwise.
 */
- (BOOL)setString:(NSString *)aString forKey:(id<NSCopying>)aKey withError:(NSError **)errorPtr;

/**
 If `anArray` is an `NSArray`, the given key-value pair is added to the
 dictionary.
 
 If `aKey` and/or `anArray` are nil, no `NSInvalidArgumentException` is raised,
 but `errorPtr` will contain an `NSError` object.
 
 @param anArray The value for aKey. `anArray` may be nil, but then the key-value
 pair is not added to the dictionary.
 @param aKey The key for value. `aKey` may be nil nil, but then the key-value
 pair is not added to the dictionary.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the key-value pair was added, NO otherwise.
 */
- (BOOL)setArray:(NSArray *)anArray forKey:(id<NSCopying>)aKey withError:(NSError **)errorPtr;

/**
 If `aDictionary` is an `NSDictionary`, the given key-value pair is added to the
 dictionary.
 
 If `aKey` and/or `aDictionary` are nil, no `NSInvalidArgumentException` is
 raised, but `errorPtr` will contain an `NSError` object.
 
 @param aDictionary The value for aKey. `aDictionary` may be nil, but then the
 key-value pair is not added to the dictionary.
 @param aKey The key for value. `aKey` may be nil nil, but then the key-value
 pair is not added to the dictionary.
 @param errorPtr A pointer to an `NSError` object or NULL. You do not need to
 create an `NSError` object.
 
 @return YES if the key-value pair was added, NO otherwise.
 */
- (BOOL)setDictionary:(NSDictionary *)aDictionary forKey:(id<NSCopying>)aKey withError:(NSError **)errorPtr;

@end
