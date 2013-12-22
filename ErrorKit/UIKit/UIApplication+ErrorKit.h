// UIApplication+ErrorKit.h
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
 Overrides **Error-Responder Chain** methods for error presentation.
 */
@interface UIApplication (ErrorKit)

/**
 Sends `application:willPresentError:` to app delegate before displaying the 
 error.
 
 @param error An object containing information about an error.
 @param delegate An object that is the delegate.
 @param didPresentSelector A selector identifying the method implemented by the 
 delegate.
 @param contextInfo Arbitrary data associated with the attempt at error 
 recovery, to be passed to `delegate` in `didRecoverSelector`.
 
 @return `YES` if the error has been presented, `NO` otherwise.
 */
- (BOOL)presentError:(NSError *)error
            delegate:(id)delegate
  didPresentSelector:(SEL)didPresentSelector
         contextInfo:(void *)contextInfo;

/**
 Sends `application:willPresentError:` to app delegate before displaying the
 error.
  
 @param error An object containing information about an error.
 
 @return `YES` if the error has been presented, `NO` otherwise.
*/
- (BOOL)presentError:(NSError *)error;

@end
