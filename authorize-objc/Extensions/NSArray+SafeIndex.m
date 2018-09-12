//
//  NSArray+SafeIndex.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/13/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "NSArray+SafeIndex.h"

@implementation NSArray (SafeIndex)

- (id)safeObjectAtIndex:(NSUInteger)index {
    if (index>=self.count) {
        return nil;
    }
    return [self objectAtIndex:index];
}

@end
