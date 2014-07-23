// UIApplication+FacebookSDK.m
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

#import "UIApplication+FacebookSDK.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_FACEBOOK_SDK

@implementation UIApplication (ErrorKit_FacebookSDK)

- (BOOL)handleFacebookAuthError:(NSError *const)error withLoginBlock:(void(^const)(NSError *))loginBlock
{
    MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
#if ERROR_KIT_FACEBOOK_SDK_V2
    if ([FBErrorUtility shouldNotifyUserForError:error]) {
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = [FBErrorUtility userMessageForError:error];
    } else {
        if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
            builder.localizedDescription = MRErrorKitString(@"Login cancelled", nil);
            builder.localizedFailureReason = MRErrorKitString(@"You should log in to continue.", nil);
            if (loginBlock) {
                [builder addRecoveryOption:MRErrorKitString(@"Log in", nil) withBlock:loginBlock];
            }
        } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryAuthenticationReopenSession){
            builder.localizedDescription = MRErrorKitString(@"Session Error", nil);
            builder.localizedFailureReason = MRErrorKitString(@"Your current session is no longer valid. Please log in again.", nil);
            if (loginBlock) {
                [builder addRecoveryOption:MRErrorKitString(@"Log in", nil) withBlock:loginBlock];
            }
        } else {
            builder.localizedDescription  = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
            builder.localizedFailureReason = MRErrorKitString(@"Please retry", nil);
        }
    }
#else
    if (error.fberrorShouldNotifyUser) {
        if ([error.loginFailedReason isEqualToString:FBErrorLoginFailedReasonSystemDisallowedWithoutErrorValue]) {
            builder.localizedDescription = MRErrorKitString(@"App Disabled", nil);
            NSString *const localizedFormat = MRErrorKitString(@"Go to Settings > Facebook and turn ON %@.", nil);
            NSString *const localizedName = [NSBundle.mainBundle objectForInfoDictionaryKey:(NSString *)kCFBundleNameKey];
            builder.localizedFailureReason = [NSString stringWithFormat:localizedFormat, localizedName];
        } else if ([error.loginFailedReason isEqualToString:FBErrorReauthorizeFailedReasonWrongUser]) {
            if (FBSession.activeSession.isOpen) {
                [FBSession.activeSession closeAndClearTokenInformation];
            }
            [FBSession setActiveSession:nil];
            builder.localizedDescription = MRErrorKitString(@"Wrong user", nil);
            builder.localizedFailureReason = MRErrorKitString(@"Facebook session does not match with the current user. Please log in again.", nil);
            if (loginBlock) {
                [builder addRecoveryOption:MRErrorKitString(@"Log in", nil) withBlock:loginBlock];
            }
        } else if ([error.loginFailedReason isEqualToString:FBErrorLoginFailedReasonSystemError]) {
            builder.localizedDescription = ([MRErrorFormatter stringWithDomain:error.innerError.domain code:error.innerError.code]
                                            ?:[MRErrorFormatter stringWithDomain:error.domain code:error.code]);
            builder.localizedFailureReason = MRErrorKitString(@"The Facebook server could not fulfill this access request. Please contact application support.", nil);
        } else {
            builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
            builder.localizedFailureReason = error.fberrorUserMessage;
        }
    } else if (error.fberrorCategory == FBErrorCategoryAuthenticationReopenSession) {
        builder.localizedDescription = MRErrorKitString(@"Session Error", nil);
        NSInteger underlyingSubCode = [error.parsedJSONResponse [@"body"]
                                       [@"error"]
                                       [@"error_subcode"] integerValue];
        if (underlyingSubCode == FBAuthSubcodeAppNotInstalled) {
            builder.localizedFailureReason = MRErrorKitString(@"The app was removed. Please log in again.", nil);
        } else {
            builder.localizedFailureReason = MRErrorKitString(@"Your current session is no longer valid. Please log in again.", nil);
        }
        if (loginBlock) {
            [builder addRecoveryOption:MRErrorKitString(@"Log in", nil) withBlock:loginBlock];
        }
    } else if (error.fberrorCategory == FBErrorCategoryUserCancelled) {
        if (error.innerError) {
            builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
            builder.localizedFailureReason = [MRErrorFormatter stringWithDomain:error.innerError.domain code:error.innerError.code];
        } else {
            builder = nil;
        }
    } else {
        builder.localizedDescription  = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = MRErrorKitString(@"Error. Please try again later.", nil);
    }
#endif
    NSError *const customizedError = builder.error;
    return [self presentError:customizedError];
}

