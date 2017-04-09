ErrorKit
========

**ErrorKit** is a handy iOS library for making `NSError` handling easier. It covers error object creation, inspection, presentation and recovery.

Its purpose is to help you write failure-aware applications with fewer and simpler code. This is achieved by convining an iOS implementation of the *error-responder* and *error-recovery* mechanisms available in the **Application Kit** (see [Error Handling Programming Guide For Cocoa](https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ErrorHandlingCocoa/ErrorHandling/ErrorHandling.html)) with some new APIs with error conscious methods.

Examples
--------

### Macros

```objc
// Log error (if any)
MRLogError(error);
// Assert
MRNotErrorAssert(error);
```

### Access error values

```objc
NSString *helpAnchor = error.helpAnchor;
NSURLRequest *request = error.failingURLRequest;
NSArray *errors = error.detailedErrors;
// and so on...
// (supports most AFNetworking, AVFoundation, Core Data, Facebook SDK, JSONKit and Parse keys)
```

### Present error

```objc
if (!error.isCancelledError) {
    [[UIAlertView alertWithTitle:nil error:error] show];
}
// or you can rely on responder chain and do:
// [self presentError:error];
```

### Attempt error recovery

```objc
if (error.code == NSURLErrorNotConnectedToInternet && error.isHTTPError) {
    MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
    builder.localizedRecoverySuggestion = NSLocalizedString(@"Please check your internet connection.", nil);
    [builder addRecoveryOption:NSLocalizedString(@"Retry", nil)
                     withBlock:^(NSError *error) {
        [[HTTPClient sharedClient] resendRequest];
    }];
    [self presentError:builder.error];
}
```

### *Stringize* error code

```objc
NSString *debugString = [MRErrorFormatter debugStringWithDomain:error.domain code:error.code]; // e.g. NSURLErrorNetworkConnectionLost
NSString *localizedString = [MRErrorFormatter stringWithDomain:error.domain code:error.code]; // e.g. Connection Lost
// (supports most Accounts, Admob, AVFoundation, Core Data, Core Location, Facebook SDK, iAD, JSONKit, Map Kit, MessageUI, Parse, Security, Store Kit, TransitionKit and VeriJSON codes)
```

### Other features

#### Handle Facebook errors

ErrorKit provides handlers for Facebook authentication, request permission and API calls errors.

```objc
// UIResponder+FacebookSDK:
- (BOOL)handleFacebookAuthError:(NSError *)error withLoginBlock:(void(^)(NSError *))loginBlock;
- (BOOL)handleFacebookRequestPermissionError:(NSError *)error;
- (BOOL)handleFacebookAPICallError:(NSError *)error withPermissionBlock:(void(^)(NSError *))permissionBlock andRetryBlock:(void(^)(NSError *))retryBlock;
```

#### Use JSON safely

##### Serialize/Deserialize

```objc
// NSJSONSerialization+JSONValues:
+ (NSData *)dataWithArray:(NSArray *)obj options:(NSJSONWritingOptions)opt error:(NSError **)errorPtr;
+ (NSData *)dataWithDictionary:(NSDictionary *)obj options:(NSJSONWritingOptions)opt error:(NSError **)errorPtr;
+ (NSArray *)arrayWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError **)errorPtr;
+ (NSDictionary *)dictionaryWithData:(NSData *)data options:(NSJSONReadingOptions)opt error:(NSError **)errorPtr;
```

##### Access values

ErrorKit also provides methods for retrieving values from dictionaries and arrays.

```objc
- (id)objectAtIndex:(NSUInteger)index withError:(NSError **)errorPtr;        
- (NSNumber *)numberForKey:(id)aKey withError:(NSError **)errorPtr;
- (NSString *)stringForKey:(id)aKey withError:(NSError **)errorPtr;
- (NSArray *)arrayForKey:(id)aKey withError:(NSError **)errorPtr;
- (NSDictionary *)dictionaryForKey:(id)aKey withError:(NSError **)errorPtr;
```
    
Alternatively you can use the block version of these methods.

```objc
- (BOOL)objectAtIndex:(NSUInteger)index block:(void(^)(id object, NSError *error))block;
- (BOOL)numberForKey:(id)aKey block:(void(^)(NSNumber *number, NSError *error))block;
// etc.
```

##### Manipulate mutable collections

```objc
// NSMutableArray+JSONValues:
- (BOOL)addObject:(id)anObject withError:(NSError **)errorPtr;
- (BOOL)removeObjectAtIndex:(NSUInteger)index withError:(NSError **)errorPtr;
- (BOOL)replaceObjectAtIndex:(NSUInteger)index withObject:(id)anObject error:(NSError **)errorPtr;
// etc.

// NSMutableDictionary+JSONValues:
- (BOOL)setNumber:(NSNumber *)aNumber forKey:(id<NSCopying>)aKey withError:(NSError **)errorPtr;
- (BOOL)setString:(NSString *)aString forKey:(id<NSCopying>)aKey withError:(NSError **)errorPtr;
// etc.
```

