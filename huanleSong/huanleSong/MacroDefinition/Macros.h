

#ifndef Macros_h
#define Macros_h

#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif

#define _weakself __weak typeof(self) weakself = self
#define BackGroundColor    UIColorFromHEXA(0xf5f5f5,1)

// 颜色
#define UIColorFromHEXA(hex,a) [UIColor colorWithRed:((hex & 0xFF0000) >> 16) / 255.0f green:((hex & 0xFF00) >> 8) / 255.0f blue:(hex & 0xFF) / 255.0f alpha:a]
#define UIColorFromRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]
#define  UIColorHexFromRGB(hex) UIColorFromHEXA(hex,1.0)
// 系统默认字体设置和自选字体设置
#define SystemFontSize(fontsize) [UIFont systemFontOfSize:(fontsize)]
#define SystemBoldFontSize(fontsize) [UIFont boldSystemFontOfSize:(fontsize)]
#define CustomFontSize(fontname,fontsize) [UIFont fontWithName:fontname size:fontsize]

//获取图片资源
#define GetImage(imageName)    [UIImage imageNamed:[NSString stringWithFormat:@"%@",imageName]]
#define imageDomain(imageName) [NSString stringWithFormat:@"%@/upload/%@", REQUEST,imageName]

// 等比例缩放系数
#define KEY_WINDOW    ([UIApplication sharedApplication].keyWindow)
#define SCREEN_WIDTH  ([[UIScreen mainScreen] bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define kScreenWidth    SCREEN_WIDTH
#define kScreenHeight   SCREEN_HEIGHT
#define SCREEN_SCALE  ((SCREEN_WIDTH > 414) ? (SCREEN_HEIGHT/375.0) : (SCREEN_WIDTH/375.0))
#define Handle(x)        ((x)*SCREEN_SCALE)
#define Handle_width(w)  ((w)*SCREEN_SCALE)
#define Handle_height(h) ((h)*SCREEN_SCALE)
// 网络状态
#define NetWork_MobileNet  @"MobileNet" //3G|4G
#define NetWork_WIFI       @"WIFI" //WIFI
#define NetWork_NONET      @"NONET" //NONET
#define NetworkChangeNotification @"NetworkChangeNotification"


//com.TRDA.LeBoLive
//com.TRDA.LeBoLiveShow
#pragma mark --------------------------protocal----------------------------
/**
 iPhoneX适配
 */
#define iPhoneX ([UIScreen instanceMethodForSelector:@selector(currentMode)]?CGSizeEqualToSize(CGSizeMake(1125,2436),[[UIScreen mainScreen] currentMode].size):NO)

#define kTABBAR_HEIGHT (iPhoneX?(49.f+34.f):49.f)

/**
 Return the statusBar height.
 */
#define kSTATUSBAR_HEIGHT (iPhoneX?44.0f:20.f)

#define LiveRemandViewY   (iPhoneX?44.0f:0.f)

/**
 Return the navigationBar height.
 */
#define kNAVIGATION_HEIGHT (44.f)

/**
 Return the (navigationBar + statusBar) height.
 */
#define kSTATUSBAR_NAVIGATION_HEIGHT (iPhoneX?88.0f:64.f)

/**
 Return 没有tabar 距 底边高度
 */
#define BOTTOM_SPACE_HEIGHT (iPhoneX?34.0f:0.0f)

// 通用控件左右间隔
#define kSpaceToLeftOrRight Handle(10)

// 底部条高度
#define kBottomViewHeight 48

// 导航条高度
#define  kNavigationHeight 64

#define ChatToolsHeight  50+BOTTOM_SPACE_HEIGHT         // 聊天工具框高度
#define EmojiKeyboard_Height 200+BOTTOM_SPACE_HEIGHT      // 表情键盘的高度
#define LiveChatToolsHeight 49          // 直播间聊天工具栏高度
#define Live_EmojiKeyboard_Height  200  // 直播间表情键盘高度

