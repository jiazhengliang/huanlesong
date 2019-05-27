////
////  LMediatorForController.h
////  huanLeSong
////
////  Created by 印丹 on 2018/5/14.
////  Copyright © 2018年 Wendy China. All rights reserved.
////
//
//#import <Foundation/Foundation.h>
//
//@interface LCallbackModel : NSObject
//@property(nonatomic,strong) UIViewController *vc;
//@property(nonatomic,strong) NSDictionary *params;
//@property(nonatomic,strong) id object;
//+ (LCallbackModel *)create:(UIViewController *)VC;
//+ (LCallbackModel *)create:(UIViewController *)VC param:(NSDictionary *)Dict;
//+ (LCallbackModel *)create:(UIViewController *)VC objectParam:(id)object;
//+ (LCallbackModel *)create:(UIViewController *)VC param:(NSDictionary *)Dict objectParam:(id)object;
//
//@end
//
//#import "LFactoryRootController.h"
//#import "LFactoryCommonController.h"
//
//#define LMeiatorCallbackKey @"BlockParam"
//typedef void(^LMeiatorCallback)(id id_obj,NSObject *object);
//#define LCallbackKey @"LCallbackKey"
//typedef void(^LCallback)(LCallbackModel *model);
//
//@interface UIViewController (LControllerTag)
//@property(nonatomic,assign) kLControllerTag kCTag;
//@property(nonatomic,assign) LWhereAreYouFromType whereAreYouFrom;
//@property(nonatomic,copy,nullable) NSDictionary *l_DictParams;
//@end
//
//@interface LMediatorForController : NSObject {
//@private
//    __weak UIViewController *currentController;        //当前VC
//    __weak UIViewController *beforeController;  //前一个VC
//    kLControllerTag beforeControllerTag;        //前一个VC的Tag
//}
//
//@property(nonatomic,weak  ,nullable) UIViewController *currentController;
//@property(nonatomic,weak  ,nullable) UIViewController *beforeController;
//@property(nonatomic,assign,readonly) kLControllerTag beforeControllerTag;
//@property(nonatomic,assign,readwrite)BOOL useAnimated;
//@property(nonatomic,assign,readwrite)BOOL hidsTabBar;
//+ (nonnull instancetype)sharedInstance;
//
//#pragma mark - 设置根控制器（主页、登录）
//+ (void)setRootViewControllerOfApp;
//+ (void)enterHome;
//+ (void)enterLogin;
//
//#pragma mark - 侧滑返回回调，调用popViewController返回
//+ (nullable UIViewController *)callbackPopViewController:(UIViewController * _Nonnull)rootViewController;
//+ (void)popViewController:(UIViewController * _Nonnull)whoPop;
//+ (void)dismissViewController:(UIViewController * _Nonnull)whoDismiss;
//+ (void)returnToTheParentPage:(UIViewController * _Nonnull)returnedBy;
//
///*
// kCTag为UIViewController(不含其子类)的值。
// params为传递给kCTag为UIViewController的参数。
// 如果kCTag所指的UIViewController已经存在就跳转到该UIViewController。
// 如果kCTag所指的UIViewController不在缓存中，就PUSH或PRESENT。
// 假定：currentController.navigationController为A。
//      kCTag的UIViewController.navigationController为B。
// 如果B != nil,则PRESENT；
// 如果A == nil && B == nil,则PRESENT；
// 如果A != nil && B == nil,则PUSH；
// */
//+ (void)toControllerKCTag:(kLControllerTag)kCTag;
//+ (void)toControllerKCTag:(kLControllerTag)kCTag
//               parameters:(NSDictionary * _Nullable)params;
//
///*
// kCTag为UIViewController(不含其子类)的值。
// params为传递给kCTag为UIViewController的参数。
// */
//+ (void)pushControllerKCTag:(kLControllerTag)kCTag;
//+ (void)pushControllerKCTag:(kLControllerTag)kCTag
//                 parameters:(NSDictionary * _Nullable)params;
//
///*
// kCTag为UIViewController(不含其子类)的值。
// params为传递给kCTag为UIViewController的参数。
// */
//+ (void)presentControllerKCTag:(kLControllerTag)kCTag;
//+ (void)presentControllerKCTag:(kLControllerTag)kCTag
//                    parameters:(NSDictionary * _Nullable)params;
//
//
///* viewController需要事先设置kCTag值 */
//+ (void)toController:(UIViewController *_Nonnull)viewController;
//+ (void)toController:(UIViewController *_Nonnull)viewController
//          parameters:(NSDictionary * _Nullable)params;
//
//+ (void)pushController:(UIViewController *_Nonnull)viewController;
//+ (void)pushController:(UIViewController *_Nonnull)viewController
//            parameters:(NSDictionary * _Nullable)params;
//
//+ (void)presentController:(UIViewController *_Nonnull)viewController;
//+ (void)presentController:(UIViewController *_Nonnull)viewController
//               parameters:(NSDictionary * _Nullable)params;
//
//
//#pragma mark - 提示
//+ (void)testAlertWithMessage:(NSString *)message;
//+ (void)alertWithMessage:(NSString *)message;
//+ (void)showMessage:(NSString *)message;
//+ (UIViewController *)currVC;
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