> See *ErrorKit-Example* and *CoreData-Example* projects or browse online [documentation](http://hectr.github.com/ErrorKit/) for further reference.

Installation
------------

1. Drag and drop the *ErrorKit* folder to your project.
2. Add `#import "ErrorKitDefines.h"` or customize enabled features by defining `ERROR_KIT_CORE` and some of the following contants somewhere in your code (e.g. in *-Prefix.pch* file):
`ERROR_KIT_ACCOUNTS`, `ERROR_KIT_ADDITIONS`, `ERROR_KIT_ADMOB`, `ERROR_KIT_AFNETWORKING`, `ERROR_KIT_AVFOUNDATION`, `ERROR_KIT_CORE_DATA`, `ERROR_KIT_CORE_LOCATION`, `ERROR_KIT_FACEBOOK`, `ERROR_KIT_HTTP`, `ERROR_KIT_JSON_KIT`, `ERROR_KIT_JSON_VALUES`, `ERROR_KIT_MAP_KIT`, `ERROR_KIT_MESSAGE_UI`, `ERROR_KIT_NSEXCEPTION`, `ERROR_KIT_PARSE`, `ERROR_SECURITY`, `ERROR_KIT_STORE_KIT`, `ERROR_KIT_TRANSITION_KIT`, `ERROR_KIT_IAD`, `ERROR_KIT_UI_KIT` and/or `ERROR_KIT_VERI_JSON`.
3. Finally add `#import "ErrorKit.h"`.

### CocoaPods

For using the functionalities provided by one subspec you must add it to your *Podfile* and import its header in your code.

The **ErrorKit** specification provides the following subspecs:

* **pod 'ErrorKit/Default'**: `#import <ErrorKit/ErrorKit_Default.h>`
* **pod 'ErrorKit/Accounts'**: `#import <ErrorKit/ErrorKit_Accounts.h>`
* ~~**pod 'ErrorKit/AdMob'**: `#import <ErrorKit/ErrorKit_Admob.h>`~~
* **pod 'ErrorKit/AFNetworking_v1'**: `#import <ErrorKit/ErrorKit_AFNetworking.h>`
* ~~**pod 'ErrorKit/AFNetworking_v2'**: `#import <ErrorKit/ErrorKit_AFNetworking.h>`~~
* **pod 'ErrorKit/AVFoundation'**: `#import <ErrorKit/ErrorKit_AVFoundation.h>`
* **pod 'ErrorKit/Core'**: `#import <ErrorKit/ErrorKit_Core.h>`
* **pod 'ErrorKit/CoreData'**: `#import <ErrorKit/ErrorKit_CoreData.h>`
* **pod 'ErrorKit/CoreLocation'**: `#import <ErrorKit/ErrorKit_CoreLocation.h>`
* ~~**pod 'ErrorKit/FacebookSDK_v1'**: `#import <ErrorKit/ErrorKit_FacebookSDK.h>`~~
* ~~**pod 'ErrorKit/FacebookSDK_v2'**: `#import <ErrorKit/ErrorKit_FacebookSDK.h>`~~
* **pod 'ErrorKit/HTTP'**: `#import <ErrorKit/ErrorKit_HTTP.h>`
* **pod 'ErrorKit/JSONKit'**: `#import <ErrorKit/ErrorKit_JSONKit.h>`
* **pod 'ErrorKit/JSONValues'**: `#import <ErrorKit/ErrorKit_JSONValues.h>`
* **pod 'ErrorKit/MapKit'**: `#import <ErrorKit/ErrorKit_MapKit.h>`
* **pod 'ErrorKit/MessageUI'**: `#import <ErrorKit/ErrorKit_MessageUI.h>`
* **pod 'ErrorKit/NSException'**: `#import <ErrorKit/ErrorKit_NSException.h>`
* **pod 'ErrorKit/Parse'**: `#import <ErrorKit/ErrorKit_Parse.h>`
* **pod 'ErrorKit/Security'**: `#import <ErrorKit/ErrorKit_Security.h>`
* **pod 'ErrorKit/StoreKit'**: `#import <ErrorKit/ErrorKit_StoreKit.h>`
* **pod 'ErrorKit/TransitionKit'**: `#import <ErrorKit/ErrorKit_TransitionKit.h>`
* **pod 'ErrorKit/iAD'**: `#import <ErrorKit/ErrorKit_iAD.h>`
* **pod 'ErrorKit/UIKit'**: `#import <ErrorKit/ErrorKit_UIKit.h>`
* **pod 'ErrorKit/VeriJSON'**: `#import <ErrorKit/ErrorKit_VeriJSON.h>`

License
-------

**ErrorKit** is available under the MIT license. See the *LICENSE* file for more info.

Alternatives
============

Other projects implementing similar error handling and presentation mechanisms:

* [EPSErrorHandling](https://github.com/ElectricPeelSoftware/EPSErrorHandling)
* [ios-presentError](github.com/kemenaran/ios-presSee entError) ([Fail better](http://speakerdeck.com/kemenaran/fail-better-presenting-errors-in-cocoa))
* [RMErrorRecoveryAttempter](https://github.com/realmacsoftware/RMErrorRecoveryAttempter)
