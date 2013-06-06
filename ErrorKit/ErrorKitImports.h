// ErrorKitImports.h
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


#ifndef _ERRORKITIMPORTS_H
#define _ERRORKITIMPORTS_H

#import <objc/runtime.h>

#import "NSError+ErrorKit.h"

#import "MRErrorBuilder.h"

#import "MRErrorFormatter.h"
#import "MRErrorFormatter+ErrorCode.h"

#import "MRChainedRecoveryAttempter.h"

#ifdef ERROR_KIT_ACCOUNTS
#import "MRErrorFormatter_Accounts.h"
#endif

#ifdef ERROR_KIT_ADMOB
#import "MRErrorFormatter_Admob.h"
#endif

#ifdef ERROR_KIT_AFNETWORKING
#import "NSError_AFNetworking.h"
#endif

#ifdef ERROR_KIT_AVFOUNDATION
#import "NSError_AVFoundation.h"
#import "MRErrorFormatter_AVFoundation.h"
#endif

#ifdef ERROR_KIT_CORE_DATA
#import "NSError_CoreData.h"
#import "MRErrorBuilder_CoreData.h"
#import "MRErrorFormatter_CoreData.h"
#endif

#ifdef ERROR_KIT_CORE_LOCATION
#import "MRErrorFormatter_CoreLocation.h"
#endif

#ifdef ERROR_KIT_FACEBOOK
#import "NSError_FacebookSDK.h"
#import "MRErrorBuilder_FacebookSDK.h"
#import "MRErrorFormatter_FacebookSDK.h"
#endif

#ifdef ERROR_KIT_IAD
#import "MRErrorFormatter_iAD.h"
#endif

#ifdef ERROR_KIT_JSON_KIT
#import "NSError_JSONKit.h"
#import "MRErrorFormatter_JSONKit.h"
#endif

#ifdef ERROR_KIT_MAP_KIT
#import "MRErrorFormatter_MapKit.h"
#endif

#ifdef ERROR_KIT_MESSAGE_UI
#import "MRErrorFormatter_MessageUI.h"
#endif

#ifdef ERROR_KIT_STORE_KIT
#import "MRErrorFormatter_StoreKit.h"
#endif

#ifdef ERROR_KIT_TRANSITION_KIT
#import "MRErrorFormatter_TransitionKit.h"
#endif

#ifdef UIKIT_STATIC_INLINE
#import "UIAlertView+ErrorKit.h"
#endif

#ifdef ERROR_KIT_VERI_JSON
#import "MRErrorFormatter_VeriJSON.h"
#endif

#ifndef _ERRORKITDEFINES_H

#ifdef ERROR_KIT_ACCOUNTS
#import <Accounts/Accounts.h>
#endif

#ifdef ERROR_KIT_ADMOB
#import <AdMob/GADRequestError.h>
#endif

#ifdef ERROR_KIT_AFNETWORKING
#import <AFNetworking/AFURLConnectionOperation.h>
#endif

#ifdef ERROR_KIT_AVFOUNDATION
#import <AVFoundation/AVError.h>
#import <AVFoundation/AVTime.h>
#endif

#ifdef ERROR_KIT_CORE_DATA
#import <CoreData/CoreDataErrors.h>
#endif

#ifdef ERROR_KIT_CORE_LOCATION
#import <CoreLocation/CLError.h>
#import <CoreLocation/CLErrorDomain.h>
#endif

#ifdef ERROR_KIT_FACEBOOK
#import <FacebookSDK/FacebookSDK.h>
#import <FacebookSDK/NSError+FBError.h>
#import <FacebookSDK/FBError.h>
#import <FacebookSDK/FBErrorUtility.h>
#endif

#ifdef ERROR_KIT_IAD
#import <iAd/iAd.h>
#endif

#ifdef ERROR_KIT_MAP_KIT
#import <MapKit/MapKit.h>
#endif

#ifdef ERROR_KIT_MESSAGE_UI
#import <MessageUI/MessageUI.h>
#endif

#ifdef ERROR_KIT_STORE_KIT
#import <StoreKit/StoreKit.h>
#endif

#ifdef ERROR_KIT_TRANSITION_KIT
#import <TransitionKit/TransitionKit.h>
#endif

#ifdef ERROR_KIT_VERI_JSON
#import <VeriJSON/VeriJSON.h>
#endif

#endif

#endif
