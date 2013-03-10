// NSError+ErrorKit.m
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

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation NSError (ErrorKit)

- (NSString *)debugDescription
{
    return [self.userInfo objectForKey:@"NSDebugDescription"];
}

- (NSURL *)failingURL
{
    return [self.userInfo objectForKey:NSURLErrorFailingURLErrorKey];
}

- (SecTrustRef)failingURLPeerTrust
{
    return (__bridge SecTrustRef)([self.userInfo objectForKey:NSURLErrorFailingURLPeerTrustErrorKey]);
}

- (NSString *)failingURLString
{
    return [self.userInfo objectForKey:NSURLErrorFailingURLStringErrorKey];
}

- (NSString *)filePathError
{
    return [self.userInfo objectForKey:NSFilePathErrorKey];
}

- (NSStringEncoding)stringEncodingError
{
    return [(NSNumber *)[self.userInfo objectForKey:NSStringEncodingErrorKey] unsignedIntegerValue];
}

- (NSError *)underlyingError
{
    return [self.userInfo objectForKey:NSUnderlyingErrorKey];
}

- (NSException *)underlyingException
{
    return [self.userInfo objectForKey:@"NSUnderlyingException"];
}

- (NSURL *)urlError
{
    return [self.userInfo objectForKey:NSURLErrorKey];
}

#pragma mark -

#ifdef _COREDATADEFINES_H

- (NSArray *)affectedObjects
{
    return [self.userInfo objectForKey:NSAffectedObjectsErrorKey];
}

- (NSArray *)affectedStores
{
    return [self.userInfo objectForKey:NSAffectedStoresErrorKey];
}

- (NSArray *)detailedErrors
{
    return [self.userInfo objectForKey:NSDetailedErrorsKey];
}

- (NSArray *)persistentStoreSaveConflicts
{
    return [self.userInfo objectForKey:NSPersistentStoreSaveConflictsErrorKey];
}

- (NSString *)validationKey
{
    return [self.userInfo objectForKey:NSValidationKeyErrorKey];
}

- (NSManagedObject *)validationObject
{
    return [self.userInfo objectForKey:NSValidationObjectErrorKey];
}

- (NSPredicate *)validationPredicate
{
    return [self.userInfo objectForKey:NSValidationPredicateErrorKey];
}

- (id)validationValue
{
    return [self.userInfo objectForKey:NSValidationValueErrorKey];
}

#endif

#pragma mark -

#ifdef __CORELOCATION__

- (CLRegion *)alternateRegion
{
    return [self.userInfo objectForKey:kCLErrorUserInfoAlternateRegionKey];
}

#endif

#pragma mark -

#ifdef _AFNETWORKING_

- (NSURLRequest *)failingURLRequest
{
    return [self.userInfo objectForKey:AFNetworkingOperationFailingURLRequestErrorKey];
}

- (NSHTTPURLResponse *)failingURLResponse
{
    return [self.userInfo objectForKey:AFNetworkingOperationFailingURLResponseErrorKey];
}

#endif

@end
