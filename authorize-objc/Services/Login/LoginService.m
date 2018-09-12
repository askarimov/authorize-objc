//
//  LoginService.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/10/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "LoginService.h"

@implementation LoginService

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(BOOL))completion {
    completion(YES);
}

@end
