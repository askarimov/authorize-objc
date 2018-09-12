//
//  AKMainViewController.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/11/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKMainViewController.h"
#import <Masonry/Masonry.h>
#import "AKReposViewController.h"

@interface AKMainViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *options;
@end

@implementation AKMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.options = @[@"Browse Repos", @"Other (not implemented yet)"];

    [self addSubviews];

    [self addConstraints];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    [self.tableView registerClass:UITableViewCell.self forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:self.tableView];
}

- (void)addConstraints {

    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

#pragma mark - UITableViewDataSource, UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = self.options[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if (indexPath.row == 0) {
        AKReposViewController *controller = [[AKReposViewController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

@end
