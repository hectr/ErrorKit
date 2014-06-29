// MRViewController.m
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

#import "MRViewController.h"
#import "MRAppDelegate.h"


// -----------------------------------------------------------------------------

// http://www.lifesmith.com/comnames.html

static NSString *const __surnames[] =
    { @"Smith",    @"Johnson",  @"Williams", @"Jones",    @"Brown"
    , @"Davis",    @"Miller",   @"Wilson",   @"Moore",    @"Taylor"
    , @"Anderson", @"Thomas",   @"Jackson",  @"White",    @"Harris"
    , @"Martin",   @"Thompson", @"Garcia",   @"Martinez", @"Robinson" };

static NSString *const __names[] =
    { @"Mary",   @"John",     @"Robert",  @"Patricia", @"Michael"
    , @"Linda",  @"James",    @"Barbara", @"William",  @"Elisabeth"
    , @"David",  @"Jennifer", @"Richard", @"Maria",    @"Charles"
    , @"Joseph", @"Susan",    @"Thomas",  @"Margaret", @"Dorothy" };

static NSString *const __letters[] =
    { @"A", @"B", @"C", @"D", @"E"
    , @"F", @"G", @"H", @"I", @"J"
    , @"K", @"L", @"M", @"N", @"O"
    , @"P", @"Q", @"R", @"S", @"T"
    , @"U", @"V", @"W", @"X", @"Y"
    , @"Z" };

// -----------------------------------------------------------------------------


@implementation MRViewController

// Returns the managed object context stored in _managedObjectContext.
// If there isn't any stored moc, this method gets a new one.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext == nil) {
        self.resultsController.delegate = nil;
        self.resultsController = nil;
        MRAppDelegate *const appDelegate = UIApplication.sharedApplication.delegate;
        NSError *error = nil;
        _managedObjectContext = [appDelegate managedObjectContextWithError:&error];
        [self presentError:error];
    }
    return _managedObjectContext;
}

// This method sets up the fetched results controller and reloads the table view.
- (void)fillData
{
    if (self.managedObjectContext) {
        NSFetchRequest *const request = [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
        NSSortDescriptor *const descriptor = [[NSSortDescriptor alloc] initWithKey:@"firstName" ascending:YES];
        [request setSortDescriptors:@[ descriptor ]];
        self.resultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                     managedObjectContext:self.managedObjectContext
                                                                       sectionNameKeyPath:nil
                                                                                cacheName:nil];
        self.resultsController.delegate = self;
        NSError *error = nil;
        [self.resultsController performFetch:&error];
        [self presentError:error];
    }
    [self.tableView reloadData];
}

#pragma mark Notifications

// Notification received when the persistent store coordinator of the Core Data stack has been unset.
- (void)didUnsetPersistentStoreCoordinator:(NSNotification *const)n
{
    _managedObjectContext = nil;
    [self fillData];
}

#pragma mark - IBAction methods

// Removes the persistent store in use by the Core Data stack.
- (IBAction)removePersistentStoreAction:(id const)sender
{
    MRAppDelegate *const appDelegate = UIApplication.sharedApplication.delegate;
    NSError *error = nil;
    NSFileManager *const defaultManager = NSFileManager.defaultManager;
    NSURL *const storeURL = appDelegate.storeURL;
    [defaultManager removeItemAtURL:storeURL error:&error];
    [self presentError:error];
}

// Shows the action sheet.
- (IBAction)changeStoreAction:(id)sender
{
    UIActionSheet *const actionSheet =
    [[UIActionSheet alloc] initWithTitle:NSLocalizedString(@"Select which persistent store do you want to use:", nil)
                                delegate:self
                       cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                  destructiveButtonTitle:NSLocalizedString(@"Unset persistent store URL", nil)
                       otherButtonTitles:NSLocalizedString(@"Compatible store", nil)
                                       , NSLocalizedString(@"Incompatible store", nil)
                                       , nil];
    [actionSheet showInView:self.view];
}

