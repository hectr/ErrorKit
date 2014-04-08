// MRAppDelegate.m
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

#import "MRAppDelegate.h"


@implementation MRAppDelegate

// Saves changes in the application's managed object context before the application terminates.
- (void)applicationWillTerminate:(UIApplication *const)application
{
    NSUserDefaults *const standardUserDefaults = NSUserDefaults.standardUserDefaults;
    [standardUserDefaults synchronize];
    [self saveContexAction:nil];
}

#pragma mark Accessors

- (NSURL *)storeURL
{
    if (_storeURL == nil) {
        NSUserDefaults *const standardUserDefaults = NSUserDefaults.standardUserDefaults;
        NSString *storeName = [standardUserDefaults objectForKey:@"MRPersistentStoreName"];
        if (storeName == nil) {
            NSBundle *const mainBundle = NSBundle.mainBundle;
            NSString *const bundleName = [mainBundle objectForInfoDictionaryKey:@"CFBundleName"];
            storeName = [bundleName stringByAppendingPathExtension:@"sqlite"];
        }
        NSURL *const applicationDocumentsDirectory = self.applicationDocumentsDirectory;
        _storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:storeName];
    }
    return _storeURL;
}

#pragma mark Error customization

// This method exemplifies how to customize an error before its presentation.
- (NSError *)application:(UIApplication *const)application willPresentError:(NSError *const)error
{
    MRErrorBuilder *const builder = [MRErrorBuilder builderWithError:error];
    if (error.code == NSPersistentStoreSaveError) {
        builder.localizedDescription = (builder.localizedFailureReason ?: builder.localizedDescription);
        builder.localizedFailureReason = MRErrorKitString(@"Attempt to save application data failed.", nil);
    } else if (error.code == NSMigrationMissingSourceModelError) {
        builder.localizedFailureReason = MRErrorKitString(@"Automatic migration failed.", nil);
        builder.helpAnchor = MRErrorKitString(@"Please contact support.", nil);
    } else if (error.code == NSPersistentStoreIncompatibleVersionHashError) {
        builder.localizedFailureReason = MRErrorKitString(@"Attempting to access data created with a different version of the application.", nil);
    }
    return builder.error;
}

#pragma mark - IBAction methods

- (IBAction)saveContexAction:(UIResponder *const)sender
{
    BOOL saved = NO;
    NSError *error = nil;
    NSManagedObjectContext *const managedObjectContext = [self managedObjectContextWithError:&error];
    if (managedObjectContext) {
        if ([managedObjectContext hasChanges]) {
            saved = [managedObjectContext save:&error];
        }
        if (sender) {
            [sender presentError:error];
        }
    }
}

#pragma mark - Application's Documents directory

- (NSURL *)applicationDocumentsDirectory
{
    NSFileManager *const defaultManager = NSFileManager.defaultManager;
    NSArray *const URLs = [defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return URLs.lastObject;
}

#pragma mark - Core Data stack

- (void)unsetPersistentStoreCoordinator
{
    NSDictionary *const userInfo =
    @{ @"managedObjectContext": (_managedObjectContext ?: NSNull.null)
     , @"persistentStoreCoordinator": (_persistentStoreCoordinator ?: NSNull.null) };
    _managedObjectContext = nil;
    _persistentStoreCoordinator = nil;
    _managedObjectModel = nil;
    [NSNotificationCenter.defaultCenter postNotificationName:@"DidUnsetPersistentStoreCoordinator"
                                                      object:self
                                                    userInfo:userInfo];
}

- (NSManagedObjectContext *)managedObjectContextWithError:(NSError *__autoreleasing *const)errorPtr
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *const coordinator = [self persistentStoreCoordinatorWithError:errorPtr];
    if (coordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    MRLogError((errorPtr ? *errorPtr : nil));
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    NSBundle *const mainBundle = NSBundle.mainBundle;
    NSString *const managedObjectModelName = self.managedObjectModelName ;
    NSURL *const modelURL = [mainBundle URLForResource:managedObjectModelName withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithError:(NSError *__autoreleasing *const)errorPtr
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSDictionary *options = nil;
    if (self.automaticStoreMigration) {
        options = @{ NSMigratePersistentStoresAutomaticallyOption: @YES
                   , NSInferMappingModelAutomaticallyOption: @YES };
    }
    @try {
        NSManagedObjectModel *const managedObjectModel = self.managedObjectModel;
        NSURL *const storeURL = self.storeURL;
        _persistentStoreCoordinator =
            [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
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
        self.storeURL = nil;
        _persistentStoreCoordinator = nil;
    }
    MRLogError((errorPtr ? *errorPtr : nil));
    return _persistentStoreCoordinator;
}

- (NSManagedObject *)managedObjectWithUnfaultedDataFromObject:(NSManagedObject *const)src mapping:(NSMutableDictionary *)mapping withError:(NSError **const)errorPtr
{
    __block NSError *error = nil;
    __block NSManagedObject *dest = nil;
    NSManagedObjectContext *const moc = [self managedObjectContextWithError:errorPtr];
    dest = mapping[src.objectID];
    if (dest == nil && moc && src.isFault == NO) {
        dest = [NSEntityDescription insertNewObjectForEntityForName:src.entity.name
                                                              inManagedObjectContext:moc];
        if (mapping == nil) {
            mapping = NSMutableDictionary.dictionary;
        }
        [mapping setObject:dest forKey:src.objectID];
        NSEntityDescription *const entity = [NSEntityDescription entityForName:src.entity.name
                                                        inManagedObjectContext:moc];
        NSDictionary *const attributes = entity.attributesByName;
        for (NSString *const attr in attributes) {
            [dest setValue:[src valueForKey:attr] forKey:attr];
        }
        
        NSDictionary *const relationships = entity.relationshipsByName;
        [relationships enumerateKeysAndObjectsUsingBlock:^(NSString *const key, NSRelationshipDescription *const rel, BOOL *const stop) {
            if (rel.isToMany) {
                NSSet *const srcObjects = [src valueForKey:key];
                NSMutableSet *const destObjects = [NSMutableSet setWithCapacity:srcObjects.count];
                for (NSManagedObject *const srcObject in srcObjects) {
                    NSManagedObject *const destObject = [self managedObjectWithUnfaultedDataFromObject:srcObject mapping:mapping withError:&error];
                    if (destObject) {
                        [destObjects addObject:destObject];
                    } else if (error) {
                        *stop = YES;
                    }
                }
                [dest setValue:destObjects forKey:key];
            } else {
                NSManagedObject *const srcObject = [src valueForKey:key];
                NSManagedObject *const destObject = [self managedObjectWithUnfaultedDataFromObject:srcObject mapping:mapping withError:&error];
                if (destObject) {
                    [dest setValue:destObject forKey:key];
                } else if (error) {
                    *stop = YES;
                }
            }
        }];
    }
    if (error) {
        [moc deleteObject:dest];
        if (errorPtr){
            *errorPtr = error;
        }
    }
    return dest;
}

@end
