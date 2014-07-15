// MRJobsTableViewController.m

#import "MRJobsTableViewController.h"

#import "UIImageView+AFNetworking.h"
#import "MRRepositoryTableViewController.h"
#import "MRTravisAppDelegate.h"


@interface MRJobsTableViewController () <NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSError *currentError;
@end


@implementation MRJobsTableViewController

- (void)presentError
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:_cmd object:nil];
    [self presentError:self.currentError];
}

#pragma mark Set up

- (void)setTitle
{
    self.title = NSLocalizedString(@"/jobs", nil);
}

- (void)setFetchedResultsController
{
    NSFetchRequest *const fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Job"];
    NSSortDescriptor *const sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"local_orderDate" ascending:NO];
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
                                                   cacheName:@"Jobs"];
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

#pragma mark - NSFetchedResultsControllerDelegate

- (void)controllerDidChangeContent:(NSFetchedResultsController *const)controller
{
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *const)tableView heightForRowAtIndexPath:(NSIndexPath *const)indexPath
{
    return 88.0f;
}

- (void)tableView:(UITableView *const)tableView didSelectRowAtIndexPath:(NSIndexPath *const)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSError *error;
    NSManagedObject *const job = [_fetchedResultsController objectAtIndexPath:indexPath withError:&error];
    MRNotErrorAssert(error);
    NSManagedObject *const repository = [job valueForKey:@"repository"];
    MRRepositoryTableViewController *const vc =
    [[MRRepositoryTableViewController alloc] init];
    vc.repositoryOID = repository.objectID;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *const)tableView
{
    NSArray *const sections = _fetchedResultsController.sections;
    return sections.count;
}

- (NSInteger)tableView:(UITableView *const)tableView numberOfRowsInSection:(NSInteger const)section
{
    NSArray *sections = _fetchedResultsController.sections;
    NSError *error;
    id <NSFetchedResultsSectionInfo>const sectionInfo =
    [sections objectAtIndex:section withError:&error];
    if (error) {
        self.currentError = error;
        [self performSelector:@selector(presentError) withObject:nil afterDelay:0.1];
    }
    NSInteger const numberOfObjects = sectionInfo.numberOfObjects;
    return numberOfObjects;
}

- (UITableViewCell *)tableView:(UITableView *const)tableView cellForRowAtIndexPath:(NSIndexPath *const)indexPath
{
    NSString *const reuseIdentifier = NSStringFromClass(UITableViewCell.class);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier];
        cell.textLabel.numberOfLines = 3;
        cell.detailTextLabel.numberOfLines = 3;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    NSError *error;
    NSManagedObject *const job = [_fetchedResultsController objectAtIndexPath:indexPath withError:&error];
    MRNotErrorAssert(error);
    cell.textLabel.text = [NSString stringWithFormat:@"id:\t\t%@\nstate:\t%@\nqueue:\t%@", [job valueForKey:@"jobId"], [job valueForKey:@"state"], [job valueForKey:@"queue"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"repository: \n%@\n", [job valueForKeyPath:@"repository.repositoryId"]];
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

#pragma mark - NSObject

- (void)dealloc
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

@end
