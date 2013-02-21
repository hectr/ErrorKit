ErrorKit
========

**Error Kit** is a handy iOS library for making `NSError` handling easier.

It covers error objects creation, inspection, presentation and recovery.

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
    NSArray *errors = error.detailedErrors;
    NSURLRequest *request = error.failingURLRequest;
    // and so on...

**Present error to the user**

        if (!error.isCancelledError) {
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

See *ErrorKit-Example* project or browse online [documentation](http://hectr.github.com/ErrorKit/) for further reference.

License
-------

**Error Kit** is available under the MIT license. See the LICENSE file for more info.
