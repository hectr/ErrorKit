ErrorKit
========

**Error Kit** is a handy iOS library for making `NSError` handling easier.

It covers error object creation, inspection, presentation and recovery.

Usage
-----

1. To use **Error Kit** you simply need to drag and drop the *ErrorKit* folder to your project.
2. And that's it, there is no step 2.

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
    // (supports most AFNetworking, Core Data, Facebook SDK and JSONKit keys)

**Present error to the user**

        if (!error.isCancelledError) {
	        [[UIAlertView alertWithTitle:nil error:error] show];
	    }
        // or you can rely on responder chain and do:
        // [self presentError:error];

**Attempt to recover from error**

        if (error.code == NSURLErrorNotConnectedToInternet) {
	        MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
	        builder.recoveryAttempter =
	            [[MRBlockRecoveryAttempter alloc] initWithBlock:^BOOL(NSError *error, NSUInteger recoveryOption) {
                    [[HTTPClient sharedClient] sendRequest];
                }];
	        builder.localizedRecoverySuggestion = NSLocalizedString(@"Please check your internet connection.", nil);
	        builder.localizedRecoveryOptions = @[ NSLocalizedString(@"Retry", nil) ];
	        [self presentError:builder.error];
	    }

***Stringize* error codes**

    NSString *debugString = [MRErrorFormatter debugStringWithDomain:error.domain code:error.code]; // e.g. NSURLErrorNetworkConnectionLost
    NSString *localizedString = [MRErrorFormatter stringWithDomain:error.domain code:error.code]; // e.g. Connection Lost
    // (supports most Accounts, Admob, Core Data, Core Location, Facebook SDK, iAD, JSONKit, Map Kit, MessageUI, Security, Store Kit and TransitionKit codes)

See *ErrorKit-Example* project or browse online [documentation](http://hectr.github.com/ErrorKit/) for further reference.

License
-------

**Error Kit** is available under the MIT license. See the LICENSE file for more info.
