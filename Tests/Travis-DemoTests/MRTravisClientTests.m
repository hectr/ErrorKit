// MRTravisClientTests.m

#import <XCTest/XCTest.h>
#import "MRTravisClient.h"
#import "MRTravisAppDelegate.h"


@interface MRTravisClient (Tests)
- (NSArray *)registeredHTTPOperationClassNames;
@end


@interface MRTravisClientTests : XCTestCase
@property (nonatomic, strong) NSURL *exampleURL;
@property (nonatomic, strong) MRTravisClient *exampleClient;
@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSEntityDescription *jobEntity;
@property (nonatomic, strong) NSEntityDescription *repositoryEntity;
@property (nonatomic, strong) NSEntityDescription *buildEntity;
@property (nonatomic, strong) NSDictionary *jobRepresentation;
@property (nonatomic, strong) NSDictionary *repositoryRepresentation;
@property (nonatomic, strong) NSDictionary *buildRepresentation;
@end


@implementation MRTravisClientTests

- (void)setUp
{
    [super setUp];
    self.exampleURL = [NSURL URLWithString:@"http://www.example.org/"];
    self.exampleClient = [[MRTravisClient alloc] initWithBaseURL:self.exampleURL];
    MRTravisAppDelegate *const appDelegate = MRTravisAppDelegate.new;
    NSManagedObjectContext *const moc = [appDelegate managedObjectContextWithError:NULL];
    self.managedObjectContext = moc;
    self.jobEntity = [NSEntityDescription entityForName:@"Job" inManagedObjectContext:moc];
    self.repositoryEntity = [NSEntityDescription entityForName:@"Repository" inManagedObjectContext:moc];
    self.buildEntity = [NSEntityDescription entityForName:@"Build" inManagedObjectContext:moc];
    NSString *const jobString = @"{\"id\":22629720,\"repository_id\":5868,\"number\":\"7625.6\",\"state\":\"created\",\"queue\":\"builds.linux\",\"allow_failure\":false}";
    NSData *const jobData = [jobString dataUsingEncoding:NSUTF8StringEncoding];
    self.jobRepresentation = [NSJSONSerialization JSONObjectWithData:jobData options:0 error:NULL];
    NSString *const repositoryString =
    @"{"
        @"\"id\":1234567890,"
        @"\"slug\":\"Lorem\","
        @"\"description\":\"Lorem ipsum\","
        @"\"public_key\":\"-----BEGIN RSA PUBLIC KEY-----\\nMIGJAoGBAMhlEUkSaX8P4tsn1ZFEBZGHPeOOCUfAKF+8N5BTjVzC+3XoLlrjfDMk\\nXK7QUWiPwhXM4uNo+RPJWWXW/sKpBVXUwcBFUExQ1XeXDKIK0VLT7EPBo5s0Cqom\\nLoWvb4Ws+eWXwuxhk5ikaXF9spvDNn1tQWwnhHHgSNe0ZXmJRodBAgMBAAE=\\n-----END RSA PUBLIC KEY-----\\n\","
        @"\"last_build_id\":234567890,"
        @"\"last_build_number\":\"34567890\","
        @"\"last_build_status\":null,"
        @"\"last_build_result\":null,"
        @"\"last_build_duration\":null,"
        @"\"last_build_language\":null,"
        @"\"last_build_started_at\":\"2014-04-09T18:07:14Z\","
        @"\"last_build_finished_at\":null"
    @"}";
    NSData *const repositoryData = [repositoryString dataUsingEncoding:NSUTF8StringEncoding];
    self.repositoryRepresentation = [NSJSONSerialization JSONObjectWithData:repositoryData options:0 error:NULL];
    NSString *const buildString =
    @"{"
        @"\"id\":22623708,"
        @"\"repository_id\":1111,"
        @"\"number\":\"3336\","
        @"\"config\": { \"language\":\"ruby\" },"
        @"\"state\":\"finished\","
        @"\"result\":\"<result>\","
        @"\"status\":\"<status>\","
        @"\"started_at\":\"2014-04-09T18:36:08Z\","
        @"\"finished_at\":\"2014-04-09T19:03:61Z\","
        @"\"duration\":2020,"
        @"\"commit\":\"d2227c7714913b50c9cbf50560e6dabc5a590f5c\","
        @"\"branch\":\"master\","
        @"\"message\":\"Lorem ipsum dolor\","
        @"\"committed_at\":\"2014-04-09T17:41:50Z\","
        @"\"author_name\":\"gdub22\","
        @"\"author_email\":\"email@example.org\","
        @"\"committer_name\":\"aaa\","
        @"\"committer_email\":\"comitter@example.org\","
        @"\"compare_url\":\"http://www.example.org\","
        @"\"event_type\":\"pull_request\""
    @"}";
    NSData *const buildData = [buildString dataUsingEncoding:NSUTF8StringEncoding];
    self.buildRepresentation = [NSJSONSerialization JSONObjectWithData:buildData options:0 error:NULL];
}

