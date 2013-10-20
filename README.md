ErrorKit
========

**Error Kit** is a handy iOS library for making `NSError` handling easier.

It covers error object creation, inspection, presentation and recovery.

Examples
--------

### Log error (if any)

    MRLogError(error);

### Assert

    MRNotErrorAssert(error);
    
### Access error values

	NSString *helpAnchor = error.helpAnchor;
    NSURLRequest *request = error.failingURLRequest;
    NSArray *errors = error.detailedErrors;
    // and so on...
    // (supports most AFNetworking, AVFoundation, Core Data, Facebook SDK and JSONKit keys)

### Present error to the user

        if (!error.isCancelledError) {
	        [[UIAlertView alertWithTitle:nil error:error] show];
	    }
        // or you can rely on responder chain and do:
        // [self presentError:error];

### Attempt to recover from error

        if (error.code == NSURLErrorNotConnectedToInternet && error.isHTTPError) {
	        MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
	        builder.localizedRecoverySuggestion = NSLocalizedString(@"Please check your internet connection.", nil);
	       [builder addRecoveryOption:NSLocalizedString(@"Retry", nil)
	                        withBlock:^(NSError *error) {
                [[HTTPClient sharedClient] resendRequest];
            }];
	        [self presentError:builder.error];
	    }

### *Stringize* error code

    NSString *debugString = [MRErrorFormatter debugStringWithDomain:error.domain code:error.code]; // e.g. NSURLErrorNetworkConnectionLost
    NSString *localizedString = [MRErrorFormatter stringWithDomain:error.domain code:error.code]; // e.g. Connection Lost
    // (supports most Accounts, Admob, AVFoundation, Core Data, Core Location, Facebook SDK, iAD, JSONKit, Map Kit, MessageUI, Security, Store Kit, TransitionKit and VeriJSON codes)

### Other examples

#### Handle Facebook errors

    // ErrorKit provides handlers for Facebook authentication, request permission and API calls errors.
    - (BOOL)handleFacebookAuthError:(NSError *)error withLoginBlock:(void(^)(NSError *))loginBlock;
    - (BOOL)handleFacebookRequestPermissionError:(NSError *)error;
    - (BOOL)handleFacebookAPICallError:(NSError *)error withPermissionBlock:(void(^)(NSError *))permissionBlock andRetryBlock:(void(^)(NSError *))retryBlock;

#### Access JSON values

    // ErrorKit also provides methods for safely retrieving values from dictionaries and arrays:
    - (NSNumber *)numberForKey:(id)aKey withError:(NSError **)errorPtr;
    - (NSString *)stringForKey:(id)aKey withError:(NSError **)errorPtr;
    - (NSArray *)arrayForKey:(id)aKey withError:(NSError **)errorPtr;
    - (NSDictionary *)dictionaryForKey:(id)aKey withError:(NSError **)errorPtr;
    // etc.

> See *ErrorKit-Example* project or browse online [documentation](http://hectr.github.com/ErrorKit/) for further reference.

Installation
------------

1. Drag and drop the *ErrorKit* folder to your project.
2. Add `#import "ErrorKitDefines.h"` or customize enabled features by defining `ERROR_KIT_CORE` and some of the following contants somewhere (e.g. in your *-Prefix.pch* file):
`ERROR_KIT_ACCOUNTS`, `ERROR_KIT_ADDITIONS`, `ERROR_KIT_ADMOB`, `ERROR_KIT_AFNETWORKING`, `ERROR_KIT_AVFOUNDATION`, `ERROR_KIT_CORE_DATA`, `ERROR_KIT_CORE_LOCATION`, `ERROR_KIT_FACEBOOK`, `ERROR_KIT_HTTP`, `ERROR_KIT_JSON_KIT`, `ERROR_KIT_JSON_VALUES`, `ERROR_KIT_MAP_KIT`, `ERROR_KIT_MESSAGE_UI`, `ERROR_KIT_NSEXCEPTION`, `ERROR_SECURITY`, `ERROR_KIT_STORE_KIT`, `ERROR_KIT_TRANSITION_KIT`, `ERROR_KIT_IAD`, `ERROR_KIT_UI_KIT` and/or `ERROR_KIT_VERI_JSON`.
3. Finally add `#import "ErrorKit.h"`.

### CocoaPods

The **ErrorKit** specification provides the following subspecs:

* **pod 'ErrorKit/Default'**: `#import <ErrorKit/ErrorKit_Default.h>`
* **pod 'ErrorKit/Accounts'**: `#import <ErrorKit/ErrorKit_Accounts.h>`
* **pod 'ErrorKit/AdMob'**: `#import <ErrorKit/ErrorKit_Admob.h>`
* **pod 'ErrorKit/AFNetworking'**: `#import <ErrorKit/ErrorKit_AFNetworking.h>`
* **pod 'ErrorKit/AVFoundation'**: `#import <ErrorKit/ErrorKit_AVFoundation.h>`
* **pod 'ErrorKit/Core'**: `#import <ErrorKit/ErrorKit_Core.h>`
* **pod 'ErrorKit/CoreData'**: `#import <ErrorKit/ErrorKit_CoreData.h>`
* **pod 'ErrorKit/CoreLocation'**: `#import <ErrorKit/ErrorKit_CoreLocation.h>`
* **pod 'ErrorKit/FacebookSDK'**: `#import <ErrorKit/ErrorKit_FacebookSDK.h>`
* **pod 'ErrorKit/HTTP'**: `#import <ErrorKit/ErrorKit_HTTP.h>`
* **pod 'ErrorKit/JSONKit'**: `#import <ErrorKit/ErrorKit_JSONKit.h>`
* **pod 'ErrorKit/JSONValues'**: `#import <ErrorKit/ErrorKit_JSONValues.h>`
* **pod 'ErrorKit/MapKit'**: `#import <ErrorKit/ErrorKit_MapKit.h>`
* **pod 'ErrorKit/MessageUI'**: `#import <ErrorKit/ErrorKit_MessageUI.h>`
* **pod 'ErrorKit/NSException'**: `#import <ErrorKit/ErrorKit_NSException.h>`
* **pod 'ErrorKit/Security'**: `#import <ErrorKit/ErrorKit_Security.h>`
* **pod 'ErrorKit/StoreKit'**: `#import <ErrorKit/ErrorKit_StoreKit.h>`
* **pod 'ErrorKit/TransitionKit'**: `#import <ErrorKit/ErrorKit_TransitionKit.h>`
* **pod 'ErrorKit/iAD'**: `#import <ErrorKit/ErrorKit_iAD.h>`
* **pod 'ErrorKit/UIKit'**: `#import <ErrorKit/ErrorKit_UIKit.h>`
* **pod 'ErrorKit/VeriJSON'**: `#import <ErrorKit/ErrorKit_VeriJSON.h>`

License
-------

**Error Kit** is available under the MIT license. See the LICENSE file for more info.
