// MRErrorFormatter+MessageUI.m
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

#import "MRErrorFormatter+MessageUI.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_MESSAGE_UI

@implementation MRErrorFormatter (ErrorKit_MessageUI)

+ (NSString *)debugStringWithMailComposeCode:(NSInteger const)code
{
    switch (code) {
        case MFMailComposeErrorCodeSaveFailed:
            return mr_stringize_error_code(MFMailComposeErrorCodeSaveFailed);
        case MFMailComposeErrorCodeSendFailed:
            return mr_stringize_error_code(MFMailComposeErrorCodeSendFailed);
    }
    return @(code).stringValue;
}

+ (NSString *)debugStringWithMailComposeResult:(NSInteger const)code
{
    switch (code) {
        case MFMailComposeResultCancelled:
            return mr_stringize_error_code(MFMailComposeResultCancelled);
        case MFMailComposeResultSaved:
            return mr_stringize_error_code(MFMailComposeResultSaved);
        case MFMailComposeResultSent:
            return mr_stringize_error_code(MFMailComposeResultSent);
        case MFMailComposeResultFailed:
            return mr_stringize_error_code(MFMailComposeResultFailed);
    }
    return @(code).stringValue;
}

+ (NSString *)debugStringWithMessageComposeResult:(NSInteger const)code
{
    switch (code) {
        case MessageComposeResultCancelled:
            return mr_stringize_error_code(MessageComposeResultCancelled);
        case MessageComposeResultSent:
            return mr_stringize_error_code(MessageComposeResultSent);
        case MessageComposeResultFailed:
            return mr_stringize_error_code(MessageComposeResultFailed);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithMailComposeCode:(NSInteger const)code
{
    switch (code) {
        case MFMailComposeErrorCodeSaveFailed:
            return MRErrorKitString(@"Mail Save Failed", nil);
        case MFMailComposeErrorCodeSendFailed:
            return MRErrorKitString(@"Mail Send Failed", nil);
    }
    return MRErrorKitString(@"Mail Error", nil);
}

+ (NSString *)stringWithMailComposeResult:(NSInteger const)code
{
    switch (code) {
        case MFMailComposeResultCancelled:
            return MRErrorKitString(@"Mail Cancelled", nil);
        case MFMailComposeResultSaved:
            return MRErrorKitString(@"Mail Saved", nil);
        case MFMailComposeResultSent:
            return MRErrorKitString(@"Mail Sent", nil);
        case MFMailComposeResultFailed:
            return MRErrorKitString(@"Mail Failed", nil);
    }
    return MRErrorKitString(@"Unknown Result", nil);
}

+ (NSString *)stringWithMessageComposeResult:(NSInteger const)code
{
    switch (code) {
        case MessageComposeResultCancelled:
            return MRErrorKitString(@"Message Cancelled", nil);
        case MessageComposeResultSent:
            return MRErrorKitString(@"Message Sent", nil);
        case MessageComposeResultFailed:
            return MRErrorKitString(@"Message Failed", nil);
    }
    return MRErrorKitString(@"Unknown Result", nil);
}

@end

#endif
