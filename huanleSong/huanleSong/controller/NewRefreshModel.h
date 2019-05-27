//
//  NewRefreshModel.h
//  huanLeSong
//
//  Created by mitko on 2018/5/31.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"

@interface NewRefreshModel : NSObject


@property (nonatomic,copy) NSString *play_url;

@property (nonatomic,assign) NSInteger IsAuth_Anchor;
@property (nonatomic,copy) NSString *HeadImaBig;
@property (nonatomic,copy) NSString *HeadImaSmall;
@property (nonatomic,copy) NSString *IsVip;
@property (nonatomic,copy) NSString *FreshCity;
@property (nonatomic,copy) NSString *LoveCount;
@property (nonatomic,copy) NSString *FreshTitle;
@property (nonatomic,assign) NSInteger Sex;
@property (nonatomic,assign) NSInteger LocationX;
@property (nonatomic,assign) NSInteger CommentCount;
@property (nonatomic,copy) NSArray *FreshImages;
@property (nonatomic,copy) NSArray *FreshVideos;
@property (nonatomic,copy) NSArray *FreshComments;
@property (nonatomic,copy) NSArray *RecommendList;

/**
 0 代表 推荐 1 代表 图片 2 代表视频
 */
@property (nonatomic,assign) NSInteger FreshType;
@property (nonatomic,copy) NSString *Nickname;
@property (nonatomic,copy) NSString *MemberID;
@property (nonatomic,copy) NSString *FreshID;
@property (nonatomic,copy) NSString *RewardCount;
@property (nonatomic,copy) NSString *FreshCountry;
@property (nonatomic,copy) NSString *FreshArea;
@property (nonatomic,copy) NSString *Age;
@property (nonatomic,copy) NSString *FreshProvince;
@property (nonatomic,copy) NSString *FreshCreateTime;
@property (nonatomic,copy) NSString *PhotoCount;
@property (nonatomic,copy) NSString *LocationY;
@property(nonatomic,assign)NSInteger  Distance;
@property(nonatomic,assign) NSInteger VipLevel;

/**
 身高
 */
@property(nonatomic,copy) NSString *Height;// = 168;

/**
 体重
 */
@property(nonatomic,copy) NSString *Weight;// = 0;

@property (nonatomic,copy) NSString *Income;
/**
 MemberRole，用户角色 1普通用户 1001黄金 1002铂金 1003钻石
 */
@property(nonatomic,copy) NSString *MemberRole;

@property(nonatomic,copy) NSString *Business;

@property(nonatomic,assign) NSInteger IsUpvote;

@property(nonatomic,copy) NSString *City_Often;//常去地
@property(nonatomic,copy) NSString *FreshBusiness;//商圈
@property(nonatomic,copy) NSString *Profession; //职业

@end


@interface PublishFreshImage : NSObject
@property (nonatomic,copy) NSString *IsAuth;
@property (nonatomic,copy) NSString *PhotoPathSmall;
@property (nonatomic,copy) NSString *PhotoWidth;
@property (nonatomic,copy) NSString *IsPrivate;
@property (nonatomic,copy) NSString *PhotoHeight;
@property (nonatomic,copy) NSString *PhotoPath;
@property (nonatomic,copy) NSString *PhotoID;
@property (nonatomic,copy) NSString *Sort;
@end

@interface FreshVideo : NSObject
@property (nonatomic,copy) NSString *VideoType ;
@property (nonatomic,copy) NSString *Price;
@property (nonatomic,copy) NSString *VideoName;
@property (nonatomic,copy) NSString *VideoPath;
@property (nonatomic,copy) NSString *VideoCoverPath;


@end
@interface Recommend : NSObject
@property (nonatomic,copy) NSString *MemberID ;
@property (nonatomic,copy) NSString *Nickname;
@property (nonatomic,copy) NSString *HeadImageSmall;
@property (nonatomic,copy) NSString *HeadImageBig;
@property(nonatomic,assign) NSInteger IsAuth_Anchor;//


@end

@interface FreshCommen : NSObject
@property (nonatomic,copy) NSString *CommentID ;
@property (nonatomic,copy) NSString *ReviewContent;
@property (nonatomic,copy) NSString *LoveCount;
@property (nonatomic,copy) NSString *MemberID;

@property (nonatomic,assign) NSInteger IsAuth_Anchor;
@property (nonatomic,copy) NSString *HeadImageSmall;
@property (nonatomic,copy) NSString *Nickname;
@property (nonatomic,copy) NSString *VipLevel;
@property (nonatomic,copy) NSString *Sex;
@property (nonatomic,copy) NSString *Age;
@property (nonatomic,assign) NSInteger IsUpvote;
@property (nonatomic,copy) NSString *CreateTime;

@end

