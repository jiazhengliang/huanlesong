//
//  FreshHeaderView.h
//  huanLeSong
//
//  Created by jonejia on 2018/10/24.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HomeHeaderView.h"
#import "IconImageView.h"
#import "NewRefreshModel.h"
@protocol HomeHeaderViewDelegate <NSObject>

-(void)didHomeHeaderViewClickIcon:(NSString *)loginName  Cell:(UITableViewCell *)cell;


@end
@interface FreshHeaderView : UIView

/**
 头像
 */
@property (nonatomic, strong) IconImageView *iconImagView;


@property (nonatomic, strong) UIImageView *authImageView;

/**
 昵称
 */
@property (nonatomic, strong) UILabel *nickName;

/**
 定位
 */
@property (nonatomic, strong) UIButton *localBtn;


@property (nonatomic, strong) UIButton *moreBtn;

@property (nonatomic, weak) id<HomeHeaderViewDelegate> dateDelegate;


@property (nonatomic, strong) UITableViewCell *cell;

-(instancetype)initWithFrame:(CGRect)frame;


-(void)fillWithfrashModel:(NewRefreshModel *)refrashModel;

@end
