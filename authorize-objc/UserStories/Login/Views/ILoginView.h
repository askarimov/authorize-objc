//
//  LoginView.h
//  authorize-objc
//
//  Created by Askar Karimov on 1/14/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ILoginView <NSObject>

/**
 Holds login value: email, username, phone number
 */
@property NSString *username;

/**
 Holds password value
 */
@property NSString *password;

- (UIView *)view;

@end
