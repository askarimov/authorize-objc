//
//  ReposServiceDebugImpl.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "ReposServiceDebugImpl.h"
#import "AKRepo.h"

@implementation ReposServiceDebugImpl

- (void)getReposWithCompletion:(void (^)(NSArray *, NSError *))completion {

    AKRepo *repo1 = [AKRepo repoWithName:@"Awesome Repo"];

    AKRepo *repo2 = [AKRepo repoWithName:@"Another Repo"];

    AKRepo *repo3 = [AKRepo repoWithName:@"Cool Repo"];

    completion(@[repo1, repo2, repo3], nil);

}

@end
