// MRErrorFormatter+CoreLocation.m
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

#import "MRErrorFormatter+CoreLocation.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_CORE_LOCATION

@implementation MRErrorFormatter (ErrorKit_CoreLocation)

+ (NSString *)debugStringWithCoreLocationCode:(NSInteger const)code
{
    switch (code) {
        case kCLErrorLocationUnknown:
            return mr_stringize_error_code(kCLErrorLocationUnknown);
        case kCLErrorDenied:
            return mr_stringize_error_code(kCLErrorDenied);
        case kCLErrorNetwork:
            return mr_stringize_error_code(kCLErrorNetwork);
        case kCLErrorHeadingFailure:
            return mr_stringize_error_code(kCLErrorHeadingFailure);
        case kCLErrorRegionMonitoringDenied:
            return mr_stringize_error_code(kCLErrorRegionMonitoringDenied);
        case kCLErrorRegionMonitoringFailure:
            return mr_stringize_error_code(kCLErrorRegionMonitoringFailure);
        case kCLErrorRegionMonitoringSetupDelayed:
            return mr_stringize_error_code(kCLErrorRegionMonitoringSetupDelayed);
        case kCLErrorRegionMonitoringResponseDelayed:
            return mr_stringize_error_code(kCLErrorRegionMonitoringResponseDelayed);
        case kCLErrorGeocodeFoundNoResult:
            return mr_stringize_error_code(kCLErrorGeocodeFoundNoResult);
        case kCLErrorGeocodeFoundPartialResult:
            return mr_stringize_error_code(kCLErrorGeocodeFoundPartialResult);
        case kCLErrorGeocodeCanceled:
            return mr_stringize_error_code(kCLErrorGeocodeCanceled);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case kCLErrorDeferredFailed:
            return mr_stringize_error_code(kCLErrorDeferredFailed);
        case kCLErrorDeferredNotUpdatingLocation:
            return mr_stringize_error_code(kCLErrorDeferredNotUpdatingLocation);
        case kCLErrorDeferredAccuracyTooLow:
            return mr_stringize_error_code(kCLErrorDeferredAccuracyTooLow);
        case kCLErrorDeferredDistanceFiltered:
            return mr_stringize_error_code(kCLErrorDeferredDistanceFiltered);
        case kCLErrorDeferredCanceled:
            return mr_stringize_error_code(kCLErrorDeferredCanceled);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithCoreLocationCode:(NSInteger const)code
{
    switch (code) {
        case kCLErrorLocationUnknown:
            return MRErrorKitString(@"Location Unknown", nil);
        case kCLErrorDenied:
            return MRErrorKitString(@"Denied", nil);
        case kCLErrorNetwork:
            return MRErrorKitString(@"Network Error", nil);
        case kCLErrorHeadingFailure:
            return MRErrorKitString(@"Heading Failure", nil);
        case kCLErrorRegionMonitoringDenied:
            return MRErrorKitString(@"Region Monitoring Denied", nil);
        case kCLErrorRegionMonitoringFailure:
            return MRErrorKitString(@"Region Monitoring Failure", nil);
        case kCLErrorRegionMonitoringSetupDelayed:
            return MRErrorKitString(@"Region Monitoring Setup Delayed", nil);
        case kCLErrorRegionMonitoringResponseDelayed:
            return MRErrorKitString(@"Region Monitoring Response Delayed", nil);
        case kCLErrorGeocodeFoundNoResult:
            return MRErrorKitString(@"Geocode Found No Result", nil);
        case kCLErrorGeocodeFoundPartialResult:
            return MRErrorKitString(@"Geocode Found Partial Result", nil);
        case kCLErrorGeocodeCanceled:
            return MRErrorKitString(@"Geocode Canceled", nil);
#if (TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case kCLErrorDeferredFailed:
            return MRErrorKitString(@"Deferred Update Failed", nil);
        case kCLErrorDeferredNotUpdatingLocation:
            return MRErrorKitString(@"Deferred Not Updating Location", nil);
        case kCLErrorDeferredAccuracyTooLow:
            return MRErrorKitString(@"Deferred Accuracy Too Low", nil);
        case kCLErrorDeferredDistanceFiltered:
            return MRErrorKitString(@"Cannot Filter Deferred Distance", nil);
        case kCLErrorDeferredCanceled:
            return MRErrorKitString(@"Deferred Update Canceled", nil);
#endif
    }
    return MRErrorKitString(@"Location Error", nil);
}

@end

#endif
