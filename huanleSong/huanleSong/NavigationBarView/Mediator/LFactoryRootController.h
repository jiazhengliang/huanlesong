//
//  LFactoryRootController.h
//  huanLeSong
//
//  Created by 印丹 on 2018/5/14.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LFactoryRootController : NSObject

+ (UITabBarController *)createTabBarController;
+ (void)showVideoShow:(BOOL)showVideo;

@end


