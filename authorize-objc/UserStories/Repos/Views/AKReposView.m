//
//  ReposView.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKReposView.h"
#import <Masonry/Masonry.h>

@interface AKReposView()<UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation AKReposView

- (instancetype)initWithDelegate:(id<IReposViewDelegate>)delegate {

    self = [super init];

    if (self) {
        self.delegate = delegate;
    }
    return self;
}

- (void)initialize {

    [self addSubviews];

    [self addConstraints];

}

- (void)addSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self addSubview:self.tableView];

    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.tableView addSubview:self.refreshControl];
}

- (void)addConstraints {

    UIView *superview = self;

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superview);
    }];
}

- (void)setCellPrototype:(id<IRepoCellPrototype>)cellPrototype {
    _cellPrototype = cellPrototype;
    [self.tableView registerClass:[cellPrototype cellClass] forCellReuseIdentifier:[cellPrototype reuseIdentifier]];
}

#pragma mark - ILoginView

- (UIView *)view {
    return self;
}

- (void)onViewDidLoad {

    [self.refreshControl beginRefreshing];

    [self.viewModel fetchRepos];
}

#pragma mark - IReposViewModelDelegate

- (void)reposViewModelDidFinishLoading {

    [self.refreshControl endRefreshing];

    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    id <IRepoCellPrototype> prototype = [tableView dequeueReusableCellWithIdentifier:_cellPrototype.reuseIdentifier];
    [prototype configure: [self.viewModel modelAtIndexPath:indexPath]];
    return prototype.cell;
}

@end
