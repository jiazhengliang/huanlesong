//
//  UIView+XYConvenience.m
//  WisePal
//
//  Created by sunon002 on 15-5-4.
//  Copyright (c) 2015年 Jet.Luo. All rights reserved.
//

#import "UIView+XYConvenience.h"

@implementation UIView (XYConvenience)

#pragma mark - frame简易方式
- (CGFloat)frameX {
    return self.frame.origin.x;
}
- (CGFloat)frameY {
    return self.frame.origin.y;
}
- (CGFloat)frameWidth {
    return self.frame.size.width;
}
- (CGFloat)frameHeight {
    return self.frame.size.height;
}
- (CGFloat)frameMarginVertical {
    UIView *superView = [self superview];
    return superView.frameHeight-self.frameHeight;
}
- (CGFloat)frameMarginHorizontal {
    UIView *superView = [self superview];
    return superView.frameWidth-self.frameWidth;
}
- (CGPoint)frameOrigin {
    return self.frame.origin;
}
- (CGSize)frameSize {
    return self.frame.size;
}
- (void)setFrameX:(CGFloat)newX {
    self.frame = CGRectMake(newX, self.frame.origin.y,
                            self.frame.size.width, self.frame.size.height);
}
- (void)setFrameY:(CGFloat)newY {
    self.frame = CGRectMake(self.frame.origin.x, newY,
                            self.frame.size.width, self.frame.size.height);
}
- (void)setFrameWidth:(CGFloat)newWidth {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            newWidth, self.frame.size.height);
}
- (void)setFrameHeight:(CGFloat)newHeight {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            self.frame.size.width, newHeight);
}
- (void)setFrameOrigin:(CGPoint)newOrigin {
    self.frame = CGRectMake(newOrigin.x, newOrigin.y, self.frame.size.width, self.frame.size.height);
}
- (void)setFrameSize:(CGSize)newSize {
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y,
                            newSize.width, newSize.height);
}
- (CGFloat)frameMaxX {
    return self.frame.size.width+self.frame.origin.x;
}
- (CGFloat)frameMaxY {
    return self.frame.size.height+self.frame.origin.y;
}

#pragma mark - 有否包含...
- (BOOL)containsSubView:(UIView *)subView {
    for (UIView *view in [self subviews]) {
        if ([view isEqual:subView]) {
            return YES;
        }
    }
    return NO;
}

