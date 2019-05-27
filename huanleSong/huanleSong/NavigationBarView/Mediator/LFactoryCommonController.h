//
//  LFactoryCommonController.h
//  huanLeSong
//
//  Created by 印丹 on 2018/5/25.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kLControllerTagNone = 0,    //无效的
    
    //主页面(注意：值为其在数组TabBarController.viewControllers的下标)
    //<!-- 主页 -->
    kLControllerTagDynamic     = 1, //娱乐
    kLControllerTagLNearPerson = 2, //附近NearController
    kLControllerTagLVideoShow  = 3, //视频秀
    kLControllerTagLNewThing   = 4, //新鲜事
    kLControllerTagMine        = 5, //我的
    kLControllerTagMessge,      //消息
    kLControllerTagLWishInHome, //愿望/约会
    
    kLControllerTagLVideoShow2,     //视频秀-最新
    
    kLControllerTagLWishDateSignUp,//LWishDateSignUpVC
    
    kLControllerTagLIncomeVC,//LIncomeVCManager
    //<!-- 登录注册 -->
    kLControllerTagLogin,       //登录
    kLControllerTagLLoginHard,  //登录困难
    kLControllerTagLForgetPassWord,  //登录困难
    
    kLControllerTagRigster,     //注册
    kLControllerTagAreaCode,    //国家代码
    kLControllerTagChooseSex,       //选择性别(填写基本资料)
    kLControllerTagBaseDataMan,     //男性基本资料
    kLControllerTagBaseDataWoman,   //女性基本资料
    kLControllerTagLInvitationCode, //填写邀请码
    kLControllerTagPicUploadWoman,  //女性上传图片LUploadWomanVC
    kLRecordVideoController,        //女性上传视频
    kLControllerTagLDataVerify,     //账号审核
    kLControllerTagLVideotape,      //录视频
    
    //<!-- 短视频 -->
    kLControllerTagLShortVideoRecord,   //短视频录制
    kLControllerTagLShortVideoPreview,  //短视频处理VideoPreviewViewController,
    kLControllerTagLShortVideoEdit,     //短视频编辑VideoEditViewController
    kLControllerTagLShortVideoPublic,   //短视频发布LShortVideoPublicVC
    
    //<!-- 实时视频 -->
    kLControllerTagLRTTC,   //实时视频
    kLControllerTagLRTTCEND,//实时视频结束计费页
    
    //<!-- 弃用 -->
    kLControllerTagDatumBaseInfo_One,       //基本资料
    kLControllerTagDatumBaseInfo_Two,       //基本资料
    kLControllerTagDatumBaseInfo_Three,     //基本资料
    kLControllerTagDatumcharacteristic_Four,//特色资料
    kLControllerTagDatumcharacteristic_Five,//特色资料
    kLControllerTagDatumcharacteristic_Six, //特色资料
    
    //<!-- 个人资料 -->
    kLControllerTagPersonDatum,         //个人资料
    kLControllerTagLPersonDetail,
    kLControllerTagLXiangCe,            //LXiangCeViewController
    kLControllerTagLDongTai,            //动态
    kLControllerTagJEnterDateDetail,
    //愿望约会闲情态
    kLControllerTagJEnterDateSquare,            //愿望约会广场态

    //<!-- 认证 -->
    kLControllerTagAuthentication_One,  //认证
    kLControllerTagAuthentication_Two,  //认证
    kLControllerTagAuthentication_Three,//认证
    
    //<!-- 与钱、红包相关 -->
    kLControllerTagLMyRedBag,     //我的红包
    kLControllerTagJMyRedSend,    //我发的红包
    //kLControllerTagLRedBagDetail,  //我收到的红包
    kLControllerTagLRedBagDetail, //红包详情MineReceveRedDetailController
    kLControllerTagLPurse,        //钱包
    kLControllerTagLMyGold,       //我的妙妙币
    kLControllerTagOrder,         //支付订单
    kLControllerTagJRedEnvelop,   //红包大厅
    kLControllerTagLSendRedBag,   //发送红包
    kLControllerTagLMineSendRedBag,//我发送的红包
    
    //<!-- 位置 -->
    kLControllerTagLChooseLocation,     //选择位置
    kLControllerTagLMyLocation,         //我的位置
    kLControllerTagLLookLocation,       //查看位置MapShowAndNavMapVC
    kLControllerTagLConference,         //ConferenceViewController
    
    //<!-- 搜索 -->
    kLControllerTagLSearchUser,      //LSearchUserVC
    
    //<!-- 设置 -->
    kLControllerTagLSet,            //系统设置
    kLControllerTagLSetAccount,     //账户设置
    kLControllerTagLSetPushNoti,    //推送
    kLControllerTagLSetVoice,       //声音
    kLControllerTagLSetHelper,      //帮助
    kLControllerTagLSetBlacklist,   //黑名单
    kLControllerTagLSetAbout,       //关于妙妙
    kLControllerTagLChangeAccount,  //修改账号
    kLControllerTagLChangePwd,      //修改密码
    
    //
    
    kLControllerTagLXinDong,         //心动
    kLControllerTagLPublicNewRefresh,//筛选PublicNewRefreshController
    kLControllerTagLFindMeet,        //FindMeetViewController
    
    //<!-- 发布约会 -->
    kLControllerTagLPublicWish,      //发布约会
    
    //<!-- 视频秀 -->
    kLControllerTagLShootVideo,      //录视频LShootVideoViewController
    kLControllerTagLPublicVideoShow, //发布视频LPublicVideoShowVC
    
    
    //<!-- 其它 -->
    kLControllerTagIMChat,          //聊天窗口
    kLControllerTagLChangeText,     //修改文本
    kLControllerTagLAttention,      //关注列表(我关注&关注我)
    kLControllerTagLVisitorList,    //访客列表
    kLControllerTagLGift,           //礼物
    kLControllerTagLWish,           //愿望/约会
    kLControllerTagLRankingList,    //排行榜
    kLControllerTagJPromote,        //推广自己
    kLControllerTagLVIPSetter,      //VIPSetterController
    kLControllerTagLVipLever,       //VipLeverController
    kLControllerTagLPalyVideo,      //播放视频PlayVideoController
    kLControllerTagLCheckApply,     //查看报名CheckApplyController
    kLControllerTagLChargeRecord,   //ChargeRecordController
    kLControllerTagLVipMemberRecharge,//VipMemberRechargeController
    kLControllerTagLWithDrawal,     //WithDrawalController
    kLControllerTagLBanding,        //BandingViewController
    kLControllerTagLJReport,         //ReportController
    kLControllerTagJDynamicList,    //DynamicListController
    kLControllerTagLPublicDate,     //LPublicWishVController
    kLControllerTagLDynamicDetail,  //DynamicDetailController
    kLControllerTagLLikeList,       //点赞列表LikeListViewController
    kLControllerTagLCondition,      //ConditionController
    kLControllerTagJPlayVideo,      //红包大厅
    kLControllerTagLShouFeiXianDing,//收费设定
    kLControllerTagLInvaliteFrend,  //LInvaliteFrendViewController
    kLControllerTagLTJGZ,           //LTJGZViewController
    
}kLControllerTag;

typedef NS_ENUM(NSInteger, LWhereAreYouFromType) {
    LWhereAreYouFrom_Nav = 0,   //导航(Default)
    LWhereAreYouFrom_Modal,     //模态
};

#define LFactory_kViewController @"ViewController"
#define LFactory_kNavigationController @"NavigationController"


@interface LFactoryCommonController : NSObject


/*
 返回值  NSDcitionary
 键值为  @"ViewController":ViewController,
 @"NavigationController":NavigationController
 */
+(NSDictionary *)createViewController:(kLControllerTag)kCTag;
+(NSDictionary *)createVC:(kLControllerTag)kCTag container:(BOOL)need;
+(id)createVC:(kLControllerTag)kCTag;


@end
