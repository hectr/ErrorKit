// MRRepositoryTableViewController.h

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


@interface MRRepositoryTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectID *repositoryOID;

@end
