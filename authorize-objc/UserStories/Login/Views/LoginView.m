//
//  LoginView.m
//  authorize-objc
//
//  Created by Askar Karimov on 1/14/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "LoginView.h"
#import <Masonry/Masonry.h>
#import "ILoginViewEventHandler.h"

@interface LoginView ()
@property (nonatomic, assign) id <ILoginViewEventHandler> eventHandler;
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *loginButton;
@property (nonatomic, assign) UIEdgeInsets inputFieldInsets;
@end

@implementation LoginView

- (instancetype)initWithEventHandler:(id<ILoginViewEventHandler>)eventHandler {
    self = [super init];
    if (self) {
        _eventHandler = eventHandler;
    }
    return self;
}

- (void)initialize {

    self.backgroundColor = [UIColor whiteColor];
    self.inputFieldInsets = UIEdgeInsetsMake(0, 20, 0, 20);

    [self addSubviews];
    [self makeConstraints];

}

- (void)addSubviews {

    self.container = [[UIView alloc] init];
    [self.view addSubview:self.container];

    self.usernameField = [[UITextField alloc] init];
    self.usernameField.placeholder = @"Username";
    [self.container addSubview:self.usernameField];

    self.passwordField = [[UITextField alloc] init];
    self.passwordField.placeholder = @"Password";
    [self.container addSubview:self.passwordField];

    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(handleLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.container addSubview:self.loginButton];

}

- (void)makeConstraints {

    UIView *superview = self.container;

    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(@0);
        make.left.right.equalTo(@0);
    }];

    [self.usernameField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(superview).insets(self.inputFieldInsets);
        //        make.height.equalTo(@40);
    }];

    [self.passwordField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.usernameField.mas_bottom).offset(16);
        make.left.right.equalTo(superview).insets(self.inputFieldInsets);
        //        make.height.equalTo(@40);
    }];

    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordField.mas_bottom).offset(16);
        make.left.right.equalTo(superview).insets(self.inputFieldInsets);
        make.height.equalTo(@40);
        make.bottom.equalTo(@0);
    }];
}

#pragma mark - Actions

- (IBAction)handleLoginButtonClick:(id)sender {

    [self.eventHandler loginView:self handleDidLoginButtonTapWithUsername:self.usernameField.text password:self.passwordField.text];

    [self.eventHandler loginViewDidTapLoginButton:self];
}

#pragma mark - ILoginView
@synthesize username;
@synthesize password;

- (UIView *)view {
    return self;
}

- (NSString *)username {
    return self.usernameField.text;
}

- (NSString *)password {
    return self.passwordField.text;
}

@end
