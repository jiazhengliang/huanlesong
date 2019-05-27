//
//  LMacrosGenerator.h
//  huanLeSong
//
//  Created by 印丹 on 2018/5/14.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#ifndef LMacrosGenerator_h
#define LMacrosGenerator_h

#define LSerializationString(str) NSEaseLocalizedString(str, nil)

//*Block******************************
#define LSafeBlock(block, ...) if (block) { block(__VA_ARGS__); };

#define LWeakify(var) \
try {} @catch (...) {} \
__weak __typeof__(var) var ## _weak = var

#define LStrongify(var) \
try {} @catch (...) {} \
__strong __typeof__(var) var = var ## _weak

//*设备******************************
#define LIsiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

//*UI******************************
#define LScreen [UIScreen mainScreen].bounds
#define LScreenScale [UIScreen mainScreen].scale
#define LAutoSize(size) size //(size * [UIScreen mainScreen].scale / 2.0)
#define LViewLeftSpacingInScreen 18
#define LLoginLeftSpacing LAutoSize(60)      //(60*KWIDTH)类似登录Button按钮的左间距
#define LLoginLoginButtonHeight LAutoSize(40)//(40*KWIDTH)类似登录Button按钮的高度
#define LStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
#define LNavigationBarHeight 44
#define LViewRadius 4.0
#define LThemeColor LLUIColorFromRGBVlaue(255, 53, 116) //主题颜色

//
#define LEmojiFont [UIFont fontWithName:@"AppleColorEmoji" size:32.0]

//*操作方式******************************
#define LUIControlEventTouchWay UIControlEventTouchDown
#define LAnimateWithDuration 0.35

//*NSString******************************
#define LStringInt(x) [NSString stringWithFormat:@"%li",(long)x]
#define LStringDouble(x) [NSString stringWithFormat:@"%lf",x]
#define LNumberInteger(x) [NSNumber numberWithInteger:x]
#define LStringFloat02(x) [NSString stringWithFormat:@"%0.2f",x]

//*测试******************************
#define LDeveloperTest 0     //
#define LShowViewFrameTest 0 //显示View的边框
#define LUseIM 1             //0：屏蔽IM部分

//*提示******************************
#define kErrorMsgRtmpPlayFailed @"视频流播放失败，Error:"
#define kVideoChattingOffline   @"你有一个视频正在。。"//@"CaoLiChun，You have a 来电！"

//*打印******************************
#define LPrintEdgeInsets(x) NSLog(@"UIEdgeInsets : %f,%f,%f,%f",x.top,x.left,x.bottom,x.right)
//#define LPrintEdgeInsets(x) NSLog(@"UIEdgeInsets : %f,%f,%f,%f",x.top,x.left,x.bottom,x.right)


#endif /* LMacrosGenerator_h */
