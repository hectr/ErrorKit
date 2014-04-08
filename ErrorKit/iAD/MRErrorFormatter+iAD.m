// MRErrorFormatter+iAD.m
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

#import "MRErrorFormatter+iAD.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_IAD

@implementation MRErrorFormatter (ErrorKit_iAD)

+ (NSString *)debugStringWithIADCode:(NSInteger const)code
{
    switch (code) {
        case ADErrorUnknown:
            return mr_stringize_error_code(ADErrorUnknown);
        case ADErrorServerFailure:
            return mr_stringize_error_code(ADErrorServerFailure);
        case ADErrorLoadingThrottled:
            return mr_stringize_error_code(ADErrorLoadingThrottled);
        case ADErrorInventoryUnavailable:
            return mr_stringize_error_code(ADErrorInventoryUnavailable);
        case ADErrorConfigurationError:
            return mr_stringize_error_code(ADErrorConfigurationError);
        case ADErrorBannerVisibleWithoutContent:
            return mr_stringize_error_code(ADErrorBannerVisibleWithoutContent);
        case ADErrorApplicationInactive:
            return mr_stringize_error_code(ADErrorApplicationInactive);
#if __IPHONE_6_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
        case ADErrorAdUnloaded:
            return mr_stringize_error_code(ADErrorAdUnloaded);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithIADCode:(NSInteger const)code
{
    switch (code) {
        case ADErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case ADErrorServerFailure:
            return MRErrorKitString(@"Server Failure", nil);
        case ADErrorLoadingThrottled:
            return MRErrorKitString(@"Loading Throttled", nil);
        case ADErrorInventoryUnavailable:
            return MRErrorKitString(@"Inventory Unavailable", nil);
        case ADErrorConfigurationError:
            return MRErrorKitString(@"Configuration Error", nil);
        case ADErrorBannerVisibleWithoutContent:
            return MRErrorKitString(@"Banner Visible Without Content", nil);
        case ADErrorApplicationInactive:
            return MRErrorKitString(@"Application Inactive Error", nil);
#if __IPHONE_6_0 <= __IPHONE_OS_VERSION_MAX_ALLOWED
        case ADErrorAdUnloaded:
            return MRErrorKitString(@"Ad Unloaded Error", nil);
#endif
    }
    return MRErrorKitString(@"iAd Error", nil);
}

@end

#endif
