// MRErrorFormatter+AVFoundation.m
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

#import "MRErrorFormatter+AVFoundation.h"
#import "ErrorKitImports.h"

#if  ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag
#endif


#ifdef ERROR_KIT_AVFOUNDATION

@implementation MRErrorFormatter (ErrorKit_AVFoundation)

+ (NSString *)debugStringWithAVCode:(NSInteger const)code
{
    switch (code) {
        case AVErrorUnknown:
            return mr_stringize_error_code(AVErrorUnknown);
        case AVErrorOutOfMemory:
            return mr_stringize_error_code(AVErrorOutOfMemory);
        case AVErrorSessionNotRunning:
            return mr_stringize_error_code(AVErrorSessionNotRunning);
        case AVErrorDeviceAlreadyUsedByAnotherSession:
            return mr_stringize_error_code(AVErrorDeviceAlreadyUsedByAnotherSession);
        case AVErrorNoDataCaptured:
            return mr_stringize_error_code(AVErrorNoDataCaptured);
        case AVErrorSessionConfigurationChanged:
            return mr_stringize_error_code(AVErrorSessionConfigurationChanged);
        case AVErrorDiskFull:
            return mr_stringize_error_code(AVErrorDiskFull);
        case AVErrorDeviceWasDisconnected:
            return mr_stringize_error_code(AVErrorDeviceWasDisconnected);
        case AVErrorMediaChanged:
            return mr_stringize_error_code(AVErrorMediaChanged);
        case AVErrorMaximumDurationReached:
            return mr_stringize_error_code(AVErrorMaximumDurationReached);
        case AVErrorMaximumFileSizeReached:
            return mr_stringize_error_code(AVErrorMaximumFileSizeReached);
        case AVErrorMediaDiscontinuity:
            return mr_stringize_error_code(AVErrorMediaDiscontinuity);
        case AVErrorMaximumNumberOfSamplesForFileFormatReached:
            return mr_stringize_error_code(AVErrorMaximumNumberOfSamplesForFileFormatReached);
        case AVErrorDeviceNotConnected:
            return mr_stringize_error_code(AVErrorDeviceNotConnected);
        case AVErrorDeviceInUseByAnotherApplication:
            return mr_stringize_error_code(AVErrorDeviceInUseByAnotherApplication);
        case AVErrorDeviceLockedForConfigurationByAnotherProcess:
            return mr_stringize_error_code(AVErrorDeviceLockedForConfigurationByAnotherProcess);
#if TARGET_OS_IPHONE
        case AVErrorSessionWasInterrupted:
            return mr_stringize_error_code(AVErrorSessionWasInterrupted);
        case AVErrorMediaServicesWereReset:
            return mr_stringize_error_code(AVErrorMediaServicesWereReset);
#endif
        case AVErrorExportFailed:
            return mr_stringize_error_code(AVErrorExportFailed);
        case AVErrorDecodeFailed:
            return mr_stringize_error_code(AVErrorDecodeFailed);
        case AVErrorInvalidSourceMedia:
            return mr_stringize_error_code(AVErrorInvalidSourceMedia);
        case AVErrorFileAlreadyExists:
            return mr_stringize_error_code(AVErrorFileAlreadyExists);
        case AVErrorCompositionTrackSegmentsNotContiguous:
            return mr_stringize_error_code(AVErrorCompositionTrackSegmentsNotContiguous);
        case AVErrorInvalidCompositionTrackSegmentDuration:
            return mr_stringize_error_code(AVErrorInvalidCompositionTrackSegmentDuration);
        case AVErrorInvalidCompositionTrackSegmentSourceStartTime:
            return mr_stringize_error_code(AVErrorInvalidCompositionTrackSegmentSourceStartTime);
        case AVErrorInvalidCompositionTrackSegmentSourceDuration:
            return mr_stringize_error_code(AVErrorInvalidCompositionTrackSegmentSourceDuration);
        case AVErrorFileFormatNotRecognized:
            return mr_stringize_error_code(AVErrorFileFormatNotRecognized);
        case AVErrorFileFailedToParse:
            return mr_stringize_error_code(AVErrorFileFailedToParse);
        case AVErrorMaximumStillImageCaptureRequestsExceeded:
            return mr_stringize_error_code(AVErrorMaximumStillImageCaptureRequestsExceeded);
        case AVErrorContentIsProtected:
            return mr_stringize_error_code(AVErrorContentIsProtected);
        case AVErrorNoImageAtTime:
            return mr_stringize_error_code(AVErrorNoImageAtTime);
        case AVErrorDecoderNotFound:
            return mr_stringize_error_code(AVErrorDecoderNotFound);
        case AVErrorEncoderNotFound:
            return mr_stringize_error_code(AVErrorEncoderNotFound);
        case AVErrorContentIsNotAuthorized:
            return mr_stringize_error_code(AVErrorContentIsNotAuthorized);
        case AVErrorApplicationIsNotAuthorized:
            return mr_stringize_error_code(AVErrorApplicationIsNotAuthorized);
#if TARGET_OS_IPHONE
        case AVErrorDeviceIsNotAvailableInBackground:
            return mr_stringize_error_code(AVErrorDeviceIsNotAvailableInBackground);
#endif
        case AVErrorOperationNotSupportedForAsset:
            return mr_stringize_error_code(AVErrorOperationNotSupportedForAsset);
        case AVErrorDecoderTemporarilyUnavailable:
            return mr_stringize_error_code(AVErrorDecoderTemporarilyUnavailable);
        case AVErrorEncoderTemporarilyUnavailable:
            return mr_stringize_error_code(AVErrorEncoderTemporarilyUnavailable);
        case AVErrorInvalidVideoComposition:
            return mr_stringize_error_code(AVErrorInvalidVideoComposition);
        case AVErrorReferenceForbiddenByReferencePolicy:
            return mr_stringize_error_code(AVErrorReferenceForbiddenByReferencePolicy);
        case AVErrorInvalidOutputURLPathExtension:
            return mr_stringize_error_code(AVErrorInvalidOutputURLPathExtension);
        case AVErrorScreenCaptureFailed:
            return mr_stringize_error_code(AVErrorScreenCaptureFailed);
        case AVErrorDisplayWasDisabled:
            return mr_stringize_error_code(AVErrorDisplayWasDisabled);
        case AVErrorTorchLevelUnavailable:
            return mr_stringize_error_code(AVErrorTorchLevelUnavailable);
#if TARGET_OS_IPHONE
        case AVErrorOperationInterrupted:
            return mr_stringize_error_code(AVErrorOperationInterrupted);
#endif
        case AVErrorIncompatibleAsset:
            return mr_stringize_error_code(AVErrorIncompatibleAsset);
        case AVErrorFailedToLoadMediaData:
            return mr_stringize_error_code(AVErrorFailedToLoadMediaData);
        case AVErrorServerIncorrectlyConfigured:
            return mr_stringize_error_code(AVErrorServerIncorrectlyConfigured);
    }
    return @(code).stringValue;
}

