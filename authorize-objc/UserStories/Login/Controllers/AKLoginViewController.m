//
//  LoginViewController.m
//  authorize-objc
//
//  Created by Askar Karimov on 1/14/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKLoginViewController.h"
#import "LoginView.h"
#import "AnotherBaseLoginView.h"
#import "AKSignUpViewController.h"
#import "AKMainViewController.h"

@interface AKLoginViewController ()

@end

@implementation AKLoginViewController

- (instancetype)initWithLoginService:(id)loginService {
    self = [super init];
    if (self) {
        self.loginService = loginService;
    }
    return self;
}

- (void)loadView {

    // set default view if needed
    if (!self.loginView) {
        //    self.loginView = [[LoginView alloc] initWithEventHandler:self];
        self.loginView = [[AnotherBaseLoginView alloc] initWithEventHandler:self];
    }
    self.view = [self.loginView view];
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)presentLoggedInState {
    AKMainViewController *controller = [[AKMainViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark - ILoginViewEventHandler
- (void)loginView:(id<ILoginView>)view handleDidLoginButtonTapWithUsername:(NSString *)username password:(NSString *)password {
    NSLog(@"1) try login with username %@ and password %@", username, password);
}

- (void)loginViewDidTapLoginButton:(id<ILoginView>)view {
    NSLog(@"2) try login with username %@ and password %@", view.username, view.password);

    // validate

    [self.loginService loginWithUsername:view.username password:view.password completion:^(BOOL success) {
        NSLog(@"login completed with %@", success ? @"Success" : @"Failure");

        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self presentLoggedInState];
            });
        }
    }];
}

- (void)loginViewDidTapSignUpButton:(id<ILoginView>)view {
    NSLog(@"3) try sign up");

    AKSignUpViewController *controller = [[AKSignUpViewController alloc] init];
    controller.username = view.username;
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)loginViewDidTapForgotPasswordButton:(id<ILoginView>)view {
    NSLog(@"4) try forgot password with username %@", view.username);
}

@end
