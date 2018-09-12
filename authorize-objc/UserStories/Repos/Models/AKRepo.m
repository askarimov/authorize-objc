//
//  AKRepo.m
//  authorize-objc
//
//  Created by Askar Karimov on 9/12/18.
//  Copyright © 2018 Askar Karimov. All rights reserved.
//

#import "AKRepo.h"

@interface AKRepo ()
@property (nonatomic, copy, readwrite) NSString *name;
@property (nonatomic, copy, readwrite) NSString *about;
@end

@implementation AKRepo

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}

- (instancetype)initWithName:(NSString *)name about:(NSString *)about {
    self = [self initWithName:name];
    if (self) {
        self.name = name;
        self.about = about;
    }
    return self;
}

+ (AKRepo *)repoWithName:(NSString *)name {
    AKRepo *repo = [[AKRepo alloc] initWithName:name];
    return repo;
}

+ (AKRepo *)repoWithName:(NSString *)name about:(NSString *)about {
    AKRepo *repo = [[AKRepo alloc] initWithName:name about:about];
    return repo;
}

@end
