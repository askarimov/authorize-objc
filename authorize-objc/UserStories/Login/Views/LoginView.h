//
//  LoginView.h
//  authorize-objc
//
//  Created by Askar Karimov on 1/14/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "BaseView.h"
#import "ILoginView.h"

@protocol ILoginViewEventHandler;

@interface LoginView : BaseView <ILoginView>

- (instancetype)initWithEventHandler:(id<ILoginViewEventHandler>)eventHandler;

@end
