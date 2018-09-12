//
//  AKRepo.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AKRepo : NSObject
@property (nonatomic, copy, readonly) NSString *name;
@property (nonatomic, copy, readonly) NSString *about;

+ (AKRepo *)repoWithName:(NSString *)name;
+ (AKRepo *)repoWithName:(NSString *)name about:(NSString *)about;

@end

