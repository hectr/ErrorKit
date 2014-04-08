// UIResponder+ErrorKit.m
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
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_UI_KIT

@implementation UIResponder (ErrorKit)

- (BOOL)presentError:(NSError *const)error
            delegate:(id const)delegate
  didPresentSelector:(SEL const)didPresentSelector
         contextInfo:(void *const)contextInfo
{
    NSError *const customizedError = [self willPresentError:error];
    if (customizedError && self.nextResponder) {
        return [self.nextResponder presentError:customizedError
                                       delegate:delegate
                             didPresentSelector:didPresentSelector
                                    contextInfo:contextInfo];
    }
    return NO;
}

- (BOOL)presentError:(NSError *const)error
{
    NSError *const customizedError = [self willPresentError:error];
    if (customizedError && self.nextResponder) {
        return [self.nextResponder presentError:customizedError];
    }
    return NO;
}

- (NSError *)willPresentError:(NSError *const)error
{
    return error;
}

@end

#endif