// Adds a new Employee object. 
- (IBAction)addEmployeeAction:(id const)sender
{
    NSManagedObjectContext *const moc = self.managedObjectContext;
    if (moc == nil) {
        NSLog(@"nil context");
        return;
    }
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Company" inManagedObjectContext:moc];
    NSManagedObject *const company = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    [company setValue:[NSString stringWithFormat:@"%@.%@."
                                                , __letters[arc4random() % sizeof(__letters)/4]
                                                , __letters[arc4random() % sizeof(__letters)/4]]
                                          forKey:@"name"];
    entity = [NSEntityDescription entityForName:@"Project" inManagedObjectContext:moc];
    NSManagedObject *const project = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    [project setValue:[NSString stringWithFormat:@"%@%d"
                                                , __letters[arc4random() % sizeof(__letters)/4]
                                                , arc4random()%10]
                                          forKey:@"name"];
    [project setValue:company forKey:@"company"];
    entity = [NSEntityDescription entityForName:@"Employee" inManagedObjectContext:moc];
    NSManagedObject *const employee = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:moc];
    [employee setValue:__names[arc4random()%sizeof(__names)/4] forKey:@"firstName"];
    [employee setValue:__surnames[arc4random()%sizeof(__surnames)/4] forKey:@"lastName"];
    [employee setValue:@(10000 + arc4random() % 490001) forKey:@"salary"];
    [employee setValue:company forKey:@"company"];
    [employee setValue:@(arc4random()%999) forKey:@"extension"];
}

- (IBAction)deleteSelectedObjectAction:(id const)sender
{
    UITableView *const tableView = self.tableView;
    NSIndexPath *const indexPath = tableView.indexPathForSelectedRow;
    NSManagedObject *const object = [self.resultsController objectAtIndexPath:indexPath];
    if (object) {
        [self.managedObjectContext deleteObject:object];
    } else {
        NSLog(@"nil object");
    }
}


#pragma mark - UIActionSheetDelegate methods

// Delegate method of the action sheet presented by the 'Change persistent store' button.
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIApplication *const sharedApplication = UIApplication.sharedApplication;
    MRAppDelegate *const appDelegate = sharedApplication.delegate;
    if (actionSheet.cancelButtonIndex == buttonIndex) {
        return;
    } else if (actionSheet.destructiveButtonIndex == buttonIndex) {
        appDelegate.storeURL = nil;
        [appDelegate unsetPersistentStoreCoordinator];
    } else if (actionSheet.destructiveButtonIndex + 1 == buttonIndex) {
        appDelegate.automaticStoreMigration = NO;
        NSBundle *const mainBundle = NSBundle.mainBundle;
        NSURL *const src = [mainBundle URLForResource:@"CoreData-Example_v02" withExtension:@"sqlite"];
        NSFileManager *const defaultManager = NSFileManager.defaultManager;
        NSURL *const storeURL = appDelegate.storeURL;
        [defaultManager removeItemAtURL:storeURL error:nil];
        NSError *error = nil;
        [defaultManager copyItemAtURL:src toURL:storeURL error:&error];
        if (error) {
            [self presentError:error];
        } else {
            [appDelegate unsetPersistentStoreCoordinator];
        }
    } else if (actionSheet.destructiveButtonIndex + 2 == buttonIndex) {
        NSBundle *const mainBundle = NSBundle.mainBundle;
        NSURL *const src = [mainBundle URLForResource:@"CoreData-Example_v01" withExtension:@"sqlite"];
        NSFileManager *const defaultManager = NSFileManager.defaultManager;
        NSURL *const storeURL = appDelegate.storeURL;
        [defaultManager removeItemAtURL:storeURL error:nil];
        NSError *error = nil;
        [defaultManager copyItemAtURL:src toURL:storeURL error:&error];
        if (error) {
            [self presentError:error];
        } else {
            [appDelegate unsetPersistentStoreCoordinator];
        }
    }
}

