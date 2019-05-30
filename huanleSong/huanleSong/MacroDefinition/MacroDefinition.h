//
//  MacroDefinition.h
//  huanLeSong
//
//  Created by 印丹 on 2018/5/11.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#ifndef MacroDefinition_h
#define MacroDefinition_h

// 判断是否为iPhone X 系列  这样写消除了在Xcode10上的警告。
#define IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#define RGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]

#define HexRGBAlpha(rgbValue,a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]
#define RGBAlpha(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(1)]

#define NavigationBarColor [UIColor colorWithRed:233/255.0 green:118/255.0 blue:20/255.0 alpha:1]
#define NavigationBarShadowColor [UIColor blackColor]
#define NavigationBarWidth screen_width
#define NavigationBarHeight (CGFloat)(IPHONE_X?(88.0):(64.0))

#define NavigationBarTitleFont [UIFont systemFontOfSize:17*KWIDTH]
#define NavigationBarTitleColor BlackCustomColor

#define IsNeedDes  YES


#define segmentHeight 45*KWIDTH

#define Content_Y 64
#define Header_Y 55
#define Content_Height [[UIScreen mainScreen] bounds].size.height-64
#define app_version  @"1.0"

#define pictureWidth (screen_width- 55)/5
#define TabBar_Height 50
//屏幕的宽
#define screen_width [UIScreen mainScreen].bounds.size.width
//屏幕的高
#define screen_height [UIScreen mainScreen].bounds.size.height
//屏幕尺寸比
#define SCREEN_RATIO [UIScreen mainScreen].bounds.size.width/320.0

#define SCREEN_RATIO_IPHONE6 [UIScreen mainScreen].bounds.size.width/375.0

#define ISIPHONE6PLUS (([UIScreen mainScreen].bounds.size.width==414)?(YES):(NO))
#define ISIPHONE6 (([UIScreen mainScreen].bounds.size.width>320)?(YES):(NO))
#define ISIPHONE4 (([UIScreen mainScreen].bounds.size.height == 480)?(YES):(NO))
#define ISIPHONE5 (([UIScreen mainScreen].bounds.size.height == 568)?(YES):(NO))

#define KWIDTH screen_width/375
//#define KWIDTH 1

#define KHeight screen_height/568
#define lineHight 0.5


#define versionNo  1
#define MARGIN 5

#define LWORD_FONT_SIZE 14.0f
#define SWORD_FONT_SIZE 12.0f
#define DESC_FONT_SIZE  11.0f
//图片缓存的最大缓存量
#define image_max_cache_size 500 * 1024 * 1024
//内存大小
#define memory_capacity 4 * 1024 * 1024
//物理内存大小
#define disk_capacity 20 * 1024 * 1024

#define url_go_to_iTunes @"https://itunes.apple.com/cn/app/id1389653534?mt=8"


#define Allow_Local_Server @"请允许我们访问你的位置，我们会为您提供更好的服务!开启位置请到系统[设置]->[隐私]->[定位服务]中开启定位服务！"

//腾讯云图片
#define kPictureSecretID @"AKIDTBpJerAFYky50kn1mTGyVsEh5TyJ2bbQ"

#define kPictureSecretKey @"zngS3gCoKkzPkwwxY4QdeWFsMfnFl7NS"
#define kPictureAppID @"1257277514"
#define kPictureRegion @"ap-guangzhou"
#define kPictureBucket @"miumiu-1257277514"

//极光推送配置
#define kJPushAppKey  @"cb6afc482c0c55cd52485793"
#define kJPushChannel  @"AppStoremiaomiao"
//环信
#define HangXingAppKey @"1190180912146644#miaomiao"

#define HangXingApnsCertNameDevelop @"hxApnsDevelop"
#define HangXingApnsCertNamePublic @"hxApnsPublic"


//新浪微博key
#define WEIBO_KEY             @"18359204"
//腾讯qq key
#define TENCENT_KEY           @"1106968924"
//微信key
#define WECHAT_APP_KEY        @"wx8d024c5351b07056"
//#define WECHAT_APP_KEY        @"wx650d2e48a7de5130"

//#define WECHAT_APP_SECRET     @"266fcd1202a0d6562c722d42a1e413ce"
#define WECHAT_APP_SECRET     @"8a6fd65576835352c2d0ca964955b031"
#define Alipay_APP_Scheme        @"ap2018062160390719"

#define Alipay_APP_Login_Scheme        @"aplogin2018062160390719"

#define kCoinName @"妙妙"


//加密参数
#define AppTokenString @"m^nf#R1r&Fe"

//tabbar切换通知
#define changeTabBarNotification @"changeTabBarNotification"

#define buttonBgColor  HexRGBAlpha(0x4e6cef,1)

#define buttonBgCancelColor  HexRGBAlpha(0xBFBFBF,1)


//#define NavigationBarColor [UIColor whiteColor]

#define j_titleColor HexRGBAlpha(0xffffff,1)

#define lineBgColor HexRGBAlpha(0x3d4750,1)

#define titleMeColor HexRGBAlpha(0x292a2a,1)

#define titleResignColor HexRGBAlpha(0x3893f9,1)


#define fontPingFang @"PingFangSC-Regular"
#define tableCellLineColor HexRGBAlpha(0xededed,1)

//navBar文字颜色
#define navbar_titletext_color RGBColor(51,51,51)
#define BlackCustomColor    HexRGBAlpha(0x464646,1)

#define buyDetailBackColor HexRGBAlpha(0xf5f5f5,1)

#define titleBuyDetail HexRGBAlpha(0x0A0909,1)
#define titleBuyHeader HexRGBAlpha(0x272323,1)
#define titleBuyHeaderDetail HexRGBAlpha(0x4e6cef,1)
#define titleLightTitle HexRGBAlpha(0x747272,1)



//left delete 图标 ios 60px
//小图标 ios 40px
//最小图标 30px

//#f6f6f6

#define sizeWithText(text,attribute,maxSize) [text boundingRectWithSize:maxSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size


#define systemVersionGreaterOrEqualThan(version) ([[[UIDevice currentDevice] systemVersion] floatValue] >= version)


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#define debugMethod() NSLog(@"%s", __func__)
#else
#define NSLog(...)
#define debugMethod()
#endif


#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif


#endif /* MacroDefinition_h */
