// MRErrorFormatter.m
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

#import "MRErrorFormatter.h"
#import "MRErrorFormatter+ErrorCode.h"
#ifdef ACCOUNTS_EXTERN
#import "MRErrorFormatter_Accounts.h"
#endif
#if defined(GAD_SIMULATOR_ID) || defined(GAD_SIZE_320x50)
#import "MRErrorFormatter_Admob.h"
#endif
#ifdef __CORELOCATION__
#import "MRErrorFormatter_CoreLocation.h"
#endif
#ifdef FB_SESSIONSTATETERMINALBIT
#import "MRErrorFormatter_FacebookSDK.h"
#endif
#ifdef ERROR_KIT_IAD
#import "MRErrorFormatter_iAD.h"
#endif
#import "MRErrorFormatter_JSONKit.h"
#ifdef MK_EXTERN
#import "MRErrorFormatter_MapKit.h"
#endif
#ifdef ERROR_KIT_MESSAGE_UI
#import "MRErrorFormatter_MessageUI.h"
#endif
#ifdef SK_EXTERN
#import "MRErrorFormatter_StoreKit.h"
#endif
#ifdef TransitionKit_TransitionKit_h
#import "MRErrorFormatter_TransitionKit.h"
#endif

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation MRErrorFormatter

- (NSString *)debugStringFromError:(NSError *)error
{
    if (self.shortenStrings) {
        return [NSString stringWithFormat:@"<NSError: %p Domain=%@ Code=%d UserInfo=%p>"
                                          , error
                                          , error.domain
                                          , error.code
                                          , error.userInfo];
    }
    return error.description;
}

- (NSString *)stringWithErrorDetail:(NSDictionary *)userInfo
{
    NSMutableArray *components = [NSMutableArray array];
    [userInfo enumerateKeysAndObjectsUsingBlock:^(NSString *key, id object, BOOL *stop) {
        if ([key isEqualToString:NSLocalizedDescriptionKey]) {
            if (!self.shortenStrings) {
                [components insertObject:[NSString stringWithFormat:@"%@=%@", key, object] atIndex:0];
            }
        } else if ([object isKindOfClass:NSError.class]) {
            [components addObject:[NSString stringWithFormat:@"%@=%@", key, [self debugStringFromError:object]]];
        } else {
            [components addObject:[NSString stringWithFormat:@"%@=%@", key, object]];
        }
    }];
    return [components componentsJoinedByString:@", "];
}

+ (NSString *)stringFromError:(NSError *)error
{
    NSMutableArray *stringComponents = [NSMutableArray arrayWithCapacity:3];
    if (error.localizedDescription) {
        [stringComponents addObject:error.localizedDescription];
    }
    if (error.localizedFailureReason) {
        [stringComponents addObject:error.localizedFailureReason];
    }
    if (error.recoveryAttempter && error.localizedRecoverySuggestion) {
        [stringComponents addObject:error.localizedRecoverySuggestion];
    }
    return [stringComponents componentsJoinedByString:@"\n"];
}

+ (NSString *)stringForTitleFromError:(NSError *)error;
{
    if (error.localizedDescription) {
        return error.localizedDescription;
    }
#ifdef _AFNETWORKING_
    if ([error.domain isEqualToString:AFNetworkingErrorDomain]) {
        if (error.failingURLResponse) {
            NSInteger code = error.failingURLResponse.statusCode;
            return [NSHTTPURLResponse localizedStringForStatusCode:code];
        }
    }
#endif
    return [self stringWithDomain:error.domain code:error.code];
}

+ (NSString *)stringForMessageFromError:(NSError *)error
{
    NSMutableArray *stringComponents = [NSMutableArray arrayWithCapacity:3];
#ifdef _AFNETWORKING_
    if ([error.domain isEqualToString:AFNetworkingErrorDomain]) {
        if (error.failingURLResponse && error.localizedDescription) {
            [stringComponents addObject:error.localizedDescription];
        }
    }
#endif
    if (error.localizedFailureReason) {
        [stringComponents addObject:error.localizedFailureReason];
    }
    if (error.recoveryAttempter && error.localizedRecoverySuggestion) {
        [stringComponents addObject:error.localizedRecoverySuggestion];
    }
    return [stringComponents componentsJoinedByString:@"\n"];
}

+ (NSString *)stringForCancelButtonFromError:(NSError *)error
{
    if (error.recoveryAttempter) {
        return NSLocalizedString(@"Cancel", nil);
    } else {
        return NSLocalizedString(@"OK", nil);
    }
}

