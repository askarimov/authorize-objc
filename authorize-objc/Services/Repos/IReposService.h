//
//  IReposService.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IReposService <NSObject>

- (void)getReposWithCompletion:(void(^)(NSArray *repos, NSError *error))completion;

@end
