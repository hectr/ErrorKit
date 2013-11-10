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
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation NSError (ErrorKit)

- (NSString *)debugDescriptionValue
{
    return self.userInfo[@"NSDebugDescription"];
}

- (NSURL *)failingURL
{
    return self.userInfo[NSURLErrorFailingURLErrorKey];
}

- (SecTrustRef)failingURLPeerTrust
{
    return (__bridge SecTrustRef)(self.userInfo[NSURLErrorFailingURLPeerTrustErrorKey]);
}

- (NSString *)failingURLString
{
    return self.userInfo[NSURLErrorFailingURLStringErrorKey];
}

- (NSString *)filePathError
{
    return self.userInfo[NSFilePathErrorKey];
}

- (NSString *)stackTrace
{
    return self.userInfo[@"NSStackTraceKey"];
}

- (NSStringEncoding)stringEncodingError
{
    return [(NSNumber *)self.userInfo[NSStringEncodingErrorKey] unsignedIntegerValue];
}

- (NSError *)underlyingError
{
    return self.userInfo[NSUnderlyingErrorKey];
}

- (NSException *)underlyingException
{
    return self.userInfo[@"NSUnderlyingException"];
}

- (NSURL *)urlError
{
    return self.userInfo[NSURLErrorKey];
}

@end


#pragma mark -
#pragma mark -


@implementation NSError (ErrorKit_Helper)

- (NSString *)debugString
{
    return [MRErrorFormatter debugStringWithDomain:self.domain code:self.code];
}

- (BOOL)isCancelledError
{
#ifdef ERROR_KIT_AFNETWORKING
    if ([self.domain isEqualToString:AFNetworkingErrorDomain]) {
        return (self.code == NSURLErrorUserCancelledAuthentication ||
                self.code == NSURLErrorCancelled);
    }
#endif
#ifdef ERROR_KIT_CORE_LOCATION
    if ([self.domain isEqualToString:kCLErrorDomain]) {
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        return (self.code == kCLErrorGeocodeCanceled);
#else
        return (self.code == kCLErrorGeocodeCanceled ||
                self.code == kCLErrorDeferredCanceled);
#endif
    }
#endif
#ifdef ERROR_KIT_FACEBOOK_SDK
    if ([self.domain isEqualToString:FacebookSDKDomain]) {
        return (self.code == FBErrorOperationCancelled);
    }
#endif
#ifdef ERROR_KIT_STORE_KIT
    if ([self.domain isEqualToString:SKErrorDomain]) {
        return (self.code == SKErrorPaymentCancelled);
    }
#endif
    if ([self.domain isEqualToString:NSURLErrorDomain]) {
        return (self.code == NSURLErrorUserCancelledAuthentication ||
                self.code == NSURLErrorCancelled);
    }
#ifdef ERROR_KIT_CORE_DATA
    return ((self.code == NSUserCancelledError || self.code == NSMigrationCancelledError) &&
            [self.domain isEqualToString:NSCocoaErrorDomain]);
#else
    return (self.code == NSUserCancelledError &&
            [self.domain isEqualToString:NSCocoaErrorDomain]);
#endif
}

- (BOOL)isValidationError
{
    return (self.code >= NSValidationErrorMinimum &&
            self.code <= NSValidationErrorMaximum &&
            [self.domain isEqualToString:NSCocoaErrorDomain]);
}

@end