- (BOOL)containsSubViewOfClassType:(Class)_class {
    for (UIView *view in [self subviews]) {
        if ([view isMemberOfClass:_class]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - 设置圆角
- (void)setViewRadius:(CGFloat)cordines {
    self.layer.masksToBounds=YES;
    self.layer.cornerRadius=cordines;
}
- (void)setViewCircle {
    self.clipsToBounds = YES;
    CGFloat short_wh = MIN(self.frame.size.height, self.frame.size.width);
    [self setViewRadius:short_wh/2.0];
}
- (void)addCorners:(UIRectCorner)corners{
    
    [self updateConstraintsIfNeeded];
    [self layoutIfNeeded];
    if (self.layer.mask) {
        [self.layer.mask removeFromSuperlayer];
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(5, 5)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}
//为指定的边加圆角
- (void)addCorners:(UIRectCorner)corners withRadius:(CGFloat)radius{
    
    if (CGRectEqualToRect(CGRectZero, self.frame)) {
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
    }
    
    if (self.layer.mask) {
        [self.layer.mask removeFromSuperlayer];
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}


//为指定的边加圆角
-(void)addCornersTopWithRadius:(CGFloat)radius
{
    
    if (CGRectEqualToRect(CGRectZero, self.frame)) {
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
    }
    
    if (self.layer.mask) {
        [self.layer.mask removeFromSuperlayer];
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight) cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}


//为指定的边加圆角
- (void)addCornersBottomWithRadius:(CGFloat)radius
{
    
    if (CGRectEqualToRect(CGRectZero, self.frame)) {
        [self updateConstraintsIfNeeded];
        [self layoutIfNeeded];
    }
    
    if (self.layer.mask) {
        [self.layer.mask removeFromSuperlayer];
    }
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomLeft|UIRectCornerBottomRight) cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    [self.layer setMasksToBounds:YES];
}

#pragma mark - 设置阴影
- (void)setViewShadow:(UIColor *)shadowColor {
    if(!shadowColor) {
        self.layer.shadowColor  = [UIColor clearColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(0, 0);
        self.layer.shadowOpacity= 0;
    } else {
        self.layer.shadowColor  = shadowColor.CGColor;
        self.layer.shadowOffset = CGSizeMake(0, -1);
        self.layer.shadowOpacity= 0.2;
    }
}

- (void)setViewCornerRadius:(CGFloat)shadowWidth Shadow:(UIColor *)shadowColor {
    if(!shadowColor) {
        self.layer.shadowColor  = [UIColor clearColor].CGColor;
        self.layer.shadowOffset = CGSizeMake(-2, 2);
        self.layer.shadowOpacity= 0;
        self.layer.cornerRadius = shadowWidth;
        self.layer.shadowRadius = shadowWidth;
    } else {
        self.layer.shadowColor  = shadowColor.CGColor;
        self.layer.shadowOpacity= 0.5;
        self.layer.shadowOffset = CGSizeMake(-2, 2);
        self.layer.cornerRadius = shadowWidth;
        self.layer.shadowRadius = shadowWidth;
    }
    self.layer.masksToBounds = YES;
    self.clipsToBounds = NO;
}

- (void)setViewBlackShadow {
    [self setViewShadow:[UIColor blackColor]];
}

#pragma mark - 添加边框
- (void)setViewBorder:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth=borderWidth;
    self.layer.borderColor=borderColor.CGColor;
}
- (void)setViewBorder0_5:(UIColor *)borderColor {
    self.layer.borderWidth=0.5;
    self.layer.borderColor=borderColor.CGColor;
}
- (void)setViewGrayBorder {
    [self setViewBorder:[UIColor grayColor] borderWidth:0.5];
}

#pragma mark - 找到控制器
- (UIViewController *)accordingViewfindViewController {
    UIResponder *nextResponder = [self nextResponder];
    while (![nextResponder isKindOfClass:[UIViewController class]]&&nextResponder) {
        nextResponder=[nextResponder nextResponder];
    }
    return (UIViewController *)nextResponder;
}
- (UINavigationController *)accordingViewfindNavigationViewController {
    return [[self accordingViewfindViewController] navigationController];
}

#pragma mark - 寻找View
//-- 在子视图中找到获得焦点的View
- (UIView *)findFirstResponderOfTheView {
    UIView *firstResponder = nil;
    NSArray *subviews = self.subviews;
    for(UIView *view in subviews) {
        if([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UITextView class]])
        {
            if([view isFirstResponder]) {
                firstResponder = view;
                break;
            }
        }
        firstResponder = [view findFirstResponderOfTheView];
        if(firstResponder) {
            break;
        }
    }
    return firstResponder;
}

- (UIView *)findSuperviewOfClasstype:(Class)cla {
    UIView *cell = self.superview;
    while (![cell isKindOfClass:cla]) {
        cell = [cell superview];
    }
    return cell;
}
- (UIView *)findSubViewOfClasstype:(nonnull Class)cla {
    UIView *cla_view = nil;
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:cla]) {
            cla_view = view;
            break;
        }
        cla_view = [view findSubViewOfClasstype:cla];
        if ([cla_view isKindOfClass:cla]) {
            break;
        }
    }
    return cla_view;
}

#pragma mark - 添加任意一边的边框

-(UIView *)addTopBorderWithColor:(UIColor *)color
                        andWidth:(CGFloat) borderWidth {
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    [self addSubview:border];
    __weak typeof(self) weakself = self;
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakself.mas_top);
        make.height.mas_equalTo(borderWidth);
        make.left.mas_equalTo(0);
        make.right.equalTo(weakself.mas_right);
    }];
    return border;
}

-(nonnull UIView *)addBottomBorderWithColor:(UIColor * _Nonnull)color
                                   andWidth:(CGFloat)borderWidth
                              leftAttribute:(MASViewAttribute * _Nonnull)leftAttribute {
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    [self addSubview:border];
    __weak typeof(self) weakself = self;
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom);
        make.height.mas_equalTo(borderWidth);
        make.left.equalTo(leftAttribute);
        make.right.equalTo(weakself.mas_right);
    }];
    return border;
    
    return [UIView new];
}