- (void)tearDown
{
    self.exampleURL = nil;
    self.exampleClient = nil;
    self.managedObjectContext = nil;
    self.jobEntity = nil;
    self.repositoryEntity = nil;
    self.buildEntity = nil;
    self.jobRepresentation = nil;
    self.repositoryRepresentation = nil;
    self.buildRepresentation = nil;
    [super tearDown];
}

- (void)testSharedClientDoesNotChange
{
    MRTravisClient *const sharedClient0 = MRTravisClient.sharedClient;
    __block MRTravisClient * sharedClient1;
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        sharedClient1 = MRTravisClient.sharedClient;
    });
    XCTAssertEqualObjects(sharedClient0, sharedClient1);
}

- (void)testInitWithBaseURL
{
    NSURL *const URL = self.exampleURL;
    MRTravisClient *const client = self.exampleClient;
    XCTAssertEqualObjects(client.baseURL.absoluteString, URL.absoluteString);
}

- (void)testRegisteredOperation
{
    MRTravisClient *const client = self.exampleClient;
    NSArray *const registeredHTTPOperationClassNames = client.registeredHTTPOperationClassNames;
    XCTAssertTrue([registeredHTTPOperationClassNames containsObject:@"AFJSONRequestOperation"]);
}

- (void)testAcceptHeader
{
    MRTravisClient *const client = self.exampleClient;
    NSString *const accept = [client defaultValueForHeader:@"Accept"];
    XCTAssertEqualObjects(accept, @"application/json");
}

#pragma mark - AFIncrementalStore

- (void)testRequestForFetchRequest
{
    MRTravisClient *const client = self.exampleClient;
    NSManagedObjectContext *const moc = self.managedObjectContext;
    NSFetchRequest *const fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:@"Build" inManagedObjectContext:moc];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"buildId == '1'"];
    NSURLRequest *const request = [client requestForFetchRequest:fetchRequest withContext:moc];
    NSURL *const URL = [NSURL URLWithString:@"http://www.example.org/builds/1"];
    XCTAssertEqualObjects(request.URL, URL);
}

- (void)testRequestWithMethod
{
    MRTravisClient *const client = self.exampleClient;
    NSMutableURLRequest *request = [client requestWithMethod:@"GET" path:@"repositories" parameters:nil];
    NSURL *const URL = [NSURL URLWithString:@"http://www.example.org/repositories"];
    XCTAssertEqualObjects(request.URL, URL);
}

- (void)testAttributesForRepresentationOfJobJobId
{
    NSDictionary *const representation = self.jobRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.jobEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"jobId"], @"22629720");
}

- (void)testAttributesForRepresentationOfJobNumber
{
    NSDictionary *const representation = self.jobRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.jobEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"number"], @"7625.6");
}

- (void)testAttributesForRepresentationOfJobState
{
    NSDictionary *const representation = self.jobRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.jobEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"number"], @"7625.6");
}

