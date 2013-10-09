// MRErrorBuilder+AVFoundation.h
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

#import "MRErrorBuilder.h"
#import <AVFoundation/AVTime.h>


/**
 Adds accessors for AVError `userInfo` values.
 
 **Warning:** This extension requires the AVFoundation framework. Add a `AVFoundation/AVFoundation.h` import to the header prefix of the project.
 */
@interface MRErrorBuilder (ErrorKit_AVFoundation)

/// @name AVFoundationErrorDomain userInfo values

/// Accessors for `AVErrorDeviceKey` user info value.
@property (nonatomic, copy) NSString *deviceName;

/// Accessors for `AVErrorTimeKey` user info value.
@property (nonatomic, assign) CMTime time;

/// Accessors for `AVErrorFileSizeKey` user info value.
@property (nonatomic, copy) NSNumber *fileSize;

/// Accessors for `AVErrorPIDKey` user info value.
@property (nonatomic, copy) NSNumber *processID;

/// Accessors for `AVErrorRecordingSuccessfullyFinishedKey` user info value.
@property (nonatomic, assign) BOOL recordingSuccessfullyFinished;

/// Accessors for `AVErrorMediaTypeKey` user info value.
@property (nonatomic, copy) NSString *mediaType;

/// Accessors for `AVErrorMediaSubTypeKey` user info value.
@property (nonatomic, copy) NSNumber *mediaSubType;

@end
