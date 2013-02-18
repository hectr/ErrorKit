ErrorKit
========

ErrorKit is a handy iOS library for making error handling easier.

It covers error creation, inspection, presentation and recovery.

Usage
-----

1. To use **ErrorKit** you simply need to drag and drop the *ErrorKit* folder to your project.
2. And that's it, there is no step 2.

Examples
--------

**Log error (if any)**

    MRLogError(error);

**Assert**

    MRNotErrorAssert(error);
    
**Access error values**

    NSArray *errors = error.detailedErrors;

**Present error to the user**

        if (error.code != NSURLErrorUserCancelledAuthentication &&
                   error.code != NSURLErrorCancelled) {
	        [[UIAlertView alertWithTitle:nil error:error] show];
	    }

**Attempt to recover from error**

        if (error.code == NSURLErrorNotConnectedToInternet) {
	        MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
	        builder.recoveryAttempter = _attempter;
	        builder.localizedRecoverySuggestion = NSLocalizedString(@"Please check your internet connection.", nil);
	        builder.localizedRecoveryOptions = @[ NSLocalizedString(@"Retry", nil) ];
	        [[UIAlertView alertWithTitle:nil error:builder.error] show];
	    }

See *ErrorKit-Example* project for further reference.

License
-------

ErrorKit is available under the MIT license. See the LICENSE file for more info.
