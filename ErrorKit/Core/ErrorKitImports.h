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
#endif

#import <objc/runtime.h>

#ifdef ERROR_KIT_ACCOUNTS
#import "ErrorKit_Accounts.h"
#endif

#ifdef ERROR_KIT_ADDITIONS
#import "ErrorKit_Additions.h"
#endif

#ifdef ERROR_KIT_ADMOB
#import "ErrorKit_Admob.h"
#endif

#ifdef ERROR_KIT_AFNETWORKING
#import "ErrorKit_AFNetworking.h"
#endif

#ifdef ERROR_KIT_AVFOUNDATION
#import "ErrorKit_AVFoundation.h"
#endif

#ifdef ERROR_KIT_CORE
#import "ErrorKit_Core.h"
#endif

#ifdef ERROR_KIT_CORE_DATA
#import "ErrorKit_CoreData.h"
#endif

#ifdef ERROR_KIT_CORE_LOCATION
#import "ErrorKit_CoreLocation.h"
#endif

#ifdef ERROR_KIT_DEFAULT
#import "ErrorKit_Default.h"
#endif

#ifdef ERROR_KIT_FACEBOOK_SDK
#import "ErrorKit_FacebookSDK.h"
#endif

#ifdef ERROR_KIT_HTTP
#import "ErrorKit_HTTP.h"
#endif

#ifdef ERROR_KIT_IAD
#import "ErrorKit_iAD.h"
#endif

#ifdef ERROR_KIT_JSON_KIT
#import "ErrorKit_JSONKit.h"
#endif

#ifdef ERROR_KIT_JSON_VALUES
#import "ErrorKit_JSONValues.h"
#endif

#ifdef ERROR_KIT_MAP_KIT
#import "ErrorKit_MapKit.h"
#endif

#ifdef ERROR_KIT_MESSAGE_UI
#import "ErrorKit_MessageUI.h"
#endif

#ifdef ERROR_KIT_NSEXCEPTION
#import "ErrorKit_NSException.h"
#endif

#ifdef ERROR_KIT_PARSE
#import "ErrorKit_Parse.h"
#endif

#ifdef ERROR_KIT_SECURITY
#import "ErrorKit_Security.h"
#endif

#ifdef ERROR_KIT_STORE_KIT
#import "ErrorKit_StoreKit.h"
#endif

#ifdef ERROR_KIT_TRANSITION_KIT
#import "ErrorKit_TransitionKit.h"
#endif

#ifdef ERROR_KIT_UI_KIT
#import "ErrorKit_UIKit.h"
#endif

#ifdef ERROR_KIT_VERI_JSON
#import "ErrorKit_VeriJSON.h"
#endif


#ifndef _ERRORKITDEFINES_H

#ifdef ERROR_KIT_ACCOUNTS
#import <Accounts/Accounts.h>
#endif

#ifdef ERROR_KIT_ADMOB
#import <Google-AdMob-Ads-SDK/GADRequestError.h>
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

#ifdef ERROR_KIT_FACEBOOK_SDK
#import <FacebookSDK/FacebookSDK.h>
#import <FacebookSDK/NSError+FBError.h>
#import <FacebookSDK/FBError.h>
#import <FacebookSDK/FBErrorUtility+Internal.h>
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

#ifdef ERROR_KIT_UI_KIT
#import <UIKit/UIKit.h>
#endif

#ifdef ERROR_KIT_VERI_JSON
#import <VeriJSON/VeriJSON.h>
#endif

#endif
