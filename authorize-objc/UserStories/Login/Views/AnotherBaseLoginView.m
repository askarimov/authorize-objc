//
//  AnotherBaseLoginView.m
//  authorize-objc
//
//  Created by Askar Karimov on 1/21/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AnotherBaseLoginView.h"
#import <Masonry/Masonry.h>

@interface AnotherBaseLoginView ()
@property (nonatomic, strong) UIButton *signUpButton;
@property (nonatomic, strong) UIButton *forgotPasswordButton;
@property (nonatomic, assign) UIEdgeInsets inputFieldInsets;
@end

@implementation AnotherBaseLoginView

- (void)initialize {

    self.backgroundColor = [UIColor whiteColor];
    
    self.inputFieldInsets = UIEdgeInsetsMake(0, 20, 0, 20);

    [self addSubviews];
    [self makeConstraints];

}

- (void)addSubviews {

    [super addSubviews];

    self.forgotPasswordButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.forgotPasswordButton setTitle:@"Forgot password?" forState:UIControlStateNormal];
    [self.forgotPasswordButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.forgotPasswordButton addTarget:self action:@selector(handleForgotPasswordButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.container addSubview:self.forgotPasswordButton];

    self.signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.signUpButton setTitle:@"Sign up" forState:UIControlStateNormal];
    [self.signUpButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.signUpButton addTarget:self action:@selector(handleSignUpButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.signUpButton];

}

- (void)makeConstraints {

    UIView *superview = self.container;

    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
        make.left.right.equalTo(@0);
    }];

    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(superview).insets(self.inputFieldInsets);
        make.height.equalTo(@40);
    }];

    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameField.mas_bottom).offset(16);
        make.left.right.equalTo(superview).insets(self.inputFieldInsets);
        make.height.equalTo(@40);
    }];

    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordField.mas_bottom).offset(16);
        make.left.right.equalTo(superview).insets(self.inputFieldInsets);
        make.height.equalTo(@40);
    }];

    [self.forgotPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loginButton.mas_bottom).offset(16);
        make.left.right.equalTo(superview).insets(self.inputFieldInsets);
        make.height.equalTo(@40);
        make.bottom.equalTo(@0);
    }];

    [self.signUpButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(superview).insets(self.inputFieldInsets);
        make.height.equalTo(@40);
        make.bottom.equalTo(@-20);
    }];
}

#pragma mark - Actions

- (IBAction)handleSignUpButtonClick:(id)sender {
    if ([self.eventHandler respondsToSelector:@selector(loginViewDidTapSignUpButton:)]) {
        [self.eventHandler loginViewDidTapSignUpButton:self];
    }
}

- (IBAction)handleForgotPasswordButtonClick:(id)sender {
    if ([self.eventHandler respondsToSelector:@selector(loginViewDidTapForgotPasswordButton:)]) {
        [self.eventHandler loginViewDidTapForgotPasswordButton:self];
    }
}


//#pragma mark - ILoginView
//@synthesize username;
//@synthesize password;
//
//- (UIView *)view {
//    return self;
//}
//
//- (NSString *)username {
//    return self.usernameField.text;
//}
//
//- (NSString *)password {
//    return self.passwordField.text;
//}

@end
