// MRTravisIcrementalStoreTests.m

#import <XCTest/XCTest.h>
#import "MRTravisIncrementalStore.h"
#import "MRTravisClient.h"


@interface MRTravisIcrementalStoreTests : XCTestCase
@end


@implementation MRTravisIcrementalStoreTests

- (void)testTypeIsCorrect
{
    MRTravisIncrementalStore *const store = [[MRTravisIncrementalStore alloc] init];
    NSString *const type = store.type;
    XCTAssertEqualObjects(type, @"MRTravisIncrementalStore");
}

- (void)testModelKindIsCorrect
{
    NSManagedObjectModel *const model = MRTravisIncrementalStore.model;
    XCTAssertTrue([model isKindOfClass:NSManagedObjectModel.class]);
}

- (void)testHTTPClientKindIsCorrect
{
    MRTravisIncrementalStore *const store = [[MRTravisIncrementalStore alloc] init];
    MRTravisClient *const client = (MRTravisClient *)store.HTTPClient;
    XCTAssertTrue([client isKindOfClass:MRTravisClient.class]);
}

@end
