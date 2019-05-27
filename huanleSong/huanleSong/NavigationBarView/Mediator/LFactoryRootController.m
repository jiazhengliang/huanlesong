//
//  LFactoryRootController.m
//  huanLeSong
//
//  Created by 印丹 on 2018/5/14.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "LFactoryRootController.h"

@implementation LFactoryRootController

#pragma mark - 创建UITabBarController

+ (UITabBarController *)createTabBarController {
    //初始化tabbar 和 navbar
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    
    //设置TabBar NavigationBar
    [[UITabBar appearance] setTintColor:BlackCustomColor];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObject:BlackCustomColor forKey:NSForegroundColorAttributeName]];
    
    NSArray *vcNameArrays = @[@"HotDynamicController",
                              @"MineController"]
                            ;
    
    NSArray *tabTitleArray = @[NSLocalizedString(@"首页", nil),
                               NSLocalizedString(@"我的", nil),];
    
    NSArray *norImageArray = @[@"x_l_icon_home_normal",
                               @"x_l_icon_me_normal",];
    
    NSArray *selImageArray = @[@"x_l_icon_home_selected",
                               @"x_l_icon_me_selected"];
    
    NSMutableArray *viewControllersArray = [[NSMutableArray alloc] initWithCapacity:5];
    for (int i = 0; i < tabTitleArray.count ; i ++) {
        UINavigationController *navController = [self tabNavItem:vcNameArrays[i] title:tabTitleArray[i] normalImageName:norImageArray[i] selectedImageName:selImageArray[i]];
        [viewControllersArray addObject:navController];
    }
    tabBarController.viewControllers = viewControllersArray;
    tabBarController.tabBar.tintColor = HexRGBAlpha(0xff3874, 1);
//    [UIColor colorWithRGBHex:0xff3874];
    return tabBarController;
}
#pragma mark - 创建UINavigationController
+ (UINavigationController *)tabNavItem:(NSString *)viewControllerName
                                 title:(NSString *)title
                       normalImageName:(NSString *)normalImageName
                     selectedImageName:(NSString *)selectedImageName
{
    Class vcClass = NSClassFromString(viewControllerName);
    UIViewController *viewController = [[vcClass alloc] init];
    
    //自定义导航控制器 把该控制器作为根视图控制器
    Class nvClass = NSClassFromString(@"CustomNavigationController");
    UINavigationController *navController = [[nvClass alloc] initWithRootViewController:viewController];
    
    
    navController.navigationBar.translucent = NO;//导航条不透明
    navController.navigationBar.barStyle = UIBarStyleDefault;//导航条样式：默认
    
    UIImage *normalImage = [[UIImage imageNamed:normalImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIImage *selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:normalImage selectedImage:selectedImage];
    tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
    tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
    navController.tabBarItem = tabBarItem;
    
    return navController;
}

#pragma mark - 修改UITabBarItem的图标
+ (void)showVideoShow:(BOOL)showVideo {
    UITabBarController *TabBarController = (UITabBarController *)[[UIApplication sharedApplication] delegate].window.rootViewController;
    if (![TabBarController isKindOfClass:[UITabBarController class]]) {
        return;
    }
    
//    UIImage *shadow = [self imageWithColor:<#(UIColor *)#> size:<#(CGSize)#>]
    
//    if (showVideo) {
//        [TabBarController.tabBar setBackgroundImage:[UIImage imageNamed:@"TabClarityBg"]];
//        [TabBarController.tabBar setShadowImage:[self imageWithColor:[UIColor whiteColor] size:CGSizeMake(700, 0.5)]];
//        if (@available(iOS 10.0, *)) {
//            [TabBarController.tabBar setUnselectedItemTintColor:[UIColor whiteColor]];
//        }
//    } else {
        [TabBarController.tabBar setBackgroundImage:nil];
        [TabBarController.tabBar setShadowImage:nil];
        if (@available(iOS 10.0, *)) {
            [TabBarController.tabBar setUnselectedItemTintColor:nil];
        }
//    }
    
    NSArray *navs = TabBarController.viewControllers;
    if (navs.count < 5) {
        return;
    }
    
    UINavigationController *navVideoShow = navs[0];
    UINavigationController *navHome      = navs[1];

    

        
        [navVideoShow.tabBarItem setImage:[UIImage imageNamed:@"x_l_icon_home_normal"]];
        [navHome.tabBarItem setImage:[UIImage imageNamed:@"x_l_icon_nearby_normal"]];

    
}
//NSArray *norImageArray = @[@"x_l_icon_home_normal",
//                           @"x_l_icon_nearby_normal",
//                           @"x_l_icon_video_normal",
//                           @"x_l_icon_novelty_normal",
//                           @"x_l_icon_me_normal"];
//
//NSArray *selImageArray = @[@"x_l_icon_home_selected",
//                           @"x_l_icon_nearby_selected",
//                           @"x_l_icon_video_selected",
//                           @"x_l_icon_novelty_selected",
//                           @"x_l_icon_me_selected"];

//裁剪图片
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //    CGContextRelease(context);
    return image;
}
@end
















