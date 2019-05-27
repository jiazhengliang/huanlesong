//
//  CustomBaseViewController.h
//  huanleSong
//
//  Created by mac on 2019/5/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomNavigationBarView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomBaseViewController : UIViewController
@property (nonatomic,strong) UIButton *leftBtn;
@property (nonatomic,strong) UIButton *rightBtn;
@property(nonatomic,strong)CustomNavigationBarView *barView;

@property (strong,nonatomic) UIView *dataView;

-(void)setNavigationBarLeftView:(UIView *)view;

-(void)setNavigationBarRightView:(UIView *)view;

-(void)setNavigationBarTitleView:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
