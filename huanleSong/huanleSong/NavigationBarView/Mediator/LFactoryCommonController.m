//
//  LFactoryCommonController.m
//  huanLeSong
//
//  Created by 印丹 on 2018/5/25.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "LFactoryCommonController.h"
#import "CustomNavigationController.h"

#import "LoginResignController.h"
#import "LWriteDatumViewController.h"

#import "LPersonDatumViewController.h"
#import "LAuthenticationViewController.h"

#import "LVisitorViewController.h"
#import "LChatViewController.h"
#import "LAttentionViewController.h"
#import "LSetViewController.h"
#import "LPurseViewController.h"
#import "LMyGoldViewController.h"
#import "OrderViewController.h"

#import "WishDateListController.h"
#import "LRankingListManager.h"
#import "VipLeverController.h"

#import "LVideotapeViewController.h"
#import "RedEnvelopeController.h"
#import "MyRedEnvelopController.h"
#import "MineSendRedViewController.h"
#import "MineReceveRedDetailController.h"
#import "PlayVideoController.h"
#import "JWebViewController.h"


@implementation LFactoryCommonController

#pragma mark - 创建UIViewController
+(NSDictionary *)createViewController:(kLControllerTag)kCTag {
    BOOL container = NO;
    switch (kCTag) {
        case kLControllerTagLogin:
        case kLControllerTagBaseDataMan:
        case kLControllerTagBaseDataWoman: {
            container = YES;
            break;
        }
        case kLControllerTagRigster:
        case kLControllerTagChooseSex:
        case kLControllerTagLInvitationCode:
        case kLControllerTagPicUploadWoman:
        case kLControllerTagLDataVerify:
        case kLRecordVideoController:
        case kLControllerTagPersonDatum:
        case kLControllerTagAuthentication_One:
        case kLControllerTagAuthentication_Two:
        case kLControllerTagAuthentication_Three:
        case kLControllerTagLVisitorList:
        case kLControllerTagIMChat:
        case kLControllerTagLAttention:
        case kLControllerTagLMyRedBag:
        case kLControllerTagJMyRedSend:
        case kLControllerTagLRedBagDetail:
        case kLControllerTagLSetAccount:
        case kLControllerTagLSet:
        case kLControllerTagLPurse:
        case kLControllerTagLMyGold:
        case kLControllerTagOrder:
        case kLControllerTagLGift:
        case kLControllerTagLWish:
        case kLControllerTagLSetVoice:
        case kLControllerTagLSetPushNoti:
        case kLControllerTagLSetHelper:
        case kLControllerTagLChangePwd:
        case kLControllerTagLSetBlacklist:
        case kLControllerTagLSetAbout:
        case kLControllerTagLLoginHard:
        case kLControllerTagLForgetPassWord:
            
        case kLControllerTagLVIPSetter:
        case kLControllerTagLPersonDetail:
        case kLControllerTagLRankingList:
        case kLControllerTagLVipLever:
        case kLControllerTagJPromote:
        case kLControllerTagLVideotape:
        case kLControllerTagJRedEnvelop:
        case kLControllerTagJEnterDateDetail:
        case kLControllerTagJEnterDateSquare:

        default: break;
    }
    return [self createVC:kCTag container:container];
}

