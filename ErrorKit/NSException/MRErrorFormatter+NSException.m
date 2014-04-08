// MRErrorFormatter+NSException.m
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

#import "MRErrorFormatter+NSException.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_NSEXCEPTION

@implementation MRErrorFormatter (NSError_NSException)

+ (NSString *)stringWithExceptionName:(NSString *const)name
{
    static NSDictionary *__localizedDescriptions;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __localizedDescriptions =
        @{ NSInvalidArchiveOperationException   : MRErrorKitString(@"Error creating archive", nil)
           , NSInvalidUnarchiveOperationException : MRErrorKitString(@"Error extracting archive", nil)
           , NSGenericException                   : MRErrorKitString(@"Exception caught", nil)
           , NSRangeException                     : MRErrorKitString(@"Attempted access outside data bounds", nil)
           , NSInvalidArgumentException           : MRErrorKitString(@"Invalid argument", nil)
           , NSInternalInconsistencyException     : MRErrorKitString(@"Unexpected condition", nil)
           , NSMallocException                    : MRErrorKitString(@"Malloc exception", nil)
           , NSObjectInaccessibleException        : MRErrorKitString(@"Invalid access to remote object", nil)
           , NSObjectNotAvailableException        : MRErrorKitString(@"Remote side refused to send message", nil)
           , NSDestinationInvalidException        : MRErrorKitString(@"Unexpected condition within distributed object", nil)
           , NSPortTimeoutException               : MRErrorKitString(@"Timeout expired", nil)
           , NSInvalidSendPortException           : MRErrorKitString(@"Send port became invalid", nil)
           , NSInvalidReceivePortException        : MRErrorKitString(@"Receive port became invalid", nil)
           , NSPortSendException                  : MRErrorKitString(@"Port error occurred on send", nil)
           , NSPortReceiveException               : MRErrorKitString(@"Port error occurred on receive", nil)
           , NSOldStyleException                  : MRErrorKitString(@"Exception caught", nil)
#ifdef ERROR_KIT_FACEBOOK_SDK
           , FBInvalidOperationException          : MRErrorKitString(@"Invalid operation", nil)
#endif
#ifdef ERROR_KIT_TRANSITION_KIT
           , TKStateMachineIsImmutableException   : MRErrorKitString(@"Invalid operation", nil)
#endif
           };
    });
    return (__localizedDescriptions[name] ?: MRErrorKitString(@"Exception caught", nil));
}

@end

#endif
