//
//  UIView+XYConvenience.h
//  WisePal
//
//  Created by sunon002 on 15-5-4.
//  Copyright (c) 2015年 Jet.Luo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XYConvenience)

#pragma mark - frame简易方式
@property (nonatomic) CGFloat frameX;
@property (nonatomic) CGFloat frameY;
@property (nonatomic) CGFloat frameWidth;
@property (nonatomic) CGFloat frameHeight;
@property (nonatomic) CGPoint frameOrigin;
@property (nonatomic) CGSize  frameSize;
@property (nonatomic,readonly) CGFloat frameMarginVertical;
@property (nonatomic,readonly) CGFloat frameMarginHorizontal;
- (CGFloat)frameMaxX;
- (CGFloat)frameMaxY;

#pragma mark - 有否包含...
- (BOOL)containsSubView:(UIView * _Nonnull)subView;
- (BOOL)containsSubViewOfClassType:(nonnull Class)_class;

#pragma mark - 设置圆角
- (void)setViewCircle;
- (void)setViewRadius:(CGFloat)cordines;

//-- 为指定的边加圆角，默认半径5
- (void)addCorners:(UIRectCorner)corners;
//-- 为指定的边加圆角
- (void)addCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;

#pragma mark - 设置阴影
//-- 传参nil,表示不使用阴影
- (void)setViewShadow:(UIColor * _Nonnull)shadowColor;
- (void)setViewBlackShadow;


- (void)setViewCornerRadius:(CGFloat)shadowWidth Shadow:(UIColor *)shadowColor;

- (void)addCornersTopWithRadius:(CGFloat)radius;

- (void)addCornersBottomWithRadius:(CGFloat)radius;



#pragma mark - 添加边框
//-- 设置边框为0.5的粗细线条
- (void)setViewBorder0_5:(UIColor * _Nonnull)borderColor;
- (void)setViewGrayBorder;
- (void)setViewBorder:(UIColor * _Nonnull)borderColor
          borderWidth:(CGFloat)borderWidth;


#pragma mark - 找到控制器
- (nonnull UIViewController *)accordingViewfindViewController;
- (nonnull UINavigationController *)accordingViewfindNavigationViewController;

#pragma mark - 寻找View
//-- 在子视图中找到获得焦点的View
- (nullable UIView *)findFirstResponderOfTheView;
//-- 找到类型为cla的父视图
- (nullable UIView *)findSuperviewOfClasstype:(nonnull Class)cla;
//-- 找到类型为cla的子视图
- (nullable UIView *)findSubViewOfClasstype:(nonnull Class)cla;

#pragma mark - 添加任意一边的边框

//新增
-(nonnull UIView *)addBottomBorderWithColor:(UIColor * _Nonnull)color
                                   andWidth:(CGFloat)borderWidth
                              leftAttribute:(MASViewAttribute * _Nonnull)leftAttribute;

//旧
-(nonnull UIView *)addBottomBorderWithColor:(UIColor * _Nonnull)color
                                   andWidth:(CGFloat) borderWidth
                                leftPadding:(CGFloat)padding;

-(nonnull UIView *)addBottomBorderWithColor:(UIColor * _Nonnull)color
                                   andWidth:(CGFloat) borderWidth
                                leftPadding:(CGFloat)padding
                               rightPadding:(CGFloat)r_padding;

-(nonnull UIView *)addBottomBorderWithColor:(UIColor * _Nonnull)color
                                   andWidth:(CGFloat) borderWidth;

-(nonnull UIView *)addLeftBorderWithColor:(UIColor * _Nonnull)color
                                 andWidth:(CGFloat) borderWidth;

-(nonnull UIView *)addRightBorderWithColor:(UIColor * _Nonnull)color
                                  andWidth:(CGFloat) borderWidth;

-(nonnull UIView *)addTopBorderWithColor:(UIColor * _Nonnull)color
                                andWidth:(CGFloat) borderWidth;

-(nonnull UIView *)add0_5RightBorderWithColor:(UIColor * _Nonnull)color
                                        width:(CGFloat)borderWidth
                              paddingVertical:(CGFloat)pVertical;

-(nonnull UIView *)addRightBorderWithColor:(UIColor * _Nonnull)color
                                  andWidth:(CGFloat)border_w
                                      edge:(UIEdgeInsets)edgeinsets;

#pragma mark - 快照
- (nonnull UIImage *)snapshotImage;

#pragma mark - 页面数据为空时，传入Image和Text以提示用户
- (nonnull UIButton *)insertBoundsNewView_image:(UIImage * _Nonnull)image
                                       withText:(NSString * _Nullable)text;
- (void)removeBoundsNewView_image;

@end


@interface XYVerticalButton : UIButton
@end