+ (NSString *)debugStringWithDomain:(NSString *)domain code:(NSInteger)code
{
    if ([domain isEqualToString:NSCocoaErrorDomain]) {
        return [MRErrorFormatter debugStringWithCocoaCode:code];
    } else if ([domain isEqualToString:NSURLErrorDomain]) {
        return [MRErrorFormatter debugStringWithURLCode:code];
    } else if ([domain isEqualToString:NSXMLParserErrorDomain]) {
        return [MRErrorFormatter debugStringWithXMLParserCode:code];
    }
#ifdef ACCOUNTS_EXTERN
    else if ([domain isEqualToString:ACErrorDomain]) {
        return [MRErrorFormatter debugStringWithAccountsCode:code];
    }
#endif
#if defined(GAD_SIMULATOR_ID) || defined(GAD_SIZE_320x50)
    else if ([domain isEqualToString:kGADErrorDomain]) {
        return [MRErrorFormatter debugStringWithAdmobCode:code];
    }
#endif
#ifdef _AFNETWORKING_
    else if ([domain isEqualToString:AFNetworkingErrorDomain]) {
        return [MRErrorFormatter debugStringWithURLCode:code];
    }
#endif
#ifdef __CORELOCATION__
    else if ([domain isEqualToString:kCLErrorDomain]) {
        return [MRErrorFormatter debugStringWithCoreLocationCode:code];
    }
#endif
#ifdef FB_SESSIONSTATETERMINALBIT
    else if ([domain isEqualToString:FacebookSDKDomain]) {
        return [MRErrorFormatter debugStringWithFacebookCode:code];
    }
#endif
#ifdef ERROR_KIT_IAD
    else if ([domain isEqualToString:ADErrorDomain]) {
        return [MRErrorFormatter debugStringWithIADCode:code];
    }
#endif
    else if ([domain isEqualToString:@"JKErrorDomain"]) {
        return [MRErrorFormatter debugStringWithJSONKitCode:code];
    }
#ifdef MK_EXTERN
    else if ([domain isEqualToString:MKErrorDomain]) {
        return [MRErrorFormatter debugStringWithMapKitCode:code];
    }
#endif
#ifdef ERROR_KIT_MESSAGE_UI
    else if ([domain isEqualToString:MFMailComposeErrorDomain]) {
        return [MRErrorFormatter debugStringWithMailComposeCode:code];
    }
#endif
#ifdef SK_EXTERN
    else if ([domain isEqualToString:SKErrorDomain]) {
        return [MRErrorFormatter debugStringWithStoreKitCode:code];
    }
#endif
#ifdef TransitionKit_TransitionKit_h
    else if ([domain isEqualToString:TKErrorDomain]) {
        return [MRErrorFormatter debugStringWithTransitionKitCode:code];
    }
#endif
    return @(code).stringValue;
}

+ (NSString *)stringWithDomain:(NSString *)domain code:(NSInteger)code
{
    if ([domain isEqualToString:NSCocoaErrorDomain]) {
        return [MRErrorFormatter stringWithCocoaCode:code];
    } else if ([domain isEqualToString:NSURLErrorDomain]) {
        return [MRErrorFormatter stringWithURLCode:code];
    } else if ([domain isEqualToString:NSXMLParserErrorDomain]) {
        return [MRErrorFormatter stringWithXMLParserCode:code];
    }
#ifdef ACCOUNTS_EXTERN
    else if ([domain isEqualToString:ACErrorDomain]) {
        return [MRErrorFormatter stringWithAccountsCode:code];
    }
#endif
#if defined(GAD_SIMULATOR_ID) || defined(GAD_SIZE_320x50)
    else if ([domain isEqualToString:kGADErrorDomain]) {
        return [MRErrorFormatter stringWithAdmobCode:code];
    }
#endif
#ifdef _AFNETWORKING_
    else if ([domain isEqualToString:AFNetworkingErrorDomain]) {
        return [MRErrorFormatter stringWithURLCode:code];
    }
#endif
#ifdef __CORELOCATION__
    else if ([domain isEqualToString:kCLErrorDomain]) {
        return [MRErrorFormatter stringWithCoreLocationCode:code];
    }
#endif
#ifdef FB_SESSIONSTATETERMINALBIT
    else if ([domain isEqualToString:FacebookSDKDomain]) {
        return [MRErrorFormatter stringWithFacebookCode:code];
    }
#endif
#ifdef ERROR_KIT_IAD
    else if ([domain isEqualToString:ADErrorDomain]) {
        return [MRErrorFormatter stringWithIADCode:code];
    }
#endif
    else if ([domain isEqualToString:@"JKErrorDomain"]) {
        return [MRErrorFormatter stringWithJSONKitCode:code];
    }
#ifdef MK_EXTERN
    else if ([domain isEqualToString:MKErrorDomain]) {
        return [MRErrorFormatter stringWithMapKitCode:code];
    }
#endif
#ifdef ERROR_KIT_MESSAGE_UI
    else if ([domain isEqualToString:MFMailComposeErrorDomain]) {
        return [MRErrorFormatter stringWithMailComposeCode:code];
    }
#endif
#ifdef SK_EXTERN
    else if ([domain isEqualToString:SKErrorDomain]) {
        return [MRErrorFormatter stringWithStoreKitCode:code];
    }
#endif
#ifdef TransitionKit_TransitionKit_h
    else if ([domain isEqualToString:TKErrorDomain]) {
        return [MRErrorFormatter stringWithTransitionKitCode:code];
    }
#endif
    return nil;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    MRErrorFormatter *formatter = [[[self class] allocWithZone:zone] init];
    formatter.shortenStrings = self.shortenStrings;
    return formatter;
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeBool:self.shortenStrings forKey:@"shortenStrings"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [self init];
    self.shortenStrings = [aDecoder decodeBoolForKey:@"shortenStrings"];
    return self;
}

#pragma mark - NSObject

- (NSString *)description
{
    if (self.shortenStrings) {
        return [NSString stringWithFormat:@"<%@: %p shortenStrings=1>"
                                          , NSStringFromClass(self.class)
                                          , self];
    }
    return [super description];
}

@end
