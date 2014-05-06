// MRTravisClient.m

#import "MRTravisClient.h"

#import "TTTDateTransformers.h"
#import "NSError+ErrorKit.h"
#import "NSDictionary+JSONValues.h"
#import "NSMutableDictionary+JSONValues.h"


@implementation MRTravisClient

+ (instancetype)sharedClient
{
    static id _sharedClient;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *const URL = [NSURL URLWithString:@"https://api.travis-ci.org"];
        _sharedClient = [[self alloc] initWithBaseURL:URL];
    });
    return _sharedClient;
}

- (instancetype)initWithBaseURL:(NSURL *const)URL
{
    self = [super initWithBaseURL:URL];
    if (self) {
        [self registerHTTPOperationClass:AFJSONRequestOperation.class];
        [self setDefaultHeader:@"Accept" value:@"application/json"];
    }
    return self;
}

#pragma mark - AFIncrementalStore

- (NSURLRequest *)requestForFetchRequest:(NSFetchRequest *const)fetchRequest
                             withContext:(NSManagedObjectContext *const)context
{
    NSMutableURLRequest *const mutableURLRequest = [super requestForFetchRequest:fetchRequest withContext:context];
    NSComparisonPredicate *const predicate = (NSComparisonPredicate *)fetchRequest.predicate;
    NSString *const identifier = predicate.rightExpression.constantValue;
    if (identifier) {
        NSURL *const URL = mutableURLRequest.URL;
        mutableURLRequest.URL = [URL URLByAppendingPathComponent:identifier];
    }
    return mutableURLRequest;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *const)method pathForObjectWithID:(NSManagedObjectID *const)objectID withContext:(NSManagedObjectContext *const)context
{
    NSMutableURLRequest *const mutableURLRequest = [super requestWithMethod:method pathForObjectWithID:objectID withContext:context];
    return mutableURLRequest;
}

- (NSDictionary *)attributesForRepresentation:(NSDictionary *const)representation
                                     ofEntity:(NSEntityDescription *const)entity
                                 fromResponse:(NSHTTPURLResponse *const)response
{
    NSMutableDictionary *const mutablePropertyValues = NSMutableDictionary.new;
    if ([entity.name isEqualToString:@"Job"]) {
        NSNumber *const representationId = [representation numberForKey:@"id" withError:NULL];
        NSString *const jobId = representationId.stringValue;
        [mutablePropertyValues setString:jobId forKey:@"jobId" withError:NULL];
        NSString *const number = [representation stringForKey:@"number" withError:NULL];
        [mutablePropertyValues setString:number forKey:@"number" withError:NULL];
        NSString *const state = [representation stringForKey:@"state" withError:NULL];
        [mutablePropertyValues setString:state forKey:@"state" withError:NULL];
        NSString *const queue = [representation stringForKey:@"queue" withError:NULL];
        [mutablePropertyValues setString:queue forKey:@"queue" withError:NULL];
        NSNumber *const allowFailure = [representation numberForKey:@"allow_failure" withError:NULL];
        [mutablePropertyValues setNumber:allowFailure forKey:@"allowFailure" withError:NULL];
        [mutablePropertyValues setValue:NSDate.date forKey:@"local_orderDate"];
    } else if ([entity.name isEqualToString:@"Repository"]) {
        NSNumber *const representationId = [representation numberForKey:@"id" withError:NULL];
        NSString *const repositoryId = representationId.stringValue;
        [mutablePropertyValues setString:repositoryId forKey:@"repositoryId" withError:NULL];
        NSString *const slug = [representation stringForKey:@"slug" withError:NULL];
        [mutablePropertyValues setString:slug forKey:@"slug" withError:NULL];
        NSString *const repositoryDescription = [representation stringForKey:@"description" withError:NULL];
        [mutablePropertyValues setString:repositoryDescription forKey:@"repositoryDescription" withError:NULL];
        NSString *const publicKey = [representation stringForKey:@"public_key" withError:NULL];
        [mutablePropertyValues setString:publicKey forKey:@"publicKey" withError:NULL];
    } else if ([entity.name isEqualToString:@"Build"]) {
        NSNumber *const representationBuildId = [representation numberForKey:@"id" withError:NULL];
        NSString *const buildId = representationBuildId.stringValue;
        [mutablePropertyValues setString:buildId forKey:@"buildId" withError:NULL];
        NSString *const number = [representation stringForKey:@"number" withError:NULL];
        [mutablePropertyValues setString:number forKey:@"number" withError:NULL];
        NSString *const status = [representation stringForKey:@"status" withError:NULL];
        [mutablePropertyValues setString:status forKey:@"status" withError:NULL];
        NSString *const result = [representation stringForKey:@"result" withError:NULL];
        [mutablePropertyValues setString:result forKey:@"result" withError:NULL];
        NSNumber *const duration = [representation numberForKey:@"duration" withError:NULL];
        [mutablePropertyValues setNumber:duration forKey:@"duration" withError:NULL];
        NSDictionary *const config = [representation dictionaryForKey:@"config" withError:NULL];
        NSString *const language = [config stringForKey:@"language" withError:NULL];
        [mutablePropertyValues setString:language forKey:@"language" withError:NULL];
        NSString *const startedAt = [representation stringForKey:@"started_at" withError:NULL];
        [mutablePropertyValues setString:startedAt forKey:@"startedAt" withError:NULL];
        NSString *const finishedAt = [representation stringForKey:@"finished_at" withError:NULL];
        [mutablePropertyValues setString:finishedAt forKey:@"finishedAt" withError:NULL];
    }
    return mutablePropertyValues;
}

