//
//  AKRepoExtendedTableViewCell.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/13/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRepoCellPrototype.h"

@interface AKRepoExtendedTableViewCell : UITableViewCell <IRepoCellPrototype>

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *aboutLabel;

@end
