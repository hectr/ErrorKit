// MRErrorFormatter+StoreKit.m
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

#import "MRErrorFormatter+StoreKit.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_STORE_KIT

@implementation MRErrorFormatter (ErrorKit_StoreKit)

+ (NSString *)debugStringWithStoreKitCode:(NSInteger const)code
{
    switch (code) {
        case SKErrorUnknown:
            return mr_stringize_error_code(SKErrorUnknown);
        case SKErrorClientInvalid:
            return mr_stringize_error_code(SKErrorClientInvalid);
        case SKErrorPaymentCancelled:
            return mr_stringize_error_code(SKErrorPaymentCancelled);
        case SKErrorPaymentInvalid:
            return mr_stringize_error_code(SKErrorPaymentInvalid);
        case SKErrorPaymentNotAllowed:
            return mr_stringize_error_code(SKErrorPaymentNotAllowed);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case SKErrorStoreProductNotAvailable:
            return mr_stringize_error_code(SKErrorStoreProductNotAvailable);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithStoreKitCode:(NSInteger const)code
{
    switch (code) {
        case SKErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case SKErrorClientInvalid:
            return MRErrorKitString(@"Invalid Client", nil);
        case SKErrorPaymentCancelled:
            return MRErrorKitString(@"Payment Cancelled", nil);
        case SKErrorPaymentInvalid:
            return MRErrorKitString(@"Invalid Payment", nil);
        case SKErrorPaymentNotAllowed:
            return MRErrorKitString(@"Payment Not Allowed", nil);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case SKErrorStoreProductNotAvailable:
            return MRErrorKitString(@"Product Not Available", nil);
#endif
    }
    return MRErrorKitString(@"Store Error", nil);
}

@end

#endif