- (NSDictionary *)representationsForRelationshipsFromRepresentation:(NSDictionary *)representation ofEntity:(NSEntityDescription *)entity fromResponse:(NSHTTPURLResponse *)response
{
    NSMutableDictionary *mutableRepresentations = [[super attributesForRepresentation:representation ofEntity:entity fromResponse:response] mutableCopy];
    if ([entity.name isEqualToString:@"Job"]) {
        NSMutableDictionary *const repository = NSMutableDictionary.new;
        NSNumber *const repositoryId = [representation numberForKey:@"repository_id" withError:NULL];
        [repository setNumber:repositoryId forKey:@"id" withError:NULL];
        if (repository.count > 0) {
            mutableRepresentations = [[super attributesForRepresentation:representation ofEntity:entity fromResponse:response] mutableCopy];
            [mutableRepresentations setDictionary:repository forKey:@"repository" withError:NULL];
        }
    } else if ([entity.name isEqualToString:@"Repository"]) {
        NSMutableDictionary *const build = NSMutableDictionary.new;
        NSNumber *const lastBuildId = [representation numberForKey:@"last_build_id" withError:NULL];
        [build setNumber:lastBuildId forKey:@"id" withError:NULL];
        NSString *const number = [representation stringForKey:@"last_build_number" withError:NULL];
        [build setString:number forKey:@"number" withError:NULL];
        NSString *const status = [representation stringForKey:@"last_build_status" withError:NULL];
        [build setString:status forKey:@"status" withError:NULL];
        NSString *const result = [representation stringForKey:@"last_build_result" withError:NULL];
        [build setString:result forKey:@"result" withError:NULL];
        NSNumber *const duration = [representation numberForKey:@"last_build_duration" withError:NULL];
        [build setNumber:duration forKey:@"duration" withError:NULL];
        NSString *const language = [representation stringForKey:@"last_build_language" withError:NULL];
        NSMutableDictionary *const config = NSMutableDictionary.dictionary;
        if ([config setString:language forKey:@"language" withError:NULL]) {
            [build setDictionary:config forKey:@"config" withError:NULL];
        }
        NSString *const startedAt = [representation stringForKey:@"last_build_started_at" withError:NULL];
        [build setString:startedAt forKey:@"started_at" withError:NULL];
        NSString *const finishedAt = [representation stringForKey:@"last_build_finished_at" withError:NULL];
        [build setString:finishedAt forKey:@"finished_at" withError:NULL];
        if (build.count > 0) {
            mutableRepresentations = [[super attributesForRepresentation:representation ofEntity:entity fromResponse:response] mutableCopy];
            [mutableRepresentations setDictionary:build forKey:@"lastBuild" withError:NULL];
        }
    } else if ([entity.name isEqualToString:@"Build"]) {
        NSMutableDictionary *const repository = NSMutableDictionary.new;
        NSNumber *const repositoryId = [representation numberForKey:@"repository_id" withError:NULL];
        [repository setNumber:repositoryId forKey:@"id" withError:NULL];
        if (repository.count > 0) {
            mutableRepresentations = [[super attributesForRepresentation:representation ofEntity:entity fromResponse:response] mutableCopy];
            [mutableRepresentations setDictionary:repository forKey:@"repository" withError:NULL];
        }
    }

    return mutableRepresentations;
}

- (BOOL)shouldFetchRemoteAttributeValuesForObjectWithID:(NSManagedObjectID *const)objectID
                                 inManagedObjectContext:(NSManagedObjectContext *const)context
{
        return NO;
}

- (BOOL)shouldFetchRemoteValuesForRelationship:(NSRelationshipDescription *const)relationship
                               forObjectWithID:(NSManagedObjectID *const)objectID
                        inManagedObjectContext:(NSManagedObjectContext *const)context
{
    return NO;
}

@end
