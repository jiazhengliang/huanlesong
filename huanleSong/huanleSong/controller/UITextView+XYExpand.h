//
//  UITextView+XYExpand.h
//  huanLeSong
//
//  Created by 印丹 on 2018/5/21.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextView (XYExpand)


#pragma mark - 给UITextView添加placeholder属性
//来源：https://github.com/wangziwu/ZWPlaceHolder

/**
 *  UITextView+placeholder
 */
@property (nonatomic, copy) NSString *zw_placeHolder;
/**
 *  IQKeyboardManager等第三方框架会读取placeholder属性并创建UIToolbar展示
 */
@property (nonatomic, copy) NSString *placeholder;
/**
 *  placeHolder颜色
 */
@property (nonatomic, strong) UIColor *zw_placeHolderColor;

@end
