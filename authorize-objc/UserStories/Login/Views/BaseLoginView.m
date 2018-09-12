//
//  BaseLoginView.m
//  authorize-objc
//
//  Created by Askar Karimov on 1/21/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "BaseLoginView.h"

@interface BaseLoginView ()
@property (nonatomic, assign) UIEdgeInsets inputFieldInsets;
@end

@implementation BaseLoginView

- (instancetype)initWithEventHandler:(id<ILoginViewEventHandler>)eventHandler {
    self = [super init];
    if (self) {
        _eventHandler = eventHandler;
    }
    return self;
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

#pragma mark - Public

- (void)addSubviews {

    self.container = [[UIView alloc] init];
    [self addSubview:self.container];

    self.usernameField = [[UITextField alloc] init];
    self.usernameField.placeholder = @"Username";
    self.usernameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.container addSubview:self.usernameField];

    self.passwordField = [[UITextField alloc] init];
    self.passwordField.placeholder = @"Password";
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    [self.container addSubview:self.passwordField];

    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(handleLoginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.container addSubview:self.loginButton];

}

- (IBAction)handleLoginButtonClick:(id)sender {
    if ([self.eventHandler respondsToSelector:@selector(loginViewDidTapLoginButton:)]) {
        [self.eventHandler loginViewDidTapLoginButton:self];
    }
}

@end