-(UIView *)addBottomBorderWithColor:(UIColor *)color
                           andWidth:(CGFloat)borderWidth
                        leftPadding:(CGFloat)padding {
    return [self addBottomBorderWithColor:color
                                 andWidth:borderWidth
                              leftPadding:padding
                             rightPadding:0];
}
-(UIView *)addBottomBorderWithColor:(UIColor * _Nonnull)color
                           andWidth:(CGFloat) borderWidth
                        leftPadding:(CGFloat)padding
                       rightPadding:(CGFloat)r_padding {
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    [self addSubview:border];
    __weak typeof(self) weakself = self;
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(weakself.mas_bottom);
        make.height.mas_equalTo(borderWidth);
        make.left.mas_equalTo(padding);
        make.right.equalTo(weakself.mas_right).offset(r_padding);
    }];
    return border;
}
-(UIView *)addBottomBorderWithColor:(UIColor *)color
                           andWidth:(CGFloat) borderWidth {
    return [self addBottomBorderWithColor:color
                                 andWidth:borderWidth
                              leftPadding:0];
}
-(UIView *)addLeftBorderWithColor:(UIColor *)color
                         andWidth:(CGFloat) borderWidth {
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    [self addSubview:border];
    __weak typeof(self) weakself = self;
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(borderWidth);
        make.left.mas_equalTo(0);
        make.bottom.equalTo(weakself.mas_bottom);
    }];
    return border;
}
-(UIView *)addRightBorderWithColor:(UIColor *)color
                          andWidth:(CGFloat) borderWidth {
    return [self add0_5RightBorderWithColor:color
                                      width:borderWidth
                            paddingVertical:0];
}
-(UIView *)add0_5RightBorderWithColor:(UIColor *)color
                                width:(CGFloat)borderWidth
                      paddingVertical:(CGFloat)pVertical {
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    border.tag =333;
    [self addSubview:border];
    __weak typeof(self) weakself = self;
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(pVertical);
        make.width.mas_equalTo(borderWidth);
        make.right.equalTo(weakself.mas_right);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(-pVertical);
    }];
    return border;
}


-(nonnull UIView *)addRightBorderWithColor:(UIColor * _Nonnull)color
                                  andWidth:(CGFloat)border_w
                                      edge:(UIEdgeInsets)edgeinsets {
    UIView *border = [[UIView alloc] init];
    border.backgroundColor = color;
    border.tag =333;
    [self addSubview:border];
    __weak typeof(self) weakself = self;
    [border mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(edgeinsets.top);
        make.width.mas_equalTo(border_w);
        make.right.equalTo(weakself.mas_right).with.offset(edgeinsets.right);
        make.bottom.equalTo(weakself.mas_bottom).with.offset(edgeinsets.bottom);
    }];
    return border;
}

#pragma mark - 快照、空
- (UIImage *)snapshotImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


#pragma mark - 数据为空时
- (UIButton *)insertBoundsNewView_image:(UIImage *)image
                               withText:(NSString *)text {
    UIView *superView = self;
    UIView *insertView = [superView viewWithTag:333343];
    [insertView removeFromSuperview];
    insertView =  [[UIView alloc] init];
    insertView.tag = 333343;
    [superView addSubview:insertView];
    /*
    [insertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(superView);
        make.width.equalTo(superView);
        make.height.equalTo(superView);
        make.centerX.equalTo(superView);
    }];*/
    insertView.frame = self.bounds;
    insertView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    XYVerticalButton *xyButton = [XYVerticalButton buttonWithType:UIButtonTypeCustom];
    [insertView addSubview:xyButton];
    [xyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(160);
        make.width.mas_equalTo(160);
        make.center.equalTo(insertView);
    }];
    xyButton.backgroundColor = [UIColor clearColor];
    if(text) {
        [xyButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [xyButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
        [xyButton setTitle:text forState:UIControlStateNormal];
        [xyButton.imageView setContentMode:UIViewContentModeCenter];
        [xyButton setImage:image forState:UIControlStateNormal];
    } else {
        [xyButton setContentMode:UIViewContentModeCenter];
        [xyButton setBackgroundImage:image forState:UIControlStateNormal];
    }
    return xyButton;
}
- (void)removeBoundsNewView_image {
    UIView *superView = self;
    UIView *insertView = [superView viewWithTag:333343];
    if(insertView) {
        [insertView removeFromSuperview];
    }
}

@end

@implementation XYVerticalButton

-(void)layoutSubviews {
    [super layoutSubviews];
    
    // Center image
    CGPoint center = self.imageView.center;
    center.x = self.frame.size.width/2;
    center.y = self.imageView.frame.size.height/2;
    self.imageView.center = center;
    
    //Center text
    CGRect newFrame = [self titleLabel].frame;
    newFrame.origin.x = 0;
    newFrame.origin.y = self.imageView.frame.size.height + 5;
    newFrame.size.width = self.frame.size.width;
    
    self.titleLabel.frame = newFrame;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

@end
