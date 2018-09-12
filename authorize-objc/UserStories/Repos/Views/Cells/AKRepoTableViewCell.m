//
//  AKRepoTableViewCell.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKRepoTableViewCell.h"

@implementation AKRepoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - IRepoCellPrototype

- (Class)cellClass {
    return AKRepoTableViewCell.self;
}

- (NSString *)reuseIdentifier {
    return @"RepoCell";
}

- (UITableViewCell *)cell {
    return self;
}

- (void)configure:(id<RepoCellDisplayable>)displayable {
    self.textLabel.text = displayable.repoName;
}

@end
