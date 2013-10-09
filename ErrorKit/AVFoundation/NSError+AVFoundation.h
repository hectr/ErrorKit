// NSError+AVFoundation.h
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

#import "NSError+ErrorKit.h"
#import <AVFoundation/AVTime.h>


/**
 Adds getters for AVError `userInfo` values.
 
 @warning This extension requires the AVFoundation framework. Add a `AVFoundation/AVFoundation.h` import to the header prefix of the project.
 */
@interface NSError (ErrorKit_AVFoundation)

/// @name AVFoundationErrorDomain userInfo values

/// Getter for `AVErrorDeviceKey` user info value.
@property (nonatomic, readonly) NSString *deviceName;

/// Getter for `AVErrorTimeKey` user info value.
@property (nonatomic, readonly) CMTime time;

/// Getter for `AVErrorFileSizeKey` user info value.
@property (nonatomic, readonly) NSNumber *fileSize;

/// Getter for `AVErrorPIDKey` user info value.
@property (nonatomic, readonly) NSNumber *processID;

/// Getter for `AVErrorRecordingSuccessfullyFinishedKey` user info value.
@property (nonatomic, readonly) BOOL recordingSuccessfullyFinished;

/// Getter for `AVErrorMediaTypeKey` user info value.
@property (nonatomic, readonly) NSString *mediaType;

/// Getter for `AVErrorMediaSubTypeKey` user info value.
@property (nonatomic, readonly) NSNumber *mediaSubType;

@end
