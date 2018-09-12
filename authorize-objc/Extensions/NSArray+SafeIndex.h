//
//  NSArray+SafeIndex.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/13/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (SafeIndex)

- (id)safeObjectAtIndex:(NSUInteger)index;
@end
