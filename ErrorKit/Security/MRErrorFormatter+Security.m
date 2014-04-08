// MRErrorFormatter+Security.m
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

#import "MRErrorFormatter+Security.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_SECURITY

@implementation MRErrorFormatter (ErrorKit_Security)

+ (NSString *)debugStringWithKeychainServiceCode:(NSInteger const)code
{
    switch (code) {
        case errSecSuccess:
            return mr_stringize_error_code(errSecSuccess);
        case errSecUnimplemented:
            return mr_stringize_error_code(errSecUnimplemented);
        case errSecParam:
            return mr_stringize_error_code(errSecParam);
        case errSecAllocate:
            return mr_stringize_error_code(errSecAllocate);
        case errSecNotAvailable:
            return mr_stringize_error_code(errSecNotAvailable);
        case errSecAuthFailed:
            return mr_stringize_error_code(errSecAuthFailed);
        case errSecDuplicateItem:
            return mr_stringize_error_code(errSecDuplicateItem);
        case errSecItemNotFound:
            return mr_stringize_error_code(errSecItemNotFound);
        case errSecInteractionNotAllowed:
            return mr_stringize_error_code(errSecInteractionNotAllowed);
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case errSecReadOnly:
            return mr_stringize_error_code(errSecReadOnly);
        case errSecNoSuchKeychain:
            return mr_stringize_error_code(errSecNoSuchKeychain);
        case errSecInvalidKeychain:
            return mr_stringize_error_code(errSecInvalidKeychain);
        case errSecDuplicateKeychain:
            return mr_stringize_error_code(errSecDuplicateKeychain);
        case errSecDuplicateCallback:
            return mr_stringize_error_code(errSecDuplicateCallback);
        case errSecInvalidCallback:
            return mr_stringize_error_code(errSecInvalidCallback);
        case errSecBufferTooSmall:
            return mr_stringize_error_code(errSecBufferTooSmall);
        case errSecDataTooLarge:
            return mr_stringize_error_code(errSecDataTooLarge);
        case errSecNoSuchAttr:
            return mr_stringize_error_code(errSecNoSuchAttr);
        case errSecInvalidItemRef:
            return mr_stringize_error_code(errSecInvalidItemRef);
        case errSecInvalidSearchRef:
            return mr_stringize_error_code(errSecInvalidSearchRef);
        case errSecNoSuchClass:
            return mr_stringize_error_code(errSecNoSuchClass);
        case errSecNoDefaultKeychain:
            return mr_stringize_error_code(errSecNoDefaultKeychain);
        case errSecReadOnlyAttr:
            return mr_stringize_error_code(errSecReadOnlyAttr);
        case errSecWrongSecVersion:
            return mr_stringize_error_code(errSecWrongSecVersion);
        case errSecKeySizeNotAllowed:
            return mr_stringize_error_code(errSecKeySizeNotAllowed);
        case errSecNoStorageModule:
            return mr_stringize_error_code(errSecNoStorageModule);
        case errSecNoCertificateModule:
            return mr_stringize_error_code(errSecNoCertificateModule);
        case errSecNoPolicyModule:
            return mr_stringize_error_code(errSecNoPolicyModule);
        case errSecInteractionRequired:
            return mr_stringize_error_code(errSecInteractionRequired);
        case errSecDataNotAvailable:
            return mr_stringize_error_code(errSecDataNotAvailable);
        case errSecDataNotModifiable:
            return mr_stringize_error_code(errSecDataNotModifiable);
        case errSecCreateChainFailed:
            return mr_stringize_error_code(errSecCreateChainFailed);
        case errSecACLNotSimple:
            return mr_stringize_error_code(errSecACLNotSimple);
        case errSecPolicyNotFound:
            return mr_stringize_error_code(errSecPolicyNotFound);
        case errSecInvalidTrustSetting:
            return mr_stringize_error_code(errSecInvalidTrustSetting);
        case errSecNoAccessForItem:
            return mr_stringize_error_code(errSecNoAccessForItem);
        case errSecInvalidOwnerEdit:
            return mr_stringize_error_code(errSecInvalidOwnerEdit);
#endif
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithKeychainServiceCode:(NSInteger const)code
{
    switch (code) {
        case errSecSuccess:
            return MRErrorKitString(@"No Error", nil);
        case errSecUnimplemented:
            return MRErrorKitString(@"Unimplemented", nil);
        case errSecParam:
            return MRErrorKitString(@"Invalid Parameter", nil);
        case errSecAllocate:
            return MRErrorKitString(@"Memory Allocation Error", nil);
        case errSecNotAvailable:
            return MRErrorKitString(@"No Trust Results Available", nil);
        case errSecAuthFailed:
            return MRErrorKitString(@"Authorization/Authentication Failed", nil);
        case errSecDuplicateItem:
            return MRErrorKitString(@"Item Already Exists", nil);
        case errSecItemNotFound:
            return MRErrorKitString(@"Item Not Found", nil);
        case errSecInteractionNotAllowed:
            return MRErrorKitString(@"Interaction Not Allowed", nil);
#if !(TARGET_OS_IPHONE || TARGET_IPHONE_SIMULATOR)
        case errSecReadOnly:
            return MRErrorKitString(@"Read Only Error", nil);
        case errSecNoSuchKeychain:
            return MRErrorKitString(@"Keychain Non Existent", nil);
        case errSecInvalidKeychain:
            return MRErrorKitString(@"Invalid Keychain", nil);
        case errSecDuplicateKeychain:
            return MRErrorKitString(@"Duplicate Keychain", nil);
        case errSecDuplicateCallback:
            return MRErrorKitString(@"Duplicate Callback", nil);
        case errSecInvalidCallback:
            return MRErrorKitString(@"Invalid Callback", nil);
        case errSecBufferTooSmall:
            return MRErrorKitString(@"Buffer Too Small", nil);
        case errSecDataTooLarge:
            return MRErrorKitString(@"Data Too Large", nil);
        case errSecNoSuchAttr:
            return MRErrorKitString(@"Attribute Non Existent", nil);
        case errSecInvalidItemRef:
            return MRErrorKitString(@"Invalid Item Reference", nil);
        case errSecInvalidSearchRef:
            return MRErrorKitString(@"Invalid Search Reference", nil);
        case errSecNoSuchClass:
            return MRErrorKitString(@"Keychain Class Non Existent", nil);
        case errSecNoDefaultKeychain:
            return MRErrorKitString(@"Default Keychain Non Existent", nil);
        case errSecReadOnlyAttr:
            return MRErrorKitString(@"Read Only Attribute", nil);
        case errSecWrongSecVersion:
            return MRErrorKitString(@"Wrong Version", nil);
        case errSecKeySizeNotAllowed:
            return MRErrorKitString(@"Key Size Not Allowed", nil);
        case errSecNoStorageModule:
            return MRErrorKitString(@"No Storage Module", nil);
        case errSecNoCertificateModule:
            return MRErrorKitString(@"No Certificate Module Available", nil);
        case errSecNoPolicyModule:
            return MRErrorKitString(@"No Policy Module Available", nil);
        case errSecInteractionRequired:
            return MRErrorKitString(@"User Interaction Required", nil);
        case errSecDataNotAvailable:
            return MRErrorKitString(@"Data Not Available", nil);
        case errSecDataNotModifiable:
            return MRErrorKitString(@"Data Not Modifiable", nil);
        case errSecCreateChainFailed:
            return MRErrorKitString(@"Certificate Chain Creation Failed", nil);
        case errSecACLNotSimple:
            return MRErrorKitString(@"Access Control List Not In Standard Simple Form", nil);
        case errSecPolicyNotFound:
            return MRErrorKitString(@"Policy Not Found", nil);
        case errSecInvalidTrustSetting:
            return MRErrorKitString(@"Invalid Trust Setting", nil);
        case errSecNoAccessForItem:
            return MRErrorKitString(@"No Access Control For Item", nil);
        case errSecInvalidOwnerEdit:
            return MRErrorKitString(@"Invalid Owner Edit Attempt", nil);
#endif
    }
    return MRErrorKitString(@"Keychain Error", nil);
}

@end

#endif
