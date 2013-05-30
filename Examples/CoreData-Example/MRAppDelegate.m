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
- (void)applicationWillTerminate:(UIApplication *)application
{
    [NSUserDefaults.standardUserDefaults synchronize];
    [self saveContexAction:nil];
}

#pragma mark Accessors

- (NSURL *)storeURL
{
    if (_storeURL == nil) {
        NSString *storeName = [NSUserDefaults.standardUserDefaults objectForKey:@"MRPersistentStoreName"];
        if (storeName == nil) {
            NSString *bundleName = [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleName"];
            storeName = [bundleName stringByAppendingPathExtension:@"sqlite"];
        }
        _storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:storeName];
    }
    return _storeURL;
}

#pragma mark Error customization

// This method exemplifies how to customize an error before its presentation.
- (NSError *)application:(UIApplication *)application willPresentError:(NSError *)error
{
    MRErrorBuilder *builder = [MRErrorBuilder builderWithError:error];
    if (error.code == NSPersistentStoreSaveError) {
        builder.localizedDescription = (builder.localizedFailureReason ?: builder.localizedDescription);
        builder.localizedFailureReason = NSLocalizedString(@"Attempt to save application data failed.", nil);
    } else if (error.code == NSMigrationMissingSourceModelError) {
        builder.localizedFailureReason = NSLocalizedString(@"Automatic migration failed.", nil);
        builder.helpAnchor = NSLocalizedString(@"Please contact support.", nil);
    } else if (error.code == NSPersistentStoreIncompatibleVersionHashError) {
        builder.localizedFailureReason = NSLocalizedString(@"Attempting to access data created with a different version of the application.", nil);
    }
    return builder.error;
}

#pragma mark - IBAction methods

- (IBAction)saveContexAction:(UIResponder *)sender
{
    BOOL saved = NO;
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = [self managedObjectContextWithError:&error];
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
    return [NSFileManager.defaultManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].lastObject;
}

#pragma mark - Core Data stack

- (void)unsetPersistentStoreCoordinator
{
    NSDictionary *userInfo = @{ @"managedObjectContext": (_managedObjectContext ?: NSNull.null)
                              , @"persistentStoreCoordinator": (_persistentStoreCoordinator ?: NSNull.null) };
    _managedObjectContext = nil;
    _persistentStoreCoordinator = nil;
    _managedObjectModel = nil;
    [NSNotificationCenter.defaultCenter postNotificationName:@"DidUnsetPersistentStoreCoordinator"
                                                      object:self
                                                    userInfo:userInfo];
}

- (NSManagedObjectContext *)managedObjectContextWithError:(NSError *__autoreleasing *)errorPtr
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinatorWithError:errorPtr];
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
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:self.managedObjectModelName withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinatorWithError:(NSError *__autoreleasing *)errorPtr
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
        _persistentStoreCoordinator =
            [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
        if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                       configuration:nil
                                                                 URL:self.storeURL
                                                             options:options
                                                               error:errorPtr]) {
            _persistentStoreCoordinator = nil;
        }
    }
    @catch (NSException *exception) {
        *errorPtr = [MRErrorBuilder builderWithDomain:NSCocoaErrorDomain
                                                 code:NSPersistentStoreOpenError
                                            exception:exception].error;
        self.storeURL = nil;
        _persistentStoreCoordinator = nil;
    }
    MRLogError((errorPtr ? *errorPtr : nil));
    return _persistentStoreCoordinator;
}

- (NSManagedObject *)managedObjectWithUnfaultedDataFromObject:(NSManagedObject *)src mapping:(NSMutableDictionary *)mapping withError:(NSError **)errorPtr
{
    __block NSError *error = nil;
    __block NSManagedObject *dest = nil;
    NSManagedObjectContext *moc = [self managedObjectContextWithError:errorPtr];
    dest = mapping[src.objectID];
    if (dest == nil && moc && src.isFault == NO) {
        dest = [NSEntityDescription insertNewObjectForEntityForName:src.entity.name
                                                              inManagedObjectContext:moc];
        if (mapping == nil) {
            mapping = NSMutableDictionary.dictionary;
        }
        [mapping setObject:dest forKey:src.objectID];
        NSDictionary *attributes = [NSEntityDescription entityForName:src.entity.name
                                               inManagedObjectContext:moc].attributesByName;
        for (NSString *attr in attributes) {
            [dest setValue:[src valueForKey:attr] forKey:attr];
        }
        NSDictionary *relationships = [NSEntityDescription entityForName:src.entity.name
                                                  inManagedObjectContext:moc].relationshipsByName;
        [relationships enumerateKeysAndObjectsUsingBlock:^(NSString *key, NSRelationshipDescription *rel, BOOL *stop) {
            if (rel.isToMany) {
                NSSet *srcObjects = [src valueForKey:key];
                NSMutableSet *destObjects = [NSMutableSet setWithCapacity:srcObjects.count];
                for (NSManagedObject *srcObject in srcObjects) {
                    NSManagedObject *destObject = [self managedObjectWithUnfaultedDataFromObject:srcObject mapping:mapping withError:&error];
                    if (destObject) {
                        [destObjects addObject:destObject];
                    } else if (error) {
                        *stop = YES;
                    }
                }
                [dest setValue:destObjects forKey:key];
            } else {
                NSManagedObject *srcObject = [src valueForKey:key];
                NSManagedObject *destObject = [self managedObjectWithUnfaultedDataFromObject:srcObject mapping:mapping withError:&error];
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
