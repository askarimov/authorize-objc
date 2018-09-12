//
//  BaseView.m
//  authorize-objc
//
//  Created by Askar Karimov on 1/14/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {

}

@end
