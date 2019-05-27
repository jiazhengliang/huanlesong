//
//  SquareUserInfoHeaderView.h
//  huanLeSong
//
//  Created by mitko on 2018/5/16.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewRefreshModel;

typedef NS_ENUM(NSInteger,HeadType){
    SQUARE,//广场
    CERTIFIED,//认证
    DYNAMICDETAIL,//新鲜事详情
};

@interface SquareUserInfoHeaderView : UIView

-(instancetype)initWithFrame:(CGRect)frame headType:(HeadType)headType;

@property (nonatomic,strong) NewRefreshModel *squareModel;

@property (nonatomic,assign) BOOL isTest;

//-(void)fillWithModel:(NearAuthModel *)model;

@property (nonatomic,assign) HeadType headType;


@end
