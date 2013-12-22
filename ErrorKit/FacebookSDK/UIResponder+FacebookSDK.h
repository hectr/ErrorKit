// UIResponder+FacebookSDK.h
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

#import "UIResponder+ErrorKit.h"


/**
 Use the methods added by this category instead of `[UIResponder presentError:]`
 for easier handling of FacebookSDK errors.
 
 See <https://developers.facebook.com/docs/technical-guides/iossdk/errors/>.
 */
@interface UIResponder (ErrorKit_FacebookSDK)

/**
 Helper method to handle errors during authentication request.
 
 @param error An object containing information about an error in the 
 `FacebookSDKDomain`.
 @param loginBlock 'Log in' recovery option.
 
 @return `YES` if the error has been presented, `NO` otherwise.
 */
- (BOOL)handleFacebookAuthError:(NSError *)error withLoginBlock:(void(^)(NSError *error))loginBlock;

/**
 Helper method to handle errors during permissions request.
 
 @param error An object containing information about an error in the 
 `FacebookSDKDomain`.
 
 @return `YES` if the error has been presented, `NO` otherwise.
 */
- (BOOL)handleFacebookRequestPermissionError:(NSError *)error;

/**
 Helper method to handle errors during API calls.

 @param error An object containing information about an error in the 
 `FacebookSDKDomain`.
 @param permissionBlock 'Grant permission' recovery option.
 @param retryBlock 'Grant permission' recovery option.
 
 @return `YES` if the error has been presented, `NO` otherwise.
*/
- (BOOL)handleFacebookAPICallError:(NSError *)error withPermissionBlock:(void(^)(NSError *error))permissionBlock andRetryBlock:(void(^)(NSError *error))retryBlock;

@end
