////
////  LMediatorForController.m
////  huanLeSong
////
////  Created by 印丹 on 2018/5/14.
////  Copyright © 2018年 Wendy China. All rights reserved.
////
//
//#import "LMediatorForController.h"
//#import "AppDelegate.h"
//
//@implementation LCallbackModel
//+ (LCallbackModel *)create:(UIViewController *)VC {
//    return [self create:VC param:nil objectParam:nil];
//}
//+ (LCallbackModel *)create:(UIViewController *)VC param:(NSDictionary *)Dict {
//    return [self create:VC param:Dict objectParam:nil];
//}
//+ (LCallbackModel *)create:(UIViewController *)VC objectParam:(id)object {
//    return [self create:VC param:nil objectParam:object];
//}
//+ (LCallbackModel *)create:(UIViewController *)VC param:(NSDictionary *)Dict objectParam:(id)object {
//    LCallbackModel *model = [[LCallbackModel alloc] init];
//    model.params = Dict;
//    model.vc = VC;
//    model.object = object;
//    return model;
//}
//@end
//
//typedef NS_ENUM(NSInteger,LMediatorJumpWay) {
//    LMediatorJumpWay_Push = 0,
//    LMediatorJumpWay_Mode = 1,
//    LMediatorJumpWay_Liberty = 2,
//};
//
//@interface LMediatorForController ()<UITabBarControllerDelegate>
//
////Push,Pop是否使用动画, Default is YES
////@property(nonatomic,assign,readwrite) BOOL useAnimated;
//
////登录VC
//@property(nonatomic,weak) UINavigationController *loginViewController;
//
////主页VC
//@property(nonatomic,weak) UITabBarController *tabBarController;
//
//@end
//
//static LMediatorForController *LMediatorInstance = nil;
//
//@implementation LMediatorForController
//
//@synthesize currentController = currentController;
//@synthesize beforeController  = beforeController;
//@synthesize beforeControllerTag = beforeControllerTag;
//
//+ (nonnull instancetype)sharedInstance {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        LMediatorInstance = [[[self class] alloc] init];
//        LMediatorInstance.useAnimated = YES;
//        LMediatorInstance.hidsTabBar  = YES;
//        [[NSNotificationCenter defaultCenter] addObserver:LMediatorInstance selector:@selector(reciveCallVideo:) name:NotifiacationCallVideoView object:nil];
//    });
//    return LMediatorInstance;
//}
//
//- (void)reciveCallVideo:(NSNotification *)object {
//    //self.tabBarController.selectedIndex = kLControllerTagMessge-1;
//}
//
//#pragma mark - 设置根控制器（主页、登录）
//+ (void)setRootViewControllerOfApp {
//    
//    [LMediatorForController sharedInstance];
////    [LMediatorForController enterHome];
////
////    return;
//    if ( LoginIsAuto() && ([LSingleton shareClient].loginUser.Status == LUserStatus_Common || [LSingleton shareClient].loginUser.Status == LUserStatus_Forbidden )) {
//        [LMediatorForController enterHome];
//    } else {
//        [LMediatorForController enterLogin];
//    }
//}
//+ (void)isTestUI {
//    UIWindow *Window = [AppDelegate sharedInstance].window;
//    Class className = NSClassFromString(@"LVideoShowManager");
//    Window.rootViewController = [[className alloc] init];
//    Window.rootViewController.kCTag = kLControllerTagLVideoShow;
//    [LMediatorInstance configNewViewController:Window.rootViewController];
//}
//+ (void)enterLogin {
//#if LDeveloperTest
//    [self isTestUI];
//    return;
//#endif
//    UIWindow *Window = [AppDelegate sharedInstance].window;
//    if (Window.rootViewController &&
//        [Window.rootViewController isKindOfClass:[UINavigationController class]] &&
//        [(UINavigationController *)Window.rootViewController topViewController].kCTag == kLControllerTagLogin)
//    {
//        [LMediatorForController toControllerKCTag:kLControllerTagLogin];
//    }
//    else {
//        Window.rootViewController = LMediatorInstance.loginViewController;
//        [LMediatorInstance configNewViewController:LMediatorInstance.loginViewController];
//    }
//}
//+ (void)enterHome {
//#if LDeveloperTest
//    [self isTestUI];
//    return;
//#endif
//    UIWindow *Window = [AppDelegate sharedInstance].window;
//    if ([Window.rootViewController isKindOfClass:[UITabBarController class]] &&
//        [LMediatorInstance findToViewController:kLControllerTagDynamic] != nil)
//    {
//        if (LMediatorInstance.currentController.kCTag != kLControllerTagDynamic) {
//            [LMediatorForController toControllerKCTag:kLControllerTagDynamic];
//        }
//    }
//    else {
//        Window.rootViewController = LMediatorInstance.tabBarController;
//        [LMediatorInstance configNewViewController:
//         LMediatorInstance.tabBarController.selectedViewController];
//    }
//}
//
//- (UITabBarController *)tabBarController {
//    UITabBarController *TabBarController = (UITabBarController *)[AppDelegate sharedInstance].window.rootViewController;
//    
//    if ([TabBarController isKindOfClass:[UITabBarController class]]) {
//        
//    }
//    else {
//        TabBarController = [LFactoryRootController createTabBarController];
//        TabBarController.delegate = self;
//        UIViewController *operation_viewController = nil;
//        Class operation_class = nil;
//        for (UIViewController *viewController in TabBarController.viewControllers) {
//            operation_viewController = viewController;
//            if ([operation_viewController isKindOfClass:[UINavigationController class]]) {
//                operation_viewController = [(UINavigationController *)operation_viewController topViewController];
//            }
//            operation_class = [operation_viewController class];
//            if (operation_class == NSClassFromString(@"NearPeopleController"))
//            {
//                operation_viewController.kCTag = kLControllerTagLNearPerson;
//            }
//            else if (operation_class == NSClassFromString(@"LVideoShowViewController"))
//            {
//                operation_viewController.kCTag = kLControllerTagLVideoShow;
//            }
//            else if (operation_class == NSClassFromString(@"EnterTainMentController") ||
//                     operation_class == NSClassFromString(@"LEnterTainMentController"))
//            {
//                operation_viewController.kCTag = kLControllerTagDynamic;
//            }
//            else if (operation_class == NSClassFromString(@"MessgeListController"))
//            {
//                operation_viewController.kCTag = kLControllerTagMessge;
//            }
//            else if (operation_class == NSClassFromString(@"LMineViewController"))
//            {
//                operation_viewController.kCTag = kLControllerTagMine;
//            }
//            else if (operation_class == NSClassFromString(@"DynamicController"))
//            {
//                operation_viewController.kCTag = kLControllerTagLNewThing;
//            }
//        }
//    }
//    return TabBarController;
//}
//- (UINavigationController *)loginViewController {
//    UINavigationController *NavigationController = (UINavigationController *)[AppDelegate sharedInstance].window.rootViewController;
//    
//    if ([NavigationController isKindOfClass:[UINavigationController class]] &&
//        [[NavigationController viewControllers].firstObject kCTag] == kLControllerTagLogin)
//    {
//        
//    }
//    else {
//        NSDictionary *dictController = [LFactoryCommonController createViewController:kLControllerTagLogin];
//        NavigationController = dictController[LFactory_kNavigationController];
//    }
//    return NavigationController;
//}
//- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
//{
//    [self configNewViewController:viewController];
//}
//#pragma mark - 侧滑返回回调，调用popViewController返回
//+ (UIViewController *)callbackPopViewController:(UIViewController *)topViewController
//{
//    [LMediatorInstance configNewViewController:topViewController];
//    return nil;
//}
//+ (void)popViewController:(UIViewController *)whoPop
//{
//    if (whoPop) {
//        UINavigationController *navi = whoPop.navigationController;
//        [navi popViewControllerAnimated:LMediatorInstance.useAnimated];
//        [LMediatorInstance configNewViewController:navi.topViewController];
//    }
//    
//}
//+ (void)dismissViewController:(UIViewController *)whoDismiss
//{
//    if (whoDismiss) {
//        UIViewController *PreviousLevel = whoDismiss.presentingViewController;
//        if ([PreviousLevel isKindOfClass:[UITabBarController class]]) {
//            UITabBarController *tbc = (UITabBarController *)PreviousLevel;
//            PreviousLevel = tbc.selectedViewController;
//        }
//        
//        [whoDismiss dismissViewControllerAnimated:LMediatorInstance.useAnimated completion:NULL];
//        [LMediatorInstance configNewViewController:PreviousLevel];
//    }
//}
//+ (void)returnToTheParentPage:(UIViewController * _Nonnull)returnedBy {
//    if (returnedBy.whereAreYouFrom == LWhereAreYouFrom_Nav) {
//        [LMediatorForController popViewController:returnedBy];
//    }
//    else if (returnedBy.whereAreYouFrom == LWhereAreYouFrom_Modal)  {
//        [LMediatorForController dismissViewController:returnedBy];
//    }
//}
//
//#pragma mark - 更改当前控制器(viewController中必须带有kCTag的UIViewController)
//- (void)configNewViewController:(UIViewController *)viewController
//{
//    UIViewController *viewController_ = [self getInsideViewController:viewController];
//    
//#if DEBUG
//    if (viewController_ == nil) {
//        [LMediatorForController testAlertWithMessage:[NSString stringWithFormat:@"Method: configNewViewController，%@,viewController_ == nil",NSStringFromClass(currentController.class)]];
//    }
//    
//    if (viewController_.kCTag == kLControllerTagNone)
//    {
//        //[LMediatorForController testAlertWithMessage:[NSString stringWithFormat:@"Method: configNewViewController,%@，kCTag == kLControllerTagNone",NSStringFromClass(viewController.class)]];
//    }
//#endif
//    
//    if (viewController_
//        && viewController_.kCTag != kLControllerTagNone
//        && (currentController == nil || viewController_.kCTag != currentController.kCTag))
//    {
//        beforeController    = currentController;
//        beforeControllerTag = currentController.kCTag;
//        currentController   = viewController_;
//    }
//}
//
//#pragma mark - PUSH 导航 withWay:0
//+ (void)pushControllerKCTag:(kLControllerTag)kCTag
//{
//    [LMediatorForController pushControllerKCTag:kCTag parameters:nil];
//}
//+ (void)pushControllerKCTag:(kLControllerTag)kCTag parameters:(NSDictionary *)params
//{
//    [[LMediatorForController sharedInstance] pushControllerKCTag:kCTag parameters:params];
//}
//- (void)pushControllerKCTag:(kLControllerTag)kCTag parameters:(NSDictionary *)params
//{
//    [self toKCTag:kCTag toController:nil parameters:params withWay:LMediatorJumpWay_Push];
//}
//
//#pragma mark - PRESENT 模态 withWay:1
//+ (void)presentControllerKCTag:(kLControllerTag)kCTag
//{
//    [LMediatorForController presentControllerKCTag:kCTag parameters:nil];
//}
//+ (void)presentControllerKCTag:(kLControllerTag)kCTag parameters:(NSDictionary *)params
//{
//    [[LMediatorForController sharedInstance] presentControllerKCTag:kCTag parameters:params];
//}
//- (void)presentControllerKCTag:(kLControllerTag)kCTag parameters:(NSDictionary *)params
//{
//    [self toKCTag:kCTag toController:nil parameters:params withWay:LMediatorJumpWay_Mode];
//}
//
//#pragma mark - TO 任意 withWay:2
//+ (void)toControllerKCTag:(kLControllerTag)kCTag
//{
//    [LMediatorForController toControllerKCTag:kCTag parameters:nil];
//}
//+ (void)toControllerKCTag:(kLControllerTag)kCTag parameters:(NSDictionary *)params
//{
//    [[LMediatorForController sharedInstance] toControllerKCTag:kCTag parameters:params];
//}
//- (void)toControllerKCTag:(kLControllerTag)kCTag parameters:(NSDictionary *)params
//{
//    [self toKCTag:kCTag toController:nil parameters:params withWay:LMediatorJumpWay_Liberty];
//}
//
//#pragma mark - (PUSH、PRSENT、TO)在此进入新的界面
////skipWay: 0为PUSH(导航)，1为PRESENT(模态)，2为TO(模态或导航)
//- (void)toKCTag:(kLControllerTag)kCTag
//   toController:(UIViewController *)viewController
//     parameters:(NSDictionary *)params
//        withWay:(LMediatorJumpWay)jumpWay {
//    
//
//    if (kCTag == kLControllerTagNone) {
//#if DEBUG
//        [LMediatorForController testAlertWithMessage:@"无效的kCTag值！"];
//#endif
//        return;
//    }
//    if (!currentController) {
//#if DEBUG
//        [LMediatorForController testAlertWithMessage:@"错误：currentController为nil！"];
//#endif
//        return;
//    }
//    if (currentController.kCTag == kCTag) {
//#if DEBUG
//        [LMediatorForController testAlertWithMessage:@"错误：跳转到现有控制器！"];
//#endif
//        return;
//    }
//    
//    UIViewController *toController = nil;
//    UINavigationController *toNavigationController = nil;
//    
//    if (viewController) {
//        toController = viewController;
//    } else {
//        if (jumpWay == LMediatorJumpWay_Liberty) {
//            toController = [self findToViewController:kCTag];
//            
//            if (toController) {
////                [toController setL_DictParams:params];
//                if (params) {
//                    [toController setL_DictParams:params];
//                }
//                [self routerToViewController:toController];
//                [self configNewViewController:toController];
//                return;
//            }
//            
//            if (kCTag == kLControllerTagLogin) {
//                [LMediatorForController enterLogin];
//                return;
//            }
//        }
//        
//        NSDictionary *dictController = [LFactoryCommonController createViewController:kCTag];
//        toNavigationController = dictController[LFactory_kNavigationController];
//        toController = dictController[LFactory_kViewController];
//    }
//    
//#if DEBUG
//    if (toController == nil) {
//        [LMediatorForController testAlertWithMessage:@"请先在LFactoryCommonController中创建您的UIViewController再跳转！"];
//        return;
//    }
//#endif
//    
//    toController.kCTag = kCTag;
//    toController.l_DictParams = params;
//    toController.hidesBottomBarWhenPushed = self.hidsTabBar;
//    
//    UIViewController *toObject = toNavigationController ? toNavigationController : toController;
//    
//    if (jumpWay == LMediatorJumpWay_Push)
//    {
//        [self pushViewController:toObject correction:YES];
//    }
//    else if (jumpWay == LMediatorJumpWay_Mode)
//    {
//        [self presentViewController:toObject];
//    }
//    else {
//        if ([toObject isKindOfClass:[UINavigationController class]])
//        {
//            [self presentViewController:toObject];
//        }
//        else {
//            [self pushViewController:toObject correction:YES];
//        }
//    }
//    [self configNewViewController:toObject];
//}
//
//- (void)pushViewController:(UIViewController *)toController correction:(BOOL)correction
//{
//    UIViewController *viewController_ = [self getInsideViewController:toController];
//    
//    UINavigationController *navCon = currentController.navigationController;
//    if (navCon) {
//        viewController_.whereAreYouFrom = LWhereAreYouFrom_Nav;
//        [navCon pushViewController:viewController_ animated:self.useAnimated];
//    }
//    else {
//        viewController_.whereAreYouFrom = LWhereAreYouFrom_Modal;
//        [self presentViewController:toController];
//    }
//}
//- (void)presentViewController:(UIViewController *)toController
//{
//    UIViewController *viewController_ = [self getInsideViewController:toController];
//    viewController_.whereAreYouFrom = LWhereAreYouFrom_Modal;
//    [currentController presentViewController:toController animated:self.useAnimated completion:NULL];
//}
//
//#pragma mark - 跳转到指定的控制器
//+ (void)toController:(UIViewController *)viewController
//{
//    [[LMediatorForController sharedInstance] toKCTag:viewController.kCTag
//                                        toController:viewController
//                                          parameters:nil
//                                             withWay:LMediatorJumpWay_Liberty];
//}
//+ (void)pushController:(UIViewController *)viewController
//{
//    [[LMediatorForController sharedInstance] toKCTag:viewController.kCTag
//                                        toController:viewController
//                                          parameters:nil
//                                             withWay:LMediatorJumpWay_Push];
//    //
//}
//+ (void)presentController:(UIViewController *)viewController
//{
//    [[LMediatorForController sharedInstance] toKCTag:viewController.kCTag
//                                        toController:viewController
//                                          parameters:nil
//                                             withWay:LMediatorJumpWay_Mode];
//}
//+ (void)toController:(UIViewController *)viewController parameters:(NSDictionary * _Nullable)params
//{
//    [[LMediatorForController sharedInstance] toKCTag:viewController.kCTag
//                                        toController:viewController
//                                          parameters:params
//                                             withWay:LMediatorJumpWay_Liberty];
//}
//+ (void)pushController:(UIViewController *)viewController parameters:(NSDictionary * _Nullable)params
//{
//    [[LMediatorForController sharedInstance] toKCTag:viewController.kCTag
//                                        toController:viewController
//                                          parameters:params
//                                             withWay:LMediatorJumpWay_Push];
//}
//+ (void)presentController:(UIViewController *)viewController parameters:(NSDictionary * _Nullable)params
//{
//    [[LMediatorForController sharedInstance] toKCTag:viewController.kCTag
//                                        toController:viewController
//                                          parameters:params
//                                             withWay:LMediatorJumpWay_Mode];
//}
//
//#pragma mark - 跳转到指定的(已存在的)控制器
//- (void)routerToViewController:(UIViewController *)toController {
//    
//    NSArray *toNavigations   = [toController allNavigationControllers];
//    NSArray *comeNavigations = [currentController allNavigationControllers];
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF in %@",toNavigations];
//    NSArray *joinlys = [comeNavigations filteredArrayUsingPredicate:predicate];
//    
//    if ([joinlys count] > 0) {
//        //在同一个导航栈中,只需POP即可
//        UINavigationController *root_navigation = joinlys.firstObject;
//        joinlys = [root_navigation.viewControllers filteredArrayUsingPredicate:predicate];
//        if ([joinlys count] > 0) {
//            [root_navigation popToViewController:joinlys.firstObject animated:self.useAnimated];
//        } else {
//            [root_navigation popToViewController:toController animated:self.useAnimated];
//        }
//        
//        return;
//    }
//    
//    //不 在同一个的导航栈中
//    
//    NSArray *toViewControllers = [toController allMemberViewControllers];
//    if ([toViewControllers containsObject:currentController]) {
//        //currentController来自于toController，只需从toController截断即可
//        
//        if (toController.presentedViewController) {
//            //找到真正的模态者
//            UIViewController *authenticPresented = toController.presentedViewController.presentingViewController;
//            [authenticPresented dismissViewControllerAnimated:self.useAnimated completion:^{
//                
//            }];
//            
//            if ([authenticPresented isKindOfClass:[UITabBarController class]]) {
//                UITabBarController *tabBar = (UITabBarController *)authenticPresented;
//                NSInteger index = [tabBar indexOfViewController:toController];
//                if (index != NSNotFound) {
//                    tabBar.selectedIndex = index;
//                    
//                    UIViewController *selectVC = tabBar.selectedViewController;
//                    if ([selectVC isKindOfClass:[UINavigationController class]]) {
//                        authenticPresented = selectVC;
//                    }
//                } else {
//                    NSLog(@"不存在的情况");
//                }
//            }
//            
//            if ([authenticPresented isKindOfClass:[UINavigationController class]]) {
//                UINavigationController *navCon = (UINavigationController *)authenticPresented;
//                if (navCon.topViewController == toController) {
//                    //已到了目标Controller
//                    return;
//                }
//                NSInteger index = [navCon indexOfViewController:toController];
//                if (index != NSNotFound) {
//                    UIViewController *authentic_pop = [navCon.viewControllers objectAtIndex:index];
//                    [navCon popToViewController:authentic_pop animated:NO];
//                } else {
//                    NSLog(@"也不会存在的情况");
//                }
//            }
//        } else if (toController.navigationController) {
//            //toController在导航栈中，POP即可
//            UINavigationController *navigation = toController.navigationController;
//            [navigation popToViewController:toController animated:self.useAnimated];
//        } else {
//            //非Present,非Push,则是在toController上添加了viewController,由该viewController再转向的currentController
//            for (UIViewController *subVC in toController.childViewControllers) {
//                [subVC removeFromParentViewController];
//            }
//        }
//    }
//    else {
//        //该情况，说明toController为首页的几大模块之一
//        self.tabBarController.selectedIndex = toController.kCTag-1;//因为kLControllerTagLVideoShow == 1
//        [self tabBarController:self.tabBarController didSelectViewController:toController];
//        [beforeController.navigationController popToRootViewControllerAnimated:NO];
//    }
//}
//
//#pragma mark - Helper 根据kCTag查找目标控制器、获得容器中的VC
//- (UIViewController *)findToViewController:(kLControllerTag)kCTag {
//    //更多的是返回到上级页面
//    for (UIViewController *viewController in currentController.navigationController.viewControllers) {
//         if (kCTag == viewController.kCTag) {
//             return viewController;
//         }
//    }
//    
//    /*
//     
//     */
//    UIViewController *toController = nil;
//    UIWindow *window = [UIApplication sharedApplication].delegate.window;
//    UIViewController *rootViewController = window.rootViewController;
//    NSArray *viewControllers = [rootViewController allMemberViewControllers];
//    for (UIViewController *vc in viewControllers) {
//        if (vc.kCTag == kCTag) {
//            toController = vc;
//            break;
//        }
//    }
//    return toController;
//}
//
//- (UIViewController *)getInsideViewController:(UIViewController *)viewController
//{
//    UIViewController *viewController_ = viewController;
//    while ([viewController_ isKindOfClass:[UINavigationController class]]) {
//        viewController_ = [(UINavigationController *)viewController_ topViewController];
//    }
//    return viewController_;
//}
//
//#pragma mark - 提示
//+ (void)testAlertWithMessage:(NSString *)message {
//#if DEBUG
//    [[LMediatorForController currVC] alertViewTitle:@"测试提示"
//                                            message:message
//                                        cancelTitle:nil
//                                        affirmTitle:NSEaseLocalizedString(@"关闭", nil)
//                                          withBlock:^(BOOL isAffirm)
//    {
//    
//    }];
//#endif
//}
//+ (void)alertWithMessage:(NSString *)message {
//    [[LMediatorForController currVC] alertViewTitle:@"温馨提示"
//                                            message:message
//                                        cancelTitle:nil
//                                        affirmTitle:NSEaseLocalizedString(@"关闭", nil)
//                                          withBlock:^(BOOL isAffirm)
//    {
//        
//    }];
//}
//+ (void)showMessage:(NSString *)message {
//    [[LMediatorForController currVC] HUD_ShowsAndHidsTheTextBarMulti_line:message];
//    /*
//     
//     */
//}
//+ (UIViewController *)currVC {
//    UIViewController *currVC = LMediatorInstance.currentController;
//    if (currVC == nil) {
//        currVC = [[AppDelegate sharedInstance] frontViewController];
//    }
//    return currVC;
//}
//
//
//@end
//
//
//
//
//#pragma mark - NSObject (kControllerTag)
//
//#import <objc/runtime.h>
//
//static const void *keykLControllerTag = &keykLControllerTag;
//static const void *keykLControllerWhereFrom    = &keykLControllerWhereFrom;
//static const void *keykLControllerParams = &keykLControllerParams;
//
//@implementation UIViewController (LControllerTag)
//
//- (void)setKCTag:(kLControllerTag)kCTag {
//    objc_setAssociatedObject(self, keykLControllerTag, [NSNumber numberWithInt:kCTag], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (kLControllerTag)kCTag {
//    return [objc_getAssociatedObject(self, keykLControllerTag) intValue];
//}
//
//- (void)setWhereAreYouFrom:(LWhereAreYouFromType)whereAreYouFrom {
//    objc_setAssociatedObject(self, keykLControllerWhereFrom, [NSNumber numberWithInteger:whereAreYouFrom], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (LWhereAreYouFromType)whereAreYouFrom {
//    return [objc_getAssociatedObject(self, keykLControllerWhereFrom) integerValue];
//}
//
//- (void)setL_DictParams:(NSDictionary *)l_DictParams {
//    objc_setAssociatedObject(self, keykLControllerParams, l_DictParams, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//- (NSDictionary *)l_DictParams {
//    return objc_getAssociatedObject(self, keykLControllerParams);
//}
//
//@end
//
//#pragma mark - LHomeViewController完全不影响HomeViewController，仅仅添加了是否登录
//#import "EnterTainMentController.h"
//#import "LLoginNetHelper.h"
////
//
//@interface LEnterTainMentController : EnterTainMentController
//@end
//@implementation LEnterTainMentController
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    
//    if ( LoginAlready() == NO) {
//        [LLoginNetHelper LoginWithParams:nil];
//    } else {
//        [[NSNotificationCenter defaultCenter] postNotificationName:lNotificationHomeServerLoginSuccess object:nil];
//    }
//}
//
//@end
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
