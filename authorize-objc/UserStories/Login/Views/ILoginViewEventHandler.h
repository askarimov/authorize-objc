//
//  ILoginViewEventHandler.h
//  authorize-objc
//
//  Created by Askar Karimov on 1/21/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ILoginView;

@protocol ILoginViewEventHandler <NSObject>

- (void)loginViewDidTapLoginButton:(id<ILoginView>)view;
- (void)loginViewDidTapForgotPasswordButton:(id<ILoginView>)view;
- (void)loginViewDidTapSignUpButton:(id<ILoginView>)view;

@optional
- (void)loginView:(id<ILoginView>)view handleDidLoginButtonTapWithUsername:(NSString *)username password:(NSString *)password;


@end
