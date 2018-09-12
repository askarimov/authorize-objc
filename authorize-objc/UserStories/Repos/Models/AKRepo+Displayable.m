//
//  AKRepo+Displayable.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKRepo+Displayable.h"

@implementation AKRepo (Displayable)

@dynamic repoName, repoDescription;

- (NSString *)repoName {
    return [self.name isKindOfClass:[NSString class]] ? self.name : @"";
}

- (NSString *)repoDescription {
    return [self.about isKindOfClass:[NSString class]] ? self.about :  @"";
}

@end
