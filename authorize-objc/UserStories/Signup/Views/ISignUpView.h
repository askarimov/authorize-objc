//
//  ISignUpView.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/10/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ISignUpView <NSObject>

@property NSString *username;
@property NSString *password;
@property NSString *email;

- (UIView *)view;

@end
