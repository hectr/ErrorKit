// NSJSONSerialization+JSONValues.h
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
 Adds helper methods for converting JSON data into Foundation objects.
 */
@interface NSJSONSerialization (ErrorKit_JSONValues)

/**
 Returns JSON data from an NSArray object.
 If obj will not produce valid JSON, an exception is thrown.
 
 @param obj The array from which to generate JSON data.
 @param opt Options. See `NSJSONWritingOptions  for possible values.
 @param errorPtr If an error occurs, upon return contains an NSError object that
 describes the problem.
 
 @return JSON data for obj, or nil if an error occurs or obj was not an 
 `NSArray`.
 */
+ (NSData *)dataWithArray:(NSArray *)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)errorPtr;

/**
 Returns JSON data from an `NSDictionary` object.
 If `obj` will not produce valid JSON, an exception is thrown.
 
 @param obj The dictionary from which to generate JSON data.
 @param opt Options. See `NSJSONWritingOptions  for possible values.
 @param errorPtr If an error occurs, upon return contains an `NSError` object
 that describes the problem.
 
 @return JSON data for `obj`, or `nil` if an error occurs or `obj` was not an
 `NSDictionary`.
 */
+ (NSData *)dataWithDictionary:(NSDictionary *)obj options:(NSJSONWritingOptions)opt error:(NSError *__autoreleasing *)errorPtr;

/**
 Returns an `NSArray` object from given JSON data or `nil` if the object is not
 a dictionary or there was any other error.
 
 @param data A data object containing JSON data.
 @param opt Options. For possible values, see `NSJSONReadingOptions`.
 @param errorPtr If an error occurs, upon return contains an `NSError` object 
 that describes the problem.
 
 @return An array from given JSON data.
 */
+ (NSArray *)arrayWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)errorPtr;

/**
 Returns an `NSDictionary` object from given JSON data or `nil` if the object is
 not a dictionary or there was any other error.
 
 @param data A data object containing JSON data.
 @param opt Options. For possible values, see `NSJSONReadingOptions`.
 @param errorPtr If an error occurs, upon return contains an `NSError` object
 that describes the problem.
 
 @return A dictionary from the given JSON data.
 */
+ (NSDictionary *)dictionaryWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError *__autoreleasing *)errorPtr;

@end
