//
//  ReposView.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "BaseView.h"
#import "IReposView.h"
#import "IReposViewDelegate.h"
#import "IReposViewModel.h"
#import "IRepoCellPrototype.h"

@interface AKReposView : BaseView <IReposView, IReposViewModelDelegate>

@property (nonatomic, strong) id <IReposViewDelegate> delegate; // view output
@property (nonatomic, strong) id <IReposViewModel> viewModel;
@property (nonatomic, strong) id <IRepoCellPrototype> cellPrototype;

- (instancetype)initWithDelegate:(id<IReposViewDelegate>)delegate;

@end