- (BOOL)handleFacebookRequestPermissionError:(NSError *const)error
{
    MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
#if ERROR_KIT_FACEBOOK_SDK_V2
    if ([FBErrorUtility shouldNotifyUserForError:error] == YES){
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = [FBErrorUtility userMessageForError:error];
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryUserCancelled) {
        builder.localizedDescription = MRErrorKitString(@"Permission not granted", nil);
        builder.localizedFailureReason = MRErrorKitString(@"Operation could not be completed because you didn't grant the necessary permissions.", nil);
    } else {
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = MRErrorKitString(@"Please retry", nil);
    }
#else
    if (error.fberrorShouldNotifyUser) {
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = error.fberrorUserMessage;
    } else if (error.fberrorCategory == FBErrorCategoryUserCancelled){
        if (error.innerError) {
            builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
            builder.localizedFailureReason = [MRErrorFormatter stringWithDomain:error.innerError.domain code:error.innerError.code];
        } else {
            builder = nil;
        }
    } else {
        builder.localizedDescription = MRErrorKitString(@"Permission Error", nil);
        builder.localizedFailureReason = MRErrorKitString(@"Unable to request permissions", nil);
    }
#endif
    NSError *const customizedError = builder.error;
    return [self presentError:customizedError];
}

- (BOOL)handleFacebookAPICallError:(NSError *const)error withPermissionBlock:(void(^const)(NSError *))permissionBlock andRetryBlock:(void(^const)(NSError *))retryBlock
{
    MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
#if ERROR_KIT_FACEBOOK_SDK_V2
    if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryPermissions) {
        builder.localizedDescription = MRErrorKitString(@"Permission Error", nil);
        if (permissionBlock) {
            [builder addRecoveryOption:MRErrorKitString(@"Grant permission", nil) withBlock:permissionBlock];
        }
    } else if ([FBErrorUtility errorCategoryForError:error] == FBErrorCategoryRetry ||
        [FBErrorUtility errorCategoryForError:error] == FBErrorCategoryThrottling) {
        builder.localizedDescription = MRErrorKitString(@"Facebook Error", nil);
        if (retryBlock) {
            [builder addRecoveryOption:MRErrorKitString(@"Retry", nil) withBlock:retryBlock];
        }
    } else if ([FBErrorUtility shouldNotifyUserForError:error]) {
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = error.fberrorUserMessage;
    } else {
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = MRErrorKitString(@"Unable to fullfill request. Please try again later.", nil);
    }
#else
    if (error.fberrorCategory == FBErrorCategoryRetry ||
        error.fberrorCategory == FBErrorCategoryThrottling) {
        builder.localizedDescription = MRErrorKitString(@"Facebook Error", nil);
        if (retryBlock) {
            [builder addRecoveryOption:MRErrorKitString(@"Retry", nil) withBlock:retryBlock];
        }
    }
    if (error.fberrorShouldNotifyUser) {
        builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
        builder.localizedFailureReason = error.fberrorUserMessage;
    } else if (error.fberrorCategory == FBErrorCategoryPermissions) {
        builder.localizedDescription = MRErrorKitString(@"Permission Error", nil);
        if (permissionBlock) {
            [builder addRecoveryOption:MRErrorKitString(@"Grant permission", nil) withBlock:permissionBlock];
        }
    } else if (error.fberrorCategory == FBErrorCategoryUserCancelled) {
        if (error.innerError) {
            builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
            builder.localizedFailureReason = [MRErrorFormatter stringWithDomain:error.innerError.domain code:error.innerError.code];
        } else {
            builder = nil;
        }
    } else {
        NSNumber *code;
        NSNumber *subcode;
        NSDictionary *const JSON = error.parsedJSONResponse;
        if ([JSON isKindOfClass:NSDictionary.class]) {
            NSDictionary *const body = JSON[@"body"];
            if ([body isKindOfClass:NSDictionary.class]) {
                NSDictionary *const dict = body[@"error"];
                if ([dict isKindOfClass:NSDictionary.class]) {
                    code = dict[@"code"];
                    subcode = dict[@"error_subcode"];
                }
            }
        }
        if ([code isKindOfClass:NSNumber.class] && code.integerValue == 2500) {
            builder.localizedDescription = MRErrorKitString(@"Permission Error", nil);
            builder.localizedFailureReason = MRErrorKitString(@"Not logged in.", nil);
            if (permissionBlock) {
                [builder addRecoveryOption:MRErrorKitString(@"Log in", nil) withBlock:permissionBlock];
            }
        } else {
            builder.localizedDescription = [MRErrorFormatter stringWithDomain:error.domain code:error.code];
            builder.localizedFailureReason = MRErrorKitString(@"Unable to fullfill request. Please try again later.", nil);
        }
    }
#endif
    NSError *const customizedError = builder.error;
    return [self presentError:customizedError];
}

@end

#endif
