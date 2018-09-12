//
//  AKReposViewModelImpl.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKReposViewModelImpl.h"
#import "AKRepo.h"
#import "AKRepo+Displayable.h"
#import "NSArray+SafeIndex.h"

@implementation AKReposViewModelImpl

- (instancetype)initWithReposService:(id<IReposService>)reposService {
    self = [super init];
    if (self) {
        self.reposService = reposService;
    }
    return self;
}

- (void)fetchRepos {

    __weak typeof(self) weakSelf = self;

    [self.reposService getReposWithCompletion:^(NSArray *repos, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.models = repos;
            [weakSelf.delegate reposViewModelDidFinishLoading];
        });
    }];
}

#pragma mark - IReposViewModel

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.models.count;
}

- (id<RepoCellDisplayable>)modelAtIndexPath:(NSIndexPath *)indexPath {

    AKRepo *repo = [self.models safeObjectAtIndex:indexPath.row];
    
    return repo;
}


@end
