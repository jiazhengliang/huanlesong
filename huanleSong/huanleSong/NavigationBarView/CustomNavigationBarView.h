//
//  CustomNavigationBarView.h
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macros.h"
#import "MacroDefinition.h"
#import "InitializationUIMethod.h"
#import "LMacrosGenerator.h"

@interface CustomNavigationBarView : UIView
-(void)setTitle:(NSString *)string;
-(void)setTitleColor;

-(void)setTitleWithAttributedString:(NSAttributedString*)string;//包含富文本的标题

-(void)setLeftButton:(UIButton *)button;

-(void)setRightButton:(UIButton *)button;
-(UIButton *)getRightButton;

-(void)setLeftView:(UIView *)view;

-(void)setRightView:(UIView *)view;

-(void)setTitleView:(UIView *)view;

-(UIView *)getTitleView;

-(void)setSepetorLineHidden:(BOOL)hidden;

@end
