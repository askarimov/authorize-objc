//
//  AKRepoExtendedTableViewCell.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/13/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKRepoExtendedTableViewCell.h"
#import <Masonry/Masonry.h>

@implementation AKRepoExtendedTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.nameLabel.textColor = [UIColor blackColor];
        self.nameLabel.font = [UIFont systemFontOfSize:17 weight:UIFontWeightRegular];
        [self addSubview:self.nameLabel];

        self.aboutLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.aboutLabel.textColor = [UIColor blackColor];
        self.aboutLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightRegular];
        [self addSubview:self.aboutLabel];

        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self).with.insets(UIEdgeInsetsMake(8, 16, 8, 16));
        }];

        [self.aboutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
            make.bottom.left.right.equalTo(self).with.insets(UIEdgeInsetsMake(8, 16, 8, 16));
        }];
    }
    return self;
}

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
    return AKRepoExtendedTableViewCell.self;
}

- (NSString *)reuseIdentifier {
    return @"RepoCell";
}

- (UITableViewCell *)cell {
    return self;
}

- (void)configure:(id<RepoCellDisplayable>)displayable {
    self.nameLabel.text = displayable.repoName;
    self.aboutLabel.text = displayable.repoDescription;
}

@end
