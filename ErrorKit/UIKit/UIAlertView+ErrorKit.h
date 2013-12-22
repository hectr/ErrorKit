// UIAlertView+ErrorKit.h
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

#import <UIKit/UIKit.h>


/**
 Extracts the localized error description, failure reason and recovery 
 suggestion and the recovery options from error and uses them as the alert’s 
 message and button titles, respectively.
 
 If the error's `localizedRecoveryOptions` is nil, a single localized "OK" 
 button is shown. If `helpAnchor` is set, a localized "Help" button is also 
 shown.
 */
@interface UIAlertView (ErrorKit)

/**
 Convenience method for initializing an alert view with data from an error 
 object.
 
 @param titleOrNil The string to be used as title or `nil` if `MRErrorFormatter`
 should be used for providing a suitable title.
 @param error The error used to initialize the alert.
 
 @return Newly initialized alert view prepared for presenting error data.
 */
+ (instancetype)alertWithTitle:(NSString *)titleOrNil
                         error:(NSError *)error;

/**
 Convenience method for initializing an alert view with data from an error 
 object.
 
 @param titleOrNil The string to be used as title or `nil` if `MRErrorFormatter`
 should be used for providing a suitable title.
 @param error The error used to initialize the alert.
 @param delegate The alert's delegate. It is also used as recovery delegate.
 @param didRecoverSelector A selector identifying the method implemented by the 
 delegate (see NSErrorRecoveryAttempting).
 @param contextInfo Arbitrary data to be passed to delegate in 
 didRecoverSelector.
 
 @return Newly initialized alert view prepared for presenting error data.
 */
+ (instancetype)alertWithTitle:(NSString *)titleOrNil
                         error:(NSError *)error
                      delegate:(id)delegate
            didRecoverSelector:(SEL)selector
                   contextInfo:(void *)context;

@end
