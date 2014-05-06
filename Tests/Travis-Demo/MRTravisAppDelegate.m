// MRTravisAppDelegate.m

#import "MRTravisAppDelegate.h"

#import "AFIncrementalStore.h"
#import "MRTravisIncrementalStore.h"
#import "MRErrorBuilder+NSException.h"


@interface MRTravisAppDelegate ()
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
@end


@implementation MRTravisAppDelegate

@synthesize managedObjectContext       = _managedObjectContext;
@synthesize managedObjectModel         = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

+ (MRTravisAppDelegate *)sharedDelegate
{
    return (MRTravisAppDelegate *)UIApplication.sharedApplication.delegate;
}

#pragma mark - Core Data

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContextWithError:(NSError *__autoreleasing *const)errorPtr
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *const coordinator = [self persistentStoreCoordinatorWithError:errorPtr];
    if (coordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }

    _managedObjectModel = [NSManagedObjectModel mergedModelFromBundles:NSBundle.allBundles];
    
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithError:(NSError *__autoreleasing *const)errorPtr
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSDictionary *const options = @{ NSInferMappingModelAutomaticallyOption : @(YES),
                               NSMigratePersistentStoresAutomaticallyOption: @(YES) };
    
    NSURL *const storeURL = [self.applicationDocumentsDirectory URLByAppendingPathComponent:@"Travis.sqlite"];
    
    @try {
        NSManagedObjectModel *const managedObjectModel = self.managedObjectModel;
        _persistentStoreCoordinator =
        [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
        
        AFIncrementalStore *const incrementalStore =
        (AFIncrementalStore *)[_persistentStoreCoordinator addPersistentStoreWithType:MRTravisIncrementalStore.type
                                                                        configuration:nil
                                                                                  URL:nil
                                                                              options:nil
                                                                                error:nil];
        
        if (![incrementalStore.backingPersistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                              configuration:nil
                                                                                        URL:storeURL
                                                                                    options:options
                                                                                      error:errorPtr]) {
            _persistentStoreCoordinator = nil;
        }

    }
    @catch (NSException *exception) {
        if (errorPtr) {
            *errorPtr = [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain
                                                     code:NSPersistentStoreOpenError
                                                exception:exception].error;
        }
        _persistentStoreCoordinator = nil;
    }
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    NSFileManager *const defaultManager = NSFileManager.defaultManager;
    NSArray *const URLs = [defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return URLs.lastObject;
}

@end
