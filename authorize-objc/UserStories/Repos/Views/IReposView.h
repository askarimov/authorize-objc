//
//  IReposView.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IReposView <NSObject>

- (UIView *)view;

- (void)onViewDidLoad;

@end
