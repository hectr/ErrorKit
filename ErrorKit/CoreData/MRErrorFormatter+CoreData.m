// MRErrorFormatter+CoreData.m
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

#import "MRErrorFormatter+CoreData.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_CORE_DATA

@implementation MRErrorFormatter (ErrorKit_CoreData)

+ (NSString *)stringWithValidationError:(NSError *const)error
{
    switch (error.code) {
        case NSManagedObjectValidationError:
            return MRErrorKitString(@"Generic validation error.", nil);
        case NSValidationMultipleErrorsError:
            return [NSString stringWithFormat:MRErrorKitString(@"There were %@ validation errors.", nil), @(error.detailedErrors.count)];
        case NSValidationMissingMandatoryPropertyError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' mustn't be empty.", nil), error.validationKey];
        case NSValidationRelationshipLacksMinimumCountError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' doesn't have enough entries.", nil), error.validationKey];
        case NSValidationRelationshipExceedsMaximumCountError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' has too many entries.", nil), error.validationKey];
        case NSValidationRelationshipDeniedDeleteError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is not empty.", nil), error.validationKey];
        case NSValidationNumberTooLargeError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is too large.", nil), error.validationKey];
        case NSValidationNumberTooSmallError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is too small.", nil), error.validationKey];
        case NSValidationDateTooLateError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is too late.", nil), error.validationKey];
        case NSValidationDateTooSoonError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is too soon.", nil), error.validationKey];
        case NSValidationInvalidDateError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is invalid.", nil), error.validationKey];
        case NSValidationStringTooLongError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is too long.", nil), error.validationKey];
        case NSValidationStringTooShortError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' is too short.", nil), error.validationKey];
        case NSValidationStringPatternMatchingError:
            return [NSString stringWithFormat:MRErrorKitString(@"'%@' doesn't match the required pattern.", nil), error.validationKey];
        default:
            return nil;
    }
}

@end

#endif
