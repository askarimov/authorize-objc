//
//  IRepoCellPrototype.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol RepoCellDisplayable
@property (nonatomic) NSString *repoName;
@property (nonatomic) NSString *repoDescription;
@end

@protocol IRepoCellPrototype <NSObject>

- (Class)cellClass;
- (NSString *)reuseIdentifier;
- (UITableViewCell *)cell;

- (void)configure:(id<RepoCellDisplayable>)displayable;

@end
