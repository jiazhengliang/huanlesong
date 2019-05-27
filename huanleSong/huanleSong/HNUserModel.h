//
//  HNUserModel.h
//  huanleSong
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface HNUserTCIMModel: NSObject

@property (nonatomic, strong) NSString *account;
@property (nonatomic, strong) NSString *account_type;
@property (nonatomic, strong) NSString *app_id;
@property (nonatomic, strong) NSString *sign;
@end

@interface HNUserModel : NSObject


@property (nonatomic, strong) NSString *uid;
@property (nonatomic, strong) NSString *nick;
@property (nonatomic, strong) NSString *avatar;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *gender;  // 性别 1男，2女
@property (nonatomic, strong) NSString *intro;
@property (nonatomic, strong) NSString *level; // 用户等级

/// 主播等级 0为非主播
@property (nonatomic, strong) NSString *live_level;

/// 账户余额
@property (nonatomic, strong) NSString *coin;

/// 收益
@property (nonatomic, strong) NSString *dot;

@property (nonatomic, strong) NSString *follow;
@property (nonatomic, strong) NSString *followed;
/// vip过期时间戳 0为非vip
@property (nonatomic, strong) NSString *vip_expire;
/// 实名认证 0未提交，1审核中，2认证成功 3认证失败
@property (nonatomic, strong) NSString *auth;


#pragma mark  --------------- 杏花雨聊数据
@property (nonatomic,copy)  NSString    *access_token;//用户token
@property (nonatomic,copy)  NSString    *anchor_level;  // 主播等级
@property (nonatomic,copy)  NSString    *anchor_ranking;//     主播排名
@property (nonatomic,copy)  NSString    *user_avatar;// 用户头像
@property (nonatomic,copy)  NSString    *user_birth;//     用户生日
@property (nonatomic,copy)  NSString    *user_coin;//     用户银币
@property (nonatomic,copy)  NSString    *user_collect_total;//     用户收礼总额
@property (nonatomic,copy)  NSString    *user_consume_total;// tal    用户送礼总额
@property (nonatomic,copy)  NSString    *user_dot;// 用户收益
@property (nonatomic,copy)  NSString    *user_exp;//     用户经验
@property (nonatomic,copy)  NSString    *user_fans_total;//     用户粉丝数
@property (nonatomic,copy)  NSString    *user_follow_total;//用户关注数
@property (nonatomic,copy)  NSString    *user_id;// 用户id
@property (nonatomic,copy)  NSString    *user_intro;//     用户简介
@property (nonatomic,copy)  NSString    *user_invite_code;//     用户邀请码
@property (nonatomic,copy)  NSString    *user_invite_total;// 用户邀请人数
@property (nonatomic,copy)  NSString    *user_is_anchor;//     用户是否主播，Y：是，N：否
@property (nonatomic,copy)  NSString    *user_is_certification;// 用户是否认证，Y：是，N：否
@property (nonatomic,copy)  NSString    *user_is_member;// 用户是否会员,Y：是，N：否
@property (nonatomic,copy)  NSString    *user_is_anchor_admin;// 用户是否是管理员；
@property (nonatomic,copy)  NSString    *user_lat;// 用户纬度
@property (nonatomic,copy)  NSString    *user_level;// 用户等级
@property (nonatomic,copy)  NSString    *user_lng;//     用户经度
@property (nonatomic,copy)  NSString    *user_member_expire_time;//     用户会员到期时间 0 表示没有开过会员
@property (nonatomic,copy)  NSString    *user_nickname;// 用户名
@property (nonatomic,copy)  NSString    *user_phone;// 用户手机号码
@property (nonatomic,copy)  NSString    *user_sex;// 用户性别,1：男，2：女
@property (nonatomic,copy)  NSString    *user_token_expire_time;//     用户token过期时间
@property (nonatomic,copy)  NSString    *ws_url;//     websocket URL
@property (nonatomic,copy)  NSString    *is_follow; // 是否关注；
@property (nonatomic,copy)  NSString    *chat_room_id;//聊天房间ID
@property (nonatomic,copy)  NSString    *is_anchor_admin; // 是否是当前房间管理员
@property (nonatomic,copy)  NSString    *invite_level; //   分销等级
@property (nonatomic,copy)  NSString    *is_remind;  // 是否开启提醒；
@property (nonatomic,copy)  NSString    *is_card_effect; // 是否显示信息卡特效
@property (nonatomic,strong)HNUserTCIMModel  *tim;   //  腾讯IM 信息；
@property (nonatomic,copy)  NSString    *user_constellation; // 用户星座
@property (nonatomic,copy)  NSString    *user_hobby; // 用户爱好
@property (nonatomic,copy)  NSString    *user_home_town; // 用户家乡；
@property (nonatomic,copy)  NSString    *user_img; // 用户相册
@property (nonatomic,copy)  NSString    *user_profession; //用户职业
@property (nonatomic,copy)  NSString    *user_video; // 用户视频
@property (nonatomic,copy)  NSString    *user_video_cover; //用户视频封面
@property (nonatomic,copy)  NSString    *user_emotional_state; //情感状态；
@property (nonatomic,copy)  NSString    *user_register_time; // 用户注册时间
@property (nonatomic,strong)NSArray     *gift_img; // 收到的礼物
@property (nonatomic,copy)  NSString    *is_online;   //是否在线 0 不在 1在
@property (nonatomic,assign) BOOL       is_black;//是否拉黑
@property (nonatomic,copy)  NSString    *share_url; //分享地址；
@property (nonatomic,copy)  NSString    *total_gift;// 用户收礼总数
@property (nonatomic,copy)  NSString    *user_video_refuse_reason;//认证视频被拒绝原因 /
@property (nonatomic,copy)  NSString    *video_authentication;//用户视频认证状态：0未认证 1认证中 2认证未通过 3认证通过 4审核中 5审核不通过 6审核通过
@property (nonatomic,assign)NSInteger   apple_online;// 1表示开启  2表示关闭
@property (nonatomic, copy)NSString      *anchor_chat_category; // 聊天分类ID
@property (nonatomic, copy)NSString      *anchor_chat_category_name; // 聊天分类名称


@property (nonatomic, copy)NSString      *auto_send_time; // 登陆后几秒发送诱导
@property (nonatomic, copy)NSString      *push_interval_time; // 每次诱导的时间间隔

+ (HNUserModel *)shareInstance;

//- (void)clear;

@end

@interface HNUserModelSingleton : NSObject
@property (nonatomic, strong) HNUserModel *userModel;
+ (instancetype)singleton;
@end

NS_ASSUME_NONNULL_END
