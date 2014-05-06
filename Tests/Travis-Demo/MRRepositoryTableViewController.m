// MRRepositoryTableViewController.m

#import "MRRepositoryTableViewController.h"

#import "ErrorKit_Default.h"
#import "MRTravisAppDelegate.h"


@interface MRRepositoryTableViewController ()
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSError *currentError;
@property (nonatomic, strong) NSArray *repositoryAttributes;
@property (nonatomic, strong) NSArray *buildAttributes;
@end


@implementation MRRepositoryTableViewController

- (NSManagedObject *)repository
{
    NSManagedObjectContext *const moc = [MRTravisAppDelegate.sharedDelegate managedObjectContextWithError:NULL];
    NSManagedObject *const repository = [moc objectRegisteredForID:self.repositoryOID];
    return repository;
}

- (void)presentError
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:_cmd object:nil];
    [self presentError:self.currentError];
}

#pragma mark SetUp

- (void)setTitle
{
    NSManagedObject *const repository = self.repository;
    NSString *const repositoryId = [repository valueForKey:@"repositoryId"];
    self.title = [NSString stringWithFormat:@"/repository/%@", repositoryId];
}

- (void)setFetchedResultsController
{
    NSManagedObject *const repository = self.repository;
    NSString *const repositoryId = [repository valueForKey:@"repositoryId"];

    NSManagedObjectModel *const model = MRTravisAppDelegate.sharedDelegate.managedObjectModel;
    NSDictionary *const substitutionVariables = @{ @"REPOSITORY_ID": (repositoryId ?: NSNull.null) };
    NSFetchRequest *const fetchRequest =
    [model fetchRequestFromTemplateWithName:@"Repository"
                      substitutionVariables:substitutionVariables];
    NSSortDescriptor *const sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"repositoryId" ascending:NO];
    fetchRequest.sortDescriptors = @[ sortDescriptor ];
    
    NSError *error;
    NSManagedObjectContext *const moc = [MRTravisAppDelegate.sharedDelegate managedObjectContextWithError:&error];
    if (error) {
        self.currentError = error;
        [self performSelector:@selector(presentError) withObject:nil afterDelay:0.1];
    }
    _fetchedResultsController =
    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                        managedObjectContext:moc
                                          sectionNameKeyPath:nil
                                                   cacheName:self.title];
    _fetchedResultsController.delegate = self;
}

- (void)setRefetchBarButton
{
    self.navigationItem.rightBarButtonItem =
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                  target:self
                                                  action:@selector(refetchData)];
}

#pragma mark Actions

- (void)refetchData
{
    if (NSThread.isMainThread) {
        NSError *error;
        [_fetchedResultsController performFetch:&error];
        if (error) {
            self.currentError = error;
            [self performSelector:@selector(presentError) withObject:nil afterDelay:0.1];
        }
    } else {
        [self performSelectorOnMainThread:_cmd
                               withObject:nil
                            waitUntilDone:YES];
    }
}

#pragma mark Accessors

- (NSArray *)repositoryAttributes
{
    if (_repositoryAttributes == nil) {
        NSManagedObject *const repository = self.repository;
        NSEntityDescription *const entity = repository.entity;
        NSDictionary *const attributesByName = entity.attributesByName;
        NSArray *const names = attributesByName.allKeys;
        _repositoryAttributes = names;
    }
    return _repositoryAttributes;
}

- (NSArray *)buildAttributes
{
    if (_buildAttributes == nil) {
        NSManagedObject *const repository = self.repository;
        NSManagedObject *const build = [repository valueForKey:@"lastBuild"];
        NSEntityDescription *const entity = build.entity;
        NSDictionary *const attributesByName = entity.attributesByName;
        NSArray *const names = attributesByName.allKeys;
        _buildAttributes = names;
    }
    return _buildAttributes;
}

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *const)controller
{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *const)tableView
{
    NSUInteger count;
    NSManagedObject *const repository = self.repository;
    if ([repository valueForKey:@"lastBuild"]) {
        count = 2;
    } else if (repository) {
        count = 1;
    } else {
        count = 0;
    }
    return count;
}

- (NSInteger)tableView:(UITableView *const)tableView numberOfRowsInSection:(NSInteger const)section
{
    NSUInteger count;
    if (section == 0) {
        NSArray *const repositoryAttributes = self.repositoryAttributes;
        count = repositoryAttributes.count;
    } else if (section == 1) {
        NSArray *const buildAttributes = self.buildAttributes;
        count = buildAttributes.count;
    } else {
        count = 0;
    }
    return count;
}

- (UITableViewCell *)tableView:(UITableView *const)tableView cellForRowAtIndexPath:(NSIndexPath *const)indexPath
{
    NSString *const reuseIdentifier = NSStringFromClass(UITableViewCell.class);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1
                                      reuseIdentifier:reuseIdentifier];
    }
    NSString *attribute;
    id value;
    if (indexPath.section == 0) {
        NSArray *const repositoryAttributes = self.repositoryAttributes;
        NSManagedObject *const repository = self.repository;
        attribute = repositoryAttributes[indexPath.row];
        value = [repository valueForKey:attribute];
    } else if (indexPath.section == 1) {
        NSArray *const buildAttributes = self.buildAttributes;
        NSManagedObject *const repository = self.repository;
        NSManagedObject *const build = [repository valueForKey:@"lastBuild"];
        attribute = buildAttributes[indexPath.row];
        value = [build valueForKey:attribute];
    }
    cell.textLabel.text = attribute;
    cell.detailTextLabel.text = [value description];
    return cell;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setTitle];
    [self setFetchedResultsController];
    [self setRefetchBarButton];
    
    [self refetchData];
}

@end