#define  DeviceIsIPhoneX   [[HNTools deviceVersion] isEqualToString:@"iPhone X"]?1:0

#pragma mark ------------------------- 项目相关 ------------------------------------
// 判断网络
#define NetworkIsStatusNotReachable [AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable
#define CODE            [responseObject[@"c"] integerValue]
#define ERROR           [MBProgressHUD showError:@"网络连接异常，请检查网络设置"]
#define MBErrorMsg      [MBProgressHUD showError:responseObject[@"m"]]
#define MBShow          [MBProgressHUD showHUDAddedTo:self.view animated:YES]
#define MBHidden        [MBProgressHUD hideHUDForView:self.view animated:YES]
#define SuccessCode     0

#define Type(name)     [messageDict[@"type"] isEqualToString:name]
#define BindPhoneNum   @"bindPhoneNumber"
#define UserHeadImg    @"headImgUrl"
#define UserNickName    @"userNick"


#define kChangeTotalUnread  @"changeUnread"
#define kUnReadKey          @"total_unread"   // 发未读消息通知时unserInfo里的key值
#define UnreadMessageCount  @"unread_count"   // 保存在本地的未读消息总数

#define kSearchHistoryData @"searchHistory"

#define VideoPlayScrollViewIsScroll @"videoplayScrollViewIsScroll"
#define IPhoneID [[[UIDevice currentDevice] identifierForVendor] UUIDString]



#define   shareItemS  (SCREEN_WIDTH - Handle(25)*8)/4
#define RECEIVEPrivateMessage   @"privateMessageNotion"
#define HaveLoginInOtherDevide  @"loginInOtherPhone"
#define UserLoginOut  @"loginInOtherPhone"
#define AttentionAnchorStarLive @"AnchorStarLiveNot"
#define IsGiftUpdateTime        @"giftTime"  // 礼物更新时间 ，由服务端返回
#define GiftKindList            @"giftKindList" // 礼物分类数组
#define RoomGiftList            @"GiftListInfo"  // 礼物详情数组
#define GiftKindName            @"GiftKindName"
#define isFirstLoadGiftImg      @"isfirstGetGift"  // 是否是第一次下载礼物
#define LiveShareType           @"LiveShareType"    // 直播前选择的分享类型
#define consumeSucessNot        @"consumeSucess"  //  消费成功后的消息通知；
#define AnchorAcessChatinvite   @"acessChatinvite" // 主播再看直播时接受聊天申请；
#define ScreenLockNotifi        @"screenLockstate"

#define LOCK_SCREEN_NOTIFY @"LockScreenNotify"

#define ANCHOR_FORBID              10008    //主播被禁
#define USER_CERTIFICATION_FAIL    10011  //实名认证失败'
#define USER_NOT_CERTIFICATION     10012  //没有实名认证'
#define USER_CERTIFICATION_CHECK  10013 // 实名认证审核中


#define  APPCoin           @"appCoin"
#define  APPDot            @"appdot"

#define  LoginUserIsAnchor    @"isOrNoAnchor"
#define  CheckIsSignin     @"isSignin"   //  是否签到
#define  USERIDVIP         @"userIsVip"  //  用户是否是Vip
#define  IsFirstChatPaySet   @"firstChatPay"  // 提醒用户聊天收费；
#define  CheckHaveNoReadMessage @"haveNoReadMessage"
#define NeiGouReceipe    @"receipe"  ///内购验证
#define AppIpaReceipe    @"vipCheck"  // vip内购验证
#define AppIpaReceipeID   @"vipCheckID"  // vip内购验证
#pragma mark - 第三方分享

#define UMengAppKey       @"5b4d9aa1a40fa30653000888"
////微信
#define  WXPayAPPID   @"wx87896beef6605888"
#define  WXAPPSERCET  @"1af603fe4e49f1033d68bf856b7d7888"


