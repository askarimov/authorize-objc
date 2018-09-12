//
//  AKReposViewController.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKBaseViewController.h"
#import "IReposView.h"
#import "IReposService.h"

@interface AKReposViewController : AKBaseViewController

@property (nonatomic, strong) id <IReposView> customView;

@end
