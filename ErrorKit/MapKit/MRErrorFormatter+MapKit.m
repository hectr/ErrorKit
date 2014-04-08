// MRErrorFormatter+MapKit.m
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

#import "MRErrorFormatter+MapKit.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_MAP_KIT

@implementation MRErrorFormatter (ErrorKit_MapKit)

+ (NSString *)debugStringWithMapKitCode:(NSInteger const)code
{
    switch (code) {
        case MKErrorUnknown:
            return mr_stringize_error_code(MKErrorUnknown);
        case MKErrorServerFailure:
            return mr_stringize_error_code(MKErrorServerFailure);
        case MKErrorLoadingThrottled:
            return mr_stringize_error_code(MKErrorLoadingThrottled);
        case MKErrorPlacemarkNotFound:
            return mr_stringize_error_code(MKErrorPlacemarkNotFound);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithMapKitCode:(NSInteger const)code
{
    switch (code) {
        case MKErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case MKErrorServerFailure:
            return MRErrorKitString(@"Server Error", nil);
        case MKErrorLoadingThrottled:
            return MRErrorKitString(@"Loading Throttled", nil);
        case MKErrorPlacemarkNotFound:
            return MRErrorKitString(@"Placemark Not Found", nil);
    }
    return MRErrorKitString(@"Map Error", nil);
}

@end

#endif
