// MRTravisIncrementalStore.m

#import "MRTravisIncrementalStore.h"
#import <CoreData/CoreData.h>

#import "MRTravisClient.h"
#import "ErrorKit_NSException.h"


@implementation MRTravisIncrementalStore

+ (void)initialize
{
    [NSPersistentStoreCoordinator registerStoreClass:self
                                        forStoreType:self.type];
}

+ (NSString *)type
{
    NSString *const type = NSStringFromClass(self);
    return type;
}

+ (NSManagedObjectModel *)model
{
    NSManagedObjectModel *const model = [NSManagedObjectModel mergedModelFromBundles:NSBundle.allBundles];
    return model;
}

- (id<AFIncrementalStoreHTTPClient>)HTTPClient
{
    MRTravisClient *const sharedClient = MRTravisClient.sharedClient;
    return sharedClient;
}

@end
