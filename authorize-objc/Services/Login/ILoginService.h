//
//  ILoginService.h
//  authorize-objc
//
//  Created by Askar Karimov on 9/10/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ILoginService <NSObject>

- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void(^)(BOOL success))completion;

@end