#pragma mark - UITableViewDataSource methods

// Returns the number of objects fetched by the results controller.
- (NSInteger)tableView:(UITableView *const)tableView numberOfRowsInSection:(NSInteger const)section
{
    NSFetchedResultsController *const resultsController = self.resultsController;
    NSArray *const sections = resultsController.sections;
    NSError *error;
    id<NSFetchedResultsSectionInfo> const sectionInfo = [sections objectAtIndex:section withError:&error];
    MRNotErrorAssert(error);
    NSUInteger const numberOfObjects = sectionInfo.numberOfObjects;
    return numberOfObjects;
}

// Returns a cell for the given index path.
- (UITableViewCell *)tableView:(UITableView *const)tableView cellForRowAtIndexPath:(NSIndexPath *const)indexPath
{
    static NSString *const cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    NSManagedObject *const object = [self.resultsController objectAtIndexPath:indexPath];
    NSString *const firstName = [object valueForKey:@"firstName"];
    NSString *const lastName = [object valueForKey:@"lastName"];
    NSString *const fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
    cell.textLabel.text = fullName;
    return cell;
}

#pragma mark - NSFetchedResultsControllerDelegate methods

// Prepares the table view for the updates.
- (void)controllerWillChangeContent:(NSFetchedResultsController *const)controller
{
    UITableView *const tableView = self.tableView;
    [tableView beginUpdates];
}