+ (NSString *)stringWithAVCode:(NSInteger const)code
{
    switch (code) {
        case AVErrorUnknown:
            return MRErrorKitString(@"Unknown Error", nil);
        case AVErrorOutOfMemory:
            return MRErrorKitString(@"Out Of Memory", nil);
        case AVErrorSessionNotRunning:
            return MRErrorKitString(@"Session Not Running", nil);
        case AVErrorDeviceAlreadyUsedByAnotherSession:
            return MRErrorKitString(@"Device Busy", nil);
        case AVErrorNoDataCaptured:
            return MRErrorKitString(@"No Data Captured", nil);
        case AVErrorSessionConfigurationChanged:
            return MRErrorKitString(@"Session Configuration Changed", nil);
        case AVErrorDiskFull:
            return MRErrorKitString(@"Disk Full", nil);
        case AVErrorDeviceWasDisconnected:
            return MRErrorKitString(@"Device Disconnected", nil);
        case AVErrorMediaChanged:
            return MRErrorKitString(@"Media Changed", nil);
        case AVErrorMaximumDurationReached:
            return MRErrorKitString(@"Maximum Duration Reached", nil);
        case AVErrorMaximumFileSizeReached:
            return MRErrorKitString(@"Maximum File Size Reached", nil);
        case AVErrorMediaDiscontinuity:
            return MRErrorKitString(@"Media Discontinuity", nil);
        case AVErrorMaximumNumberOfSamplesForFileFormatReached:
            return MRErrorKitString(@"Maximum Number Of Samples Reached", nil);
        case AVErrorDeviceNotConnected:
            return MRErrorKitString(@"Device Not Connected", nil);
        case AVErrorDeviceInUseByAnotherApplication:
            return MRErrorKitString(@"Device Busy", nil);
        case AVErrorDeviceLockedForConfigurationByAnotherProcess:
            return MRErrorKitString(@"Device Busy", nil);
#if TARGET_OS_IPHONE
        case AVErrorSessionWasInterrupted:
            return MRErrorKitString(@"Session Interrupted", nil);
        case AVErrorMediaServicesWereReset:
            return MRErrorKitString(@"Media Services Unavailable", nil);
#endif
        case AVErrorExportFailed:
            return MRErrorKitString(@"Export Failed", nil);
        case AVErrorDecodeFailed:
            return MRErrorKitString(@"Decode Failed", nil);
        case AVErrorInvalidSourceMedia:
            return MRErrorKitString(@"Invalid Source Media", nil);
        case AVErrorFileAlreadyExists:
            return MRErrorKitString(@"File Already Exists", nil);
        case AVErrorCompositionTrackSegmentsNotContiguous:
            return MRErrorKitString(@"Source Media Contains Gaps", nil);
        case AVErrorInvalidCompositionTrackSegmentDuration:
            return MRErrorKitString(@"Invalid Destination Duration", nil);
        case AVErrorInvalidCompositionTrackSegmentSourceStartTime:
            return MRErrorKitString(@"Invalid Source Start Time", nil);
        case AVErrorInvalidCompositionTrackSegmentSourceDuration:
            return MRErrorKitString(@"Invalid Source Duration", nil);
        case AVErrorFileFormatNotRecognized:
            return MRErrorKitString(@"Unrecognized File Format", nil);
        case AVErrorFileFailedToParse:
            return MRErrorKitString(@"Parse Failed", nil);
        case AVErrorMaximumStillImageCaptureRequestsExceeded:
            return MRErrorKitString(@"Too Many Requests", nil);
        case AVErrorContentIsProtected:
            return MRErrorKitString(@"Content Is Protected", nil);
        case AVErrorNoImageAtTime:
            return MRErrorKitString(@"No Image At Time", nil);
        case AVErrorDecoderNotFound:
            return MRErrorKitString(@"Decoder Not Found", nil);
        case AVErrorEncoderNotFound:
            return MRErrorKitString(@"Encoder Not Found", nil);
        case AVErrorContentIsNotAuthorized:
            return MRErrorKitString(@"Content Not Authorized", nil);
        case AVErrorApplicationIsNotAuthorized:
            return MRErrorKitString(@"Application Not Authorized", nil);
#if TARGET_OS_IPHONE
        case AVErrorDeviceIsNotAvailableInBackground:
            return MRErrorKitString(@"Background Capture Not Available", nil);
#endif
        case AVErrorOperationNotSupportedForAsset:
            return MRErrorKitString(@"Operation Not Supported", nil);
        case AVErrorDecoderTemporarilyUnavailable:
            return MRErrorKitString(@"Decoder Temporarily Unavailable", nil);
        case AVErrorEncoderTemporarilyUnavailable:
            return MRErrorKitString(@"Encoder Temporarily Unavailable", nil);
        case AVErrorInvalidVideoComposition:
            return MRErrorKitString(@"Invalid Video Composition", nil);
        case AVErrorReferenceForbiddenByReferencePolicy:
            return MRErrorKitString(@"Reference Not Allowed", nil);
        case AVErrorInvalidOutputURLPathExtension:
            return MRErrorKitString(@"URL Path Extension Invalid", nil);
        case AVErrorScreenCaptureFailed:
            return MRErrorKitString(@"Screen Capture Failed", nil);
        case AVErrorDisplayWasDisabled:
            return MRErrorKitString(@"Display Inactive", nil);
        case AVErrorTorchLevelUnavailable:
            return MRErrorKitString(@"Torch Level Unavailable", nil);
#if TARGET_OS_IPHONE
        case AVErrorOperationInterrupted:
            return MRErrorKitString(@"Operation Interrupted", nil);
#endif
        case AVErrorIncompatibleAsset:
            return MRErrorKitString(@"Incompatible Asset", nil);
        case AVErrorFailedToLoadMediaData:
            return MRErrorKitString(@"Missing Required Data", nil);
        case AVErrorServerIncorrectlyConfigured:
            return MRErrorKitString(@"Server Incorrectly Configured", nil);
    }
    return MRErrorKitString(@"AV Error", nil);
}

@end

#endif
