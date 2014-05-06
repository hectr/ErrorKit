// MRTravisAppDelegate.h

#import <UIKit/UIKit.h>


@interface MRTravisAppDelegate : UIResponder <UIApplicationDelegate>

+ (MRTravisAppDelegate *)sharedDelegate;

@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;

- (NSManagedObjectContext *)managedObjectContextWithError:(NSError *__autoreleasing *const)errorPtr;
- (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithError:(NSError *__autoreleasing *const)errorPtr;

@end