//微博
#define WBAPPKEY      @""
#define WBAPPSERCET   @""
#define REDIRECTURL   @"http://sns.whalecloud.com/sina2/opencallback"


#define QQAPPKEY      @"1107824888"
#define QQAPPSERCET   @"Ytm6zLVFWPrD6888"

#define SHAREURL      @"www.meiguang.tv"

#define JPushKey     @""

#ifdef DEBUG
#define  JPushIsDebug  0
#else
#define  JPushIsDebug  1
#endif
//腾讯云云通信服务AppId
#define KTCIMSDKIDENT     @"ImUseridentifier"
#define kTCIMSDKAppId     @"ktcimsdkAppID"
#define kTCIMSDKAccountType @"IMAccountType"
#define KTCIMSDKUSERSIG    @"TcimUserSig"
#define TXIMGCDN           @"TxImgCDN"  // 上传图片所返回CDN
#define PayTypeForiOS      @"payiconType"    //支付类型开关

//错误码
#define kError_InvalidParam                            -10001
#define kError_ConvertJsonFailed                       -10002
#define kError_HttpError                               -10003

//IMSDK群组相关错误码
#define kError_GroupNotExist                            10010  //该群已解散
#define kError_HasBeenGroupMember                       10013  //已经是群成员
#pragma mark ------------------------  用户相关 ------------------------------------

#define kACCOUNT  @"account"

#define kUserID   [[NSUserDefaults standardUserDefaults]objectForKey:@"userId"]
#define kUDID     [[NSUserDefaults standardUserDefaults]objectForKey:@"UDID"]
#define kTOKEN    [[NSUserDefaults standardUserDefaults]objectForKey:@"token"]



#define UserDefault [NSUserDefaults standardUserDefaults]

#pragma mark -------------------------  工程配置相关 --------------------
//[[NSUserDefaults standardUserDefaults]objectForKey:@"coin"]
#define kCoinName [[NSUserDefaults standardUserDefaults]objectForKey:APPCoin]
#define kDotName  [[NSUserDefaults standardUserDefaults]objectForKey:APPDot]
#define kAppName  @"杏花雨聊"
#define kIDName   @"ID"
#define kAppIcon  GetImage(@"logo")
#define crashReason     @"crashreson"

#define CString(k)  [[HNSkinThemeManager shareSkinThemeManager] skinColorStringWithKey:k]
#define ImageString(k)  [[HNSkinThemeManager shareSkinThemeManager] skinImageNameWithKey:k]
#define CurrentThemeIsWhite [[[HNSkinThemeManager shareSkinThemeManager] getAppSkinTheme] isEqualToString:@"white"]

#define mp3Path(name) [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:name]
#define  LocalMusicList    @"localmusicList"

#define IAPVERTIFIFAILED     @"iapvertifialed"



typedef enum {
    TotleUserContribut = 0,    // 个人中心 用户排行榜显示   不显示关注按钮  贡献数量显示   周 贡献 --- 银币
    RoomUserContribut,         // 直播间显示 贡献，  不显示关注按钮   贡献数量显示          贡献 --- 银币
    TotleAnchorRank,           //个人中心 主播排行榜显示  显示关注按钮  显示主播收入       --- 金币
    RoomAnchorRank,            //直播间主播排行，  不显示关注按钮主播收入            --- 金币
 
}RankListCellShowType;



typedef enum{
    NoSubmit = 0,
    CertificationField,
    CertificationWateing,
    CertificationSucess
} CertificationType;

#define  NoLiveingImg     @"default_icon_wsj"
#define  NoAttentionImg   @"kongshuju_guanzhu"
#define  NopositionImg    @"default_icon_wsj"
#define  NoSearchImg      @"default_icon_wsj"
#define  NoRankList       @"default_icon_wsj"
#define  MainNoListImg     @"default_icon_wsj"

#define  DefaultHeaderImage GetImage(@"home_head_default")

#define  HomeBannerDefultImg GetImage(@"banner_default")

