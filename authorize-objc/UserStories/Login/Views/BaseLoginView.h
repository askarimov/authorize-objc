//
//  BaseLoginView.h
//  authorize-objc
//
//  Created by Askar Karimov on 1/21/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "BaseView.h"
#import "ILoginViewEventHandler.h"
#import "ILoginView.h"

@protocol ILoginViewEventHandler;

@interface BaseLoginView : BaseView <ILoginView>

@property (nonatomic, strong) id <ILoginViewEventHandler> eventHandler;

// UI
@property (nonatomic, strong) UIView *container;
@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;
@property (nonatomic, strong) UIButton *loginButton;

// designated initializer
- (instancetype)initWithEventHandler:(id<ILoginViewEventHandler>)eventHandler;

// 
- (void)addSubviews;

- (IBAction)handleLoginButtonClick:(id)sender;

@end
