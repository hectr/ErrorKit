// MRErrorFormatter+Admob.m
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

#import "MRErrorFormatter+Admob.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_ADMOB

@implementation MRErrorFormatter (ErrorKit_Admob)

+ (NSString *)debugStringWithAdmobCode:(NSInteger const)code
{
    switch (code) {
        case kGADErrorInvalidRequest:
            return mr_stringize_error_code(kGADErrorInvalidRequest);
        case kGADErrorNoFill:
            return mr_stringize_error_code(kGADErrorNoFill);
        case kGADErrorNetworkError:
            return mr_stringize_error_code(kGADErrorNetworkError);
        case kGADErrorServerError:
            return mr_stringize_error_code(kGADErrorServerError);
        case kGADErrorOSVersionTooLow:
            return mr_stringize_error_code(kGADErrorOSVersionTooLow);
        case kGADErrorTimeout:
            return mr_stringize_error_code(kGADErrorTimeout);
        case kGADErrorInterstitialAlreadyUsed:
            return mr_stringize_error_code(kGADErrorInterstitialAlreadyUsed);
        case kGADErrorMediationDataError:
            return mr_stringize_error_code(kGADErrorMediationDataError);
        case kGADErrorMediationAdapterError:
            return mr_stringize_error_code(kGADErrorMediationAdapterError);
        case kGADErrorMediationNoFill:
            return mr_stringize_error_code(kGADErrorMediationNoFill);
        case kGADErrorMediationInvalidAdSize:
            return mr_stringize_error_code(kGADErrorMediationInvalidAdSize);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithAdmobCode:(NSInteger const)code
{
    switch (code) {
        case kGADErrorInvalidRequest:
            return MRErrorKitString(@"Invalid Request", nil);
        case kGADErrorNoFill:
        case kGADErrorMediationNoFill:
            return MRErrorKitString(@"No Ad Error", nil);
        case kGADErrorNetworkError:
            return MRErrorKitString(@"Network Error", nil);
        case kGADErrorServerError:
            return MRErrorKitString(@"Server Error", nil);
        case kGADErrorOSVersionTooLow:
            return MRErrorKitString(@"OS Version Too Low", nil);
        case kGADErrorTimeout:
            return MRErrorKitString(@"Timed Out", nil);
        case kGADErrorInterstitialAlreadyUsed:
            return MRErrorKitString(@"Interstitial Already Used", nil);
        case kGADErrorMediationDataError:
            return MRErrorKitString(@"Invalid Response", nil);
        case kGADErrorMediationAdapterError:
            return MRErrorKitString(@"Mediation Adapter Error", nil);
        case kGADErrorMediationInvalidAdSize:
            return MRErrorKitString(@"Invalid Ad Size", nil);
    }
    return MRErrorKitString(@"Admob Error", nil);
}

@end

#endif