+(NSDictionary *)createVC:(kLControllerTag)kCTag container:(BOOL)need {
    UIViewController *toController = nil;
    UINavigationController *toNavigationController = nil;
    switch (kCTag) {
        case kLControllerTagLogin: {
            toController = [[LoginResignController alloc] initWithLogin:YES];
            break;
        }
        case kLControllerTagRigster: {
            toController = [[NSClassFromString(@"LResignViewController") alloc] init];
            break;
        }
        case kLControllerTagChooseSex: {
            toController = [[NSClassFromString(@"LChooseSexViewController") alloc] init];
            break;
        }
        case kLControllerTagBaseDataMan: {
            toController = [[NSClassFromString(@"LWriteBaseDataManVC") alloc] init];
            break;
        }
        case kLControllerTagBaseDataWoman: {
            toController = [[NSClassFromString(@"LWriteDataWomanVC") alloc] init];
            break;
        }
        case kLControllerTagLInvitationCode: {
            toController = [[NSClassFromString(@"LInvitationCodeVC") alloc] init];
            break;
        }
        case kLControllerTagPicUploadWoman:{
            toController = [[NSClassFromString(@"LUploadWomanVC") alloc] init];
            break;
        }
        case kLControllerTagLDataVerify: {
            toController = [[LAuthenticationViewController alloc] initWithStep:LAuthentication_GirlRegister];
            break;
        }
        case kLRecordVideoController:{
            toController = [[NSClassFromString(@"RecordVideoController") alloc] init];
            break;
        }
        case kLControllerTagLRedBagDetail: {
            toController = [[NSClassFromString(@"MineReceveRedDetailController") alloc] init];
            break;
        }
        case kLControllerTagLSendRedBag: {
            toController = [[NSClassFromString(@"SendRedController") alloc] init];
            break;
        }
        case kLControllerTagLMineSendRedBag: {
            toController = [[NSClassFromString(@"MineSendRedViewController") alloc] init];
            break;
        }
        case kLControllerTagLPalyVideo: {
            toController = [[NSClassFromString(@"PlayVideoController") alloc] init];
            break;
        }
        case kLControllerTagLCheckApply: {
            toController = [[NSClassFromString(@"CheckApplyController") alloc] init];
            break;
        }
        case kLControllerTagLChargeRecord: {
            toController = [[NSClassFromString(@"ChargeRecordController") alloc] init];
            break;
        }
        case kLControllerTagLVipMemberRecharge: {
            toController = [[NSClassFromString(@"VipMemberRechargeController") alloc] init];
            break;
        }
        case kLControllerTagLWithDrawal: {
            toController = [[NSClassFromString(@"WithDrawalController") alloc] init];
            break;
        }
        case kLControllerTagLBanding: {
            toController = [[NSClassFromString(@"BandingViewController") alloc] init];
            break;
        }
        case kLControllerTagLJReport: {
            toController = [[NSClassFromString(@"ReportController") alloc] init];
            break;
        }
        case kLControllerTagJDynamicList: {
            toController = [[NSClassFromString(@"DynamicListController") alloc] init];
            break;
        }
        case kLControllerTagLPublicDate: {
            toController = [[NSClassFromString(@"LPublicWishVController") alloc] init];
            break;
        }
        case kLControllerTagLPublicWish: {
            toController = [[NSClassFromString(@"PublicWishController") alloc] init];
            break;
        }
        case kLControllerTagLDynamicDetail: {
            toController = [[NSClassFromString(@"DynamicDetailController") alloc] init];
            break;
        }
        case kLControllerTagLLikeList: {
            toController = [[NSClassFromString(@"LikeListViewController") alloc] init];
            break;
        }
        case kLControllerTagPersonDatum: {
            toController = [[NSClassFromString(@"LPersonDatumViewController") alloc] init];
            break;
        }
        case kLControllerTagLAttention: {
            toController = [[NSClassFromString(@"LAttentionViewController") alloc] init];
            break;
        }
        case kLControllerTagLShouFeiXianDing: {
            toController = [[NSClassFromString(@"ShouFeiSheDingVC") alloc] init];
            break;
        }
        case kLControllerTagLVisitorList: {
            toController = [[NSClassFromString(@"LVisitorViewController") alloc] init];
            break;
        }
        case kLControllerTagLMyRedBag: {
            toController = [[MyRedEnvelopController alloc] init];
            break;
        }
        case kLControllerTagJMyRedSend : {
            toController = [[MineSendRedViewController alloc] init];
            break;
        }
        case kLControllerTagLCondition: {
            toController = [[NSClassFromString(@"ConditionController") alloc] init];
            break;
        }case kLControllerTagIMChat: {
            toController = [[NSClassFromString(@"LChatViewController") alloc] init];
            break;
        }
        case kLControllerTagJPlayVideo: {
            toController = [[PlayVideoController alloc] init];
            break;
        }
        case kLControllerTagLXiangCe: {
            toController = [[NSClassFromString(@"LXiangCeViewController") alloc] init];
            break;
        }
        case kLControllerTagLVideoShow: {
            toController = [[NSClassFromString(@"LVideoShowViewController") alloc] init];
            break;
        }
        case kLControllerTagLSetAccount: {
            toController = [[NSClassFromString(@"LSetAccountViewController") alloc] init];
            break;
        }
        case kLControllerTagLSet: {
            toController = [[LSetViewController alloc] init];
            break;
        }
        case kLControllerTagLPurse: {
            toController = [[NSClassFromString(@"LPurseViewController2") alloc] init];
            break;
        }
        case kLControllerTagLMyGold: {
            toController = [[LMyGoldViewController alloc] init];
            break;
        }
        case kLControllerTagOrder: {
            toController = [[OrderViewController alloc] init];
            break;
        }
        case kLControllerTagLGift: {
            toController = [[NSClassFromString(@"MyGiftControlle") alloc] init];
            break;
        }
        case kLControllerTagLWish: {
            toController = [[WishDateListController alloc] init];
            break;
        }
        case kLControllerTagLSetVoice: {
            toController = [[NSClassFromString(@"LSetVoiceViewController") alloc] init];
            break;
        }
        case kLControllerTagLSetPushNoti: {
            toController = [[NSClassFromString(@"LSetPushViewController") alloc] init];
            break;
        }
        case kLControllerTagLSetHelper: {
            toController = [[NSClassFromString(@"LFeedbackViewController") alloc] init];
            break;
        }
        case kLControllerTagLChangePwd: {
            toController = [[NSClassFromString(@"LChangePwdViewController") alloc] init];
            break;
        }
        case kLControllerTagLSetBlacklist: {
            toController = [[NSClassFromString(@"LBlacklistViewController") alloc] init];
            break;
        }
        case kLControllerTagLSetAbout: {
            toController = [[NSClassFromString(@"LSetAboutViewController") alloc] init];
            break;
        }
        case kLControllerTagLLoginHard: {
            toController = [[NSClassFromString(@"LLoginHardViewController") alloc] init];
            break;
        }
        case kLControllerTagLForgetPassWord: {
            toController = [[JWebViewController alloc] init];
            break;
        }
        case kLControllerTagLVIPSetter: {
            toController = [[NSClassFromString(@"LVipViewController") alloc] init];
            break;
        }
        case kLControllerTagLPersonDetail: {
            toController = [[NSClassFromString(@"PersonDetailController") alloc] init];
            break;
        }
        case kLControllerTagLRankingList: {
            toController = [[LRankingListManager alloc] init];
            break;
        }
            
        case kLControllerTagLVipLever: {
            toController = [[VipLeverController alloc] init];
            break;
        }
        case kLControllerTagJEnterDateDetail: {
            toController = [[NSClassFromString(@"EnterDateDetailController") alloc] init];
            break;
        }
        case kLControllerTagJEnterDateSquare: {
            toController = [[NSClassFromString(@"EnterDateSquareController") alloc] init];
            break;
        }
        case kLControllerTagJPromote: {
            toController = [[NSClassFromString(@"promoteSelfController") alloc] init];
            break;
        }
        case kLControllerTagLVideotape: {
            toController = [[LVideotapeViewController alloc] init];
            break;
        }
        case kLControllerTagJRedEnvelop: {
            toController = [[RedEnvelopeController alloc] init];
            break;
        }
        case kLControllerTagLNearPerson: {
            toController = [[NSClassFromString(@"NearPeopleController") alloc] init];
            break;
        }
        case kLControllerTagLNewThing: {
            toController = [[NSClassFromString(@"DynamicController") alloc] init];
            break;
        }
            //        case kLControllerTagLDongTai: {
            //            toController = [[NSClassFromString(@"DynamicController2") alloc] init];
            //            break;
            //        }
        case kLControllerTagLXinDong: {
            toController = [[NSClassFromString(@"LXinDongViewController") alloc] init];
            break;
        }
        case kLControllerTagLPublicNewRefresh: {
            toController = [[NSClassFromString(@"PublicNewRefreshController") alloc] init];
            break;
        }
        case kLControllerTagLFindMeet: {
            toController = [[NSClassFromString(@"FindMeetViewController") alloc] init];
            break;
        }
        case kLControllerTagLShootVideo: {
            toController = [[NSClassFromString(@"LShootVideoViewController") alloc] init];
            break;
        }
        case kLControllerTagLPublicVideoShow: {
            toController = [[NSClassFromString(@"LPublicVideoShowVC") alloc] init];
            break;
        }
        case kLControllerTagLInvaliteFrend: {
            
            toController = [[NSClassFromString(@"LInvaliteFrendViewController") alloc] init];
            break;
        }
        case kLControllerTagLChangeAccount: {
            toController = [[NSClassFromString(@"LChangeAccountVController") alloc] init];
            break;
        }
        case kLControllerTagLVideoShow2: {
            toController = [[NSClassFromString(@"LVideoShow2ViewController") alloc] init];
            break;
        }
        case kLControllerTagLWishInHome: {
            toController = [[NSClassFromString(@"HomeViewController") alloc] init];
            break;
        }
        case kLControllerTagLShortVideoRecord: {
            toController = [[NSClassFromString(@"VideoRecordViewController") alloc] init];
            break;
        }
        case kLControllerTagLShortVideoPreview: {
            toController = [[NSClassFromString(@"VideoPreviewViewController") alloc] init];
            break;
        }
        case kLControllerTagLShortVideoEdit: {
            toController = [[NSClassFromString(@"VideoEditViewController") alloc] init];
            break;
        }
        case kLControllerTagLShortVideoPublic: {
            toController = [[NSClassFromString(@"LShortVideoPublicVC") alloc] init];
            break;
        }
        case kLControllerTagLTJGZ: {
            toController = [[NSClassFromString(@"RecommendAttenController") alloc] init];
            break;
        }
        case kLControllerTagLSearchUser: {
            toController = [[NSClassFromString(@"LSearchUserVC") alloc] init];
            break;
        }
        case kLControllerTagLRTTC: {
            toController = [[NSClassFromString(@"LRTTCViewController") alloc] init];
            break;
        }
        case kLControllerTagLRTTCEND: {
            toController = [[NSClassFromString(@"LRTTCVideoChatEndVC") alloc] init];
            break;
        }
        case kLControllerTagLWishDateSignUp: {
            toController = [[NSClassFromString(@"LWishDateSignUpVC") alloc] init];
            break;
        }
        case kLControllerTagMessge: {
            toController = [[NSClassFromString(@"MessgeListController") alloc] init];
            break;
        }
        case kLControllerTagLIncomeVC: {
            toController = [[NSClassFromString(@"LIncomeVCManager") alloc] init];
            break;
        }
        default:
            break;
    }
    
    if (need) {
        toNavigationController = [[CustomNavigationController alloc] initWithRootViewController:toController];
    }
    
    toController.kCTag = kCTag;
    NSMutableDictionary *mDict = [[NSMutableDictionary alloc] init];
    [mDict setValue:toController forKey:LFactory_kViewController];
    [mDict setValue:toNavigationController forKey:LFactory_kNavigationController];
    return mDict;
}

+(id)createVC:(kLControllerTag)kCTag {
    UIViewController *vc = [[LFactoryCommonController createVC:kCTag container:NO] objectForKey:LFactory_kViewController];
    return vc;
}
@end
