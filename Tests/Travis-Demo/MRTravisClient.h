// MRTravisClient.h

#import "AFRESTClient.h"

#import "AFIncrementalStore.h"


@interface MRTravisClient : AFRESTClient <AFIncrementalStoreHTTPClient>

+ (instancetype)sharedClient;

@end