#define  SamllImgNoData     @"gift_loading"

#define LiveLogoImg     GetImage(@"home_loading_big")

#define kJHDefaultPhoto     [UIImage imageNamed:@"live_default"]

#define VideoDefaultPhoto   GetImage(@"video_default")

#define UserIsSign          @"userSignType"

#define FilterSelectIndex    @"filterIndex"
#define beautyFaceNum        @"faceNumer"   // 美颜
#define RublyNum             @"RublyNum" // 红润
#define whiteFaceNum         @"whitefaceNum" // 美白

#define  LEBO_MAX_RECORD_TIME             60  // 视频录制最大时间
#define  LEBO_MIN_RECORD_TIME             5   // 视频录制最小时间

// 背景色
#define BgColor          @"BgColor"

// ID背景色
#define IDBgColor        @"IdBgColor"

// 分割线
#define  LineColor       @"LineColor"

// 标题颜色
#define TitleColor       @"TitleColor"

// 副标题颜色
#define SubtitleColor    @"SubtitleColor"

// 内容颜色
#define ContentColor     @"ContentColor"

// 导航栏底色
#define NavBgColor       @"NavBgColor"

// 导航栏标题颜色
#define NavTitleColor    @"NavTitleColor"

// tabbar底色
#define TabbarBgColor    @"TabbarBgColor"

// 白色文字
#define WhiteColor       @"WhiteColor"
#define YiMoMainColor         UIColorFromHEXA(0xd44aff,1.0)
// 按钮不可点击状态
#define BtnUnEnableBgColor    UIColorFromHEXA(0xF0F0F0,1.0)

// 按钮可点击状态
#define BtnBgColor            YiMoMainColor

// 按钮按压状态

#define BtnSelectedColor      UIColorFromHEXA(0xE23365,1.0)
//#define WhiteBackMainColor    UIColorFromHEXA(0xffb108,1.0)
#define WhiteBackMainColor    YiMoMainColor

//#define MainColor             UIColorFromHEXA(0xFFD308,1.0)
#define MainColor              YiMoMainColor
#define  NavBackColcor         UIColorFromHEXA(0x1B1B1B,1.0)


// 编辑按钮
#define UserInfoEdit      @"Compile"

// 我的收益
#define MeEarning         @"Allearnings"

// 我的账户
#define MeAccount         @"Account"

// 我的VIP
#define MeVIPMember       @"Level"

// 账单明细
#define BillingDetails    @"Bill"

// 实名认证
#define Certification     @"RenZheng"

// 帮助反馈
#define Help              @"Help"

// 设置
#define Set               @"Set"

// 首页
#define TabHome           @"Home"

// 关注
#define TabFollow         @"Follow"

// 消息
#define TabMsg            @"Msg"

// 我
#define TabMe             @"Me"

// 系统消息对话框
#define SystemMsg         @"SystemMsg"


// 直播列表
#define LiveDefault       @"Live"

#pragma  mark   -----------------错误码
#define  NOEnoughCODE      10024  //  用户余额不足；


// 快聊
/// 邀请主播
#define kJHPrivateChatNotification @"kJHPrivateChatNotificationStr"
// 接受
#define kJHAcceptPrivateChatNotification @"kJHAcceptPrivateChatNotification"
// 取消
#define kJHCancelPrivateChatNotification @"kJHCancelPrivateChatNotification"
// 拒绝
#define kJHRefusePrivateChatNotification @"kJHRefusePrivateChatNotification"
// 挂断
#define kJHHangupPrivateChatNotification @"kJHHangupPrivateChatNotification"
// 模糊
#define kJHVaguePrivateChatNotification @"kJHVaguePrivateChatNotification"
//
#define SamllVideoMusicSelectNotification @"samllvideoMusicselectNotification"
//
#define VideoChatUserCoinNotification     @"VideoChatUserCoinNotification"
#endif /* Macros_h */
