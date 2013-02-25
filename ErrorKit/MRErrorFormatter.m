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

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


@implementation MRErrorFormatter

+ (NSString *)stringFromErrorDetail:(NSDictionary *)userInfo
{
    NSMutableArray *components = [NSMutableArray array];
    [userInfo enumerateKeysAndObjectsUsingBlock:^(NSString *key, id object, BOOL *stop) {
        if ([key isEqualToString:NSLocalizedDescriptionKey]) {
            [components insertObject:[NSString stringWithFormat:@"%@=%@", key, object] atIndex:0];
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
    return NSLocalizedString(@"Error", nil);
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

@end