// Updates the table view content.
- (void)controller:(NSFetchedResultsController *const)controller didChangeObject:(id const)anObject atIndexPath:(NSIndexPath *const)indexPath forChangeType:(NSFetchedResultsChangeType const)type newIndexPath:(NSIndexPath *const)newIndexPath
{
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteRowsAtIndexPaths:@[  indexPath ] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeUpdate: {
            UITableViewCell *const cell = [self.tableView cellForRowAtIndexPath:indexPath];
            NSManagedObject *const object = [self.resultsController objectAtIndexPath:indexPath];
            NSString *const firstName = [object valueForKey:@"firstName"];
            NSString *const lastName = [object valueForKey:@"lastName"];
            NSString *const fullName = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
            cell.textLabel.text = fullName;
        } break;
        case NSFetchedResultsChangeMove:
            [self.tableView deleteRowsAtIndexPaths:@[ indexPath ] withRowAnimation:UITableViewRowAnimationFade];
            [self.tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

// Updates the table view content.
- (void)controller:(NSFetchedResultsController *const)controller didChangeSection:(id const)sectionInfo atIndex:(NSUInteger const)sectionIndex forChangeType:(NSFetchedResultsChangeType const)type
{
    switch(type) {
        case NSFetchedResultsChangeInsert: {
            NSIndexSet *const indexSet = [NSIndexSet indexSetWithIndex:sectionIndex];
            [self.tableView insertSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        } break;
        case NSFetchedResultsChangeDelete: {
            NSIndexSet *const indexSet = [NSIndexSet indexSetWithIndex:sectionIndex];
            [self.tableView deleteSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
        } break;
    }
}

// Finishes the updates.
- (void)controllerDidChangeContent:(NSFetchedResultsController *const)controller
{
    UITableView *const tableView = self.tableView;
    [tableView endUpdates];
}

#pragma mark - UIViewController methods

// Prepares the view.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(didUnsetPersistentStoreCoordinator:)
                                               name:@"DidUnsetPersistentStoreCoordinator"
                                             object:UIApplication.sharedApplication.delegate];
    [self fillData];
}

// Cleanup.
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.resultsController.delegate = nil;
    self.resultsController = nil;
    [NSNotificationCenter.defaultCenter removeObserver:self
                                                  name:@"DidUnsetPersistentStoreCoordinator"
                                                object:UIApplication.sharedApplication.delegate];
}

#pragma mark - UIResponder methods

// If possible, adds a recovery attempter to the error.
- (NSError *)willPresentError:(NSError *const)error
{
    if (![error.domain isEqualToString:NSCocoaErrorDomain]) {
        return error;
    }
    MRAppDelegate *const appDelegate = UIApplication.sharedApplication.delegate;
    MRErrorBuilder *const builder = [MRErrorBuilder builderWithDomain:error.domain code:error.code];
    if (error.underlyingError) {
        builder.localizedFailureReason = [MRErrorFormatter stringWithDomain:error.underlyingError.domain code:error.underlyingError.code];
        builder.underlyingError = error.underlyingError;
    }
    if (error.code == NSPersistentStoreIncompatibleVersionHashError) {
        [builder addRecoveryOption:NSLocalizedString(@"Migrate data", nil)
                         withBlock:^(NSError *const error) {
                             appDelegate.automaticStoreMigration = YES;
                             [self managedObjectContext];
                             [self fillData];
                         }];
        builder.helpAnchor = NSLocalizedString(@"You can attempt to migrate data to the current version scheme or you can create a new persistent store.", nil);
    }
    if (error.code >= NSPersistentStoreInvalidTypeError && error.code <= NSEntityMigrationPolicyError) {
        [builder addRecoveryOption:NSLocalizedString(@"Create new store", nil)
                         withBlock:^(NSError *const error) {
                             NSBundle *const mainBundle = NSBundle.mainBundle;
                             NSManagedObjectContext *const previousContext = _managedObjectContext;
                             NSString *const bundleName = [mainBundle objectForInfoDictionaryKey:@"CFBundleName"];
                             NSDate *const date = NSDate.date;
                             NSInteger const interval = date.timeIntervalSinceReferenceDate;
                             NSString *const storeName = [[bundleName stringByAppendingString:@(interval).stringValue] stringByAppendingPathExtension:@"sqlite"];
                             NSURL *const applicationDocumentsDirectory = appDelegate.applicationDocumentsDirectory;
                             appDelegate.storeURL = [applicationDocumentsDirectory URLByAppendingPathComponent:storeName];
                             NSUserDefaults *const standardUserDefaults = NSUserDefaults.standardUserDefaults;
                             [standardUserDefaults setObject:storeName forKey:@"MRPersistentStoreName"];
                             [appDelegate unsetPersistentStoreCoordinator];
                             NSMutableDictionary *const mapping = NSMutableDictionary.dictionary;
                             NSSet *const insertedObjects = previousContext.insertedObjects;
                             [insertedObjects enumerateObjectsUsingBlock:^(NSManagedObject *const src, BOOL *const stop) {
                                 NSError *error = nil;
                                 [appDelegate managedObjectWithUnfaultedDataFromObject:src mapping:mapping withError:&error];
                                 if (error) {
                                     *stop = YES;
                                 }
                             }];
                             NSSet *const updatedObjects = previousContext.updatedObjects;
                             [updatedObjects enumerateObjectsUsingBlock:^(NSManagedObject *const src, BOOL *const stop) {
                                 NSError *error = nil;
                                 [appDelegate managedObjectWithUnfaultedDataFromObject:src mapping:mapping withError:&error];
                                 if (error) {
                                     *stop = YES;
                                 }
                             }];
                         }];
        builder.helpAnchor = ([builder.helpAnchor stringByAppendingString:@"\n\n"] ?: @"");
        builder.helpAnchor = [builder.helpAnchor stringByAppendingString:NSLocalizedString(@"By creating a new store you will lose all previously persited data.", nil)];
    }
    NSError *const customizedError = builder.error;
    return customizedError;
}

#pragma mark NSObject methods

// Cleanup.
- (void)dealloc
{
    NSNotificationCenter *const defaultCenter = NSNotificationCenter.defaultCenter;
    [defaultCenter removeObserver:self
                             name:@"DidUnsetPersistentStoreCoordinator"
                           object:UIApplication.sharedApplication.delegate];
}

@end
