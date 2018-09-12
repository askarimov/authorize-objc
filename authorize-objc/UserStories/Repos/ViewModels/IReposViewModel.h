//
//  IReposViewModel.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IRepoCellPrototype.h"

@protocol IReposViewModel <NSObject>

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (void)fetchRepos;

- (id<RepoCellDisplayable>)modelAtIndexPath:(NSIndexPath *)indexPath;

@end

@protocol IReposViewModelDelegate <NSObject>

- (void)reposViewModelDidFinishLoading;

@end
