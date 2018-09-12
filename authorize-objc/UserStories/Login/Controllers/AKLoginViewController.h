//
//  LoginViewController.h
//  authorize-objc
//
//  Created by Askar Karimov on 1/14/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//
//  This view is designed to be reused in apps with login logic.
//  Implement ILoginView by passing controller instance as ILoginViewEventHandler in initializer and set it as controller's view.
//  Implement ILoginViewEventHandler protocol methods.
//  LoginViewController should call LoginService methods like
//  * loginWithUsername:andPassword:
//  * forgotPassword (navigate to ForgotPasswordViewController)
//

#import "AKBaseViewController.h"
#import "ILoginService.h"
#import "ILoginView.h"
#import "ILoginViewEventHandler.h"

@interface AKLoginViewController : AKBaseViewController<ILoginViewEventHandler>

@property (nonatomic, strong) id <ILoginView> loginView;
@property (nonatomic, strong) id <ILoginService> loginService;

- (instancetype)initWithLoginService:(id<ILoginService>)loginService;

@end
