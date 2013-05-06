ErrorKit
========

**Error Kit** is a handy iOS library for making `NSError` handling easier.

It covers error object creation, inspection, presentation and recovery.

Examples
--------

**Log error (if any)**

    MRLogError(error);

**Assert**

    MRNotErrorAssert(error);
    
**Access error values**

	NSString *helpAnchor = error.helpAnchor;
    NSURLRequest *request = error.failingURLRequest;
    NSArray *errors = error.detailedErrors;
    // and so on...
    // (supports most AFNetworking, AVFoundation, Core Data, Facebook SDK and JSONKit keys)

**Present error to the user**

        if (!error.isCancelledError) {
	        [[UIAlertView alertWithTitle:nil error:error] show];
	    }
        // or you can rely on responder chain and do:
        // [self presentError:error];

**Attempt to recover from error**

        if (error.code == NSURLErrorNotConnectedToInternet && error.isHTTPError) {
	        MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
	        builder.localizedRecoverySuggestion = NSLocalizedString(@"Please check your internet connection.", nil);
	       [builder addRecoveryOption:NSLocalizedString(@"Retry", nil)
	                        withBlock:^(NSError *error) {
                [[HTTPClient sharedClient] resendRequest];
            }];
	        [self presentError:builder.error];
	    }

***Stringize* error codes**

    NSString *debugString = [MRErrorFormatter debugStringWithDomain:error.domain code:error.code]; // e.g. NSURLErrorNetworkConnectionLost
    NSString *localizedString = [MRErrorFormatter stringWithDomain:error.domain code:error.code]; // e.g. Connection Lost
    // (supports most Accounts, Admob, AVFoundation, Core Data, Core Location, Facebook SDK, iAD, JSONKit, Map Kit, MessageUI, Security, Store Kit and TransitionKit codes)

See *ErrorKit-Example* project or browse online [documentation](http://hectr.github.com/ErrorKit/) for further reference.

Usage
-----

1. Drag and drop the *ErrorKit* folder to your project.
2. Add `#import "ErrorKit.h"` somewhere (e.g. in your *-Prefix.pch* file).
3. Add `#import "ErrorKitDefines.h"` or customize enabled features by defining the following contants:
`ERROR_KIT_ACCOUNTS`, `ERROR_KIT_ADMOB`, `ERROR_KIT_AFNETWORKING`, `ERROR_KIT_AVFOUNDATION`, `ERROR_KIT_CORE_DATA`, `ERROR_KIT_CORE_LOCATION`, `ERROR_KIT_FACEBOOK`, `ERROR_KIT_JSON_KIT`, `ERROR_KIT_MAP_KIT`, `ERROR_KIT_MESSAGE_UI`, `ERROR_SECURITY`, `ERROR_KIT_STORE_KIT`, `ERROR_KIT_TRANSITION_KIT` and/or `ERROR_KIT_IAD`.

License
-------

**Error Kit** is available under the MIT license. See the LICENSE file for more info.
