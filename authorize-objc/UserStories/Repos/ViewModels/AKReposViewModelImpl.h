//
//  AKReposViewModelImpl.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IReposViewModel.h"
#import "IReposService.h"

@interface AKReposViewModelImpl : NSObject <IReposViewModel>

@property (nonatomic, strong) NSArray *models;
@property (nonatomic, strong) id <IReposService> reposService;
@property (nonatomic, weak) id <IReposViewModelDelegate> delegate;

- (instancetype)initWithReposService:(id<IReposService>)reposService;

- (id<RepoCellDisplayable>)modelAtIndexPath:(NSIndexPath *)indexPath;

@end
