//
//  ReposServiceGithubImpl.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "ReposServiceGithubImpl.h"
#import "AKRepo.h"

@implementation ReposServiceGithubImpl

- (void)getReposWithCompletion:(void (^)(NSArray *, NSError *))completion {
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://api.github.com/repositories?since=1"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSMutableArray *mutable = [[NSMutableArray alloc] init];
        id jsonObj = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if ([jsonObj isKindOfClass:[NSArray class]]) {
            NSArray *repos = (NSArray *)jsonObj;

            for (NSDictionary *repo in repos) {
                [mutable addObject:[AKRepo repoWithName:repo[@"name"] about:repo[@"description"]]];
            }
        }
        completion(mutable.copy, error);
    }];

    [dataTask resume];

}

@end
