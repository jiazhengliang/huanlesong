//
//  jzlView.h
//  LXGGView
//
//  Created by jonejia on 2018/5/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+FTCornerdious.h"
#import "UIView+Frame.h"
#import "LxButton.h"
//#import "MSSBrowseDefine.h"

#import "UIColor+Expanded.h"
#define kTableViewRowHeight 260
#define kCollectionCellWidth 80
#define kCollectionCellHeight 80
#define kTableViewHeaderHeight 40*KWIDTH
#define kTableViewRecommendHeaderHeight 35
#define kPadding 12
@interface jzlView : UIView
@property(nonatomic,strong)NSMutableArray *imageA;//必须是不可变数组（可传入，返回的是UIImage的数组）接受NSData, UIImage ,NSString的集合
@property(nonatomic,assign)NSInteger maxCount;//最多个数
@property(nonatomic,weak)UIViewController *currentVc;//


/**
 是否是从新鲜事进入的  
 */
@property(nonatomic,assign)BOOL isImageBes;//
@property (nonatomic,strong) UIButton *locationBtn;
@property (nonatomic,strong) UIButton *deleteBtn;


@property(nonatomic,assign)BOOL isWebUrl;//最多剩余图片个数
@property(nonatomic,assign)CGSize imageSize;

@property(nonatomic,assign)BOOL isSelect3rdPicker;//默认是原生的,可以选择TZlPicker
@property(nonatomic,strong)NSMutableArray *imageAIsBes;//必须是不可变数组（可传入，返回的是UIImage的数组）接受NSData, UIImage ,NSString的集合

//-(void)beginLayout;//开始布局


@property(nonatomic,assign)CGFloat totalH;
@end
