// MRAppDelegate.h
//
// Copyright (c) 2013 Héctor Marqués
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import <UIKit/UIKit.h>


/// App delegate that implements itself a simple Core Data stack (no thread confinement).
@interface MRAppDelegate : UIResponder <UIApplicationDelegate> {
    NSManagedObjectContext *_managedObjectContext;
    NSManagedObjectModel *_managedObjectModel;
    NSPersistentStoreCoordinator *_persistentStoreCoordinator;
}

@property (nonatomic, strong) IBOutlet UIWindow *window;

/// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory;

/// @name Core Data stack

@property (nonatomic, strong) NSString *managedObjectModelName;

/// URL used to create/load the persistent store.
@property (nonatomic, strong) NSURL *storeURL;

/// If set, enables NSMigratePersistentStoresAutomaticallyOption and NSInferMappingModelAutomaticallyOption.
@property (nonatomic, assign) BOOL automaticStoreMigration;

/// Returns the managed object model for the application.
/// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel;

/// Saves the managed object context.
- (IBAction)saveContexAction:(id)sender;

/// Unsets the managed object model, the managed object context and its persistent store coordinator.
- (void)unsetPersistentStoreCoordinator;

/// Returns the managed object context for the application.
/// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContextWithError:(NSError **)errorPtr;

/// Returns the persistent store coordinator for the application.
/// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithError:(NSError **)errorPtr;

/// Inserts into the stack's managed object context a new object with the unfaulted properties and relationships of the given object.
/// If a `mapping` dictionary is given, it is used to avoid duplicating objects already conatined in the stack's context.
/// If the source object is itself already contained in `mapping`, the mapping instance is returned unmodified without any further processing.
/// Note that any object inserted in the managed object context by this method will be added to the `mapping` dictionary.
- (NSManagedObject *)managedObjectWithUnfaultedDataFromObject:(NSManagedObject *)sourceObject mapping:(NSMutableDictionary *)mapping withError:(NSError **)errorPtr;

@end
