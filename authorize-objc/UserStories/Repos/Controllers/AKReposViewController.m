//
//  AKReposViewController.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKReposViewController.h"
#import "AKReposView.h"
#import "AKReposViewModelImpl.h"
#import "ReposServiceGithubImpl.h"
#import "ReposServiceDebugImpl.h"
#import "AKRepoTableViewCell.h"
#import "AKRepoExtendedTableViewCell.h"

@interface AKReposViewController ()<IReposViewDelegate>

@end

@implementation AKReposViewController

- (void)dealloc {

}

- (void)loadView {

    // set default view if needed
    if (!self.customView) {

        AKReposView *customView = [[AKReposView alloc] initWithDelegate:self];
        id <IReposService> service = [[ReposServiceGithubImpl alloc] init];
//        id <IReposService> service = [[ReposServiceDebugImpl alloc] init];
        AKReposViewModelImpl *viewModel = [[AKReposViewModelImpl alloc] initWithReposService:service];
        viewModel.delegate = customView;
        customView.viewModel = viewModel;
//        customView.cellPrototype = [[AKRepoTableViewCell alloc] init];
        customView.cellPrototype = [[AKRepoExtendedTableViewCell alloc] init];

        self.customView = customView;
    }
    
    self.view = [self.customView view];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"Browse repos";
    
    [self.customView onViewDidLoad];
}

@end