- (void)testAttributesForRepresentationOfJobQueue
{
    NSDictionary *const representation = self.jobRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.jobEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"queue"], @"builds.linux");
}

- (void)testAttributesForRepresentationOfJobAllowFailure
{
    NSDictionary *const representation = self.jobRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.jobEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"allowFailure"], @NO);
}

- (void)testAttributesForRepresentationOfRepositoryRepositoryId
{
    NSDictionary *const representation = self.repositoryRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.repositoryEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"repositoryId"], @"1234567890");
}

- (void)testAttributesForRepresentationOfRepositorySlug
{
    NSDictionary *const representation = self.repositoryRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.repositoryEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"slug"], @"Lorem");
}

- (void)testAttributesForRepresentationOfRepositoryDescription
{
    NSDictionary *const representation = self.repositoryRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.repositoryEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"repositoryDescription"], @"Lorem ipsum");
}

- (void)testAttributesForRepresentationOfRepositoryPublicKey
{
    NSDictionary *const representation = self.repositoryRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.repositoryEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"publicKey"], @"-----BEGIN RSA PUBLIC KEY-----\nMIGJAoGBAMhlEUkSaX8P4tsn1ZFEBZGHPeOOCUfAKF+8N5BTjVzC+3XoLlrjfDMk\nXK7QUWiPwhXM4uNo+RPJWWXW/sKpBVXUwcBFUExQ1XeXDKIK0VLT7EPBo5s0Cqom\nLoWvb4Ws+eWXwuxhk5ikaXF9spvDNn1tQWwnhHHgSNe0ZXmJRodBAgMBAAE=\n-----END RSA PUBLIC KEY-----\n");
}

- (void)testAttributesForRepresentationOfBuildBuildId
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"buildId"], @"22623708");
}

- (void)testAttributesForRepresentationOfBuildDuration
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"duration"], @(2020));
}

- (void)testAttributesForRepresentationOfBuildFinishedAt
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"finishedAt"], @"2014-04-09T19:03:61Z");
}

- (void)testAttributesForRepresentationOfBuildLanguage
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"language"], @"ruby");
}

- (void)testAttributesForRepresentationOfBuildNumber
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"number"], @"3336");
}

- (void)testAttributesForRepresentationOfBuildResult
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"result"], @"<result>");
}

- (void)testAttributesForRepresentationOfBuildStartedAt
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"startedAt"], @"2014-04-09T18:36:08Z");
}

- (void)testAttributesForRepresentationOfBuildStatus
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const attributes = [client attributesForRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertEqualObjects(attributes[@"status"], @"<status>");
}

- (void)testRepresentationsForRelationshipFromRepresentationOfJob
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const representations = [client representationsForRelationshipsFromRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertNotNil(representations[@"repository"]);
}

- (void)testRepresentationsForRelationshipFromRepresentationOfRepository
{
    NSDictionary *const representation = self.repositoryRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.repositoryEntity;
    NSDictionary *const representations = [client representationsForRelationshipsFromRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertNotNil(representations[@"lastBuild"]);
}

- (void)testRepresentationsForRelationshipFromRepresentationOfBuild
{
    NSDictionary *const representation = self.buildRepresentation;
    MRTravisClient *const client = self.exampleClient;
    NSEntityDescription *const entity = self.buildEntity;
    NSDictionary *const representations = [client representationsForRelationshipsFromRepresentation:representation ofEntity:entity fromResponse:nil];
    XCTAssertNotNil(representations[@"repository"]);
}

- (void)testShouldFetchRemoteAttributeValuesForObject
{
    MRTravisClient *const client = self.exampleClient;
    XCTAssertFalse([client shouldFetchRemoteAttributeValuesForObjectWithID:nil inManagedObjectContext:nil]);
}

- (void)testShouldFetchRemoteValues
{
    MRTravisClient *const client = self.exampleClient;
    XCTAssertFalse([client shouldFetchRemoteValuesForRelationship:nil forObjectWithID:nil inManagedObjectContext:nil]);
}

@end
