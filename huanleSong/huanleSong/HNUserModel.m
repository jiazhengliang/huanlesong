//
//  HNUserModel.m
//  huanleSong
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "HNUserModel.h"
@implementation HNUserTCIMModel

@end

@implementation HNUserModel

+ (HNUserModel *)shareInstance
{
    static HNUserModel *userModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userModel = [[HNUserModel alloc] init];
    });
    return userModel;
}

- (id) init {
    
    self = [super init];
    
    if (self) {
        
    }
    return self;
}
@end

@implementation HNUserModelSingleton

+ (instancetype)singleton{
    static HNUserModelSingleton *singleton;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [[HNUserModelSingleton alloc] init];
    });
    return singleton;
}

@end
