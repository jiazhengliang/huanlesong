//
//  SquareTableViewCell.m
//  huanLeSong
//
//  Created by mitko on 2018/5/16.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "SquareTableViewCell.h"
#import "SquareUserInfoHeaderView.h"
#import "SquareBtmInfoView.h"
#import <SDWebImage/UIImageView+WebCache.h>

#import "NewRefreshModel.h"
//#import "HomeHeaderView.h"
//#import "PublishModel.h"
#import "FreshHeaderView.h"

@interface SquareTableViewCell()<SquareBtmInfoViewDelegate,HomeHeaderViewDelegate>

@property (nonatomic,strong) UILabel *detailLabel;

@property (nonatomic,strong) UIImageView *detailImageV;

@property (nonatomic,strong) NSMutableArray *smallArray;

//@property (nonatomic,strong) SquareUserInfoHeaderView *headView;
//@property (nonatomic, strong) HomeHeaderView *homeView;

@property (nonatomic, strong) FreshHeaderView *homeView;

//@property (nonatomic,strong) SquareBtmInfoView *btmView;

@property (nonatomic,strong) UILabel *addressLabel;

@property (nonatomic,strong) UILabel *timeLabel;

@end

@implementation SquareTableViewCell

-(FreshHeaderView *)homeView
{
    if (_homeView == nil) {
        _homeView = [[FreshHeaderView alloc] initWithFrame:CGRectMake(0, 7.5*KWIDTH,screen_width, 65*KWIDTH)];
    }
    return _homeView;
}

//对外屏蔽创建方法
+ (instancetype)cellWithTableView:(UITableView *)tableView indexpath:(NSIndexPath *)indexPath{
    // 定义cell标识  每个cell对应一个自己的标识
    NSString *CellIdentifier = [NSString stringWithFormat:@"square%ld%ld",(long)indexPath.section,(long)indexPath.row];
    // 通过不同标识创建cell实例
    SquareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    // 判断为空进行初始化  --（当拉动页面显示超过主页面内容的时候就会重用之前的cell，而不会再次初始化）
    if (!cell) {
        cell = [[SquareTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 7.5*KWIDTH)];
        lineView.backgroundColor =BackGroundColor;
        [self.contentView addSubview:lineView];
        [self.contentView addSubview:self.homeView];
        [self.contentView addSubview:self.detailLabel];
        [self.contentView addSubview:self.detailImageV];
//        [self.contentView addSubview:self.btmView];
        [self.contentView addSubview:self.addressLabel];
        [self.contentView addSubview:self.timeLabel];
//        self.homeView.dateDelegate = self;
//        self.homeView.cell = self;
        self.smallArray = [NSMutableArray array];
        self.contentView.backgroundColor = [UIColor whiteColor];
        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}

//点击更多信息
-(void)clickMoreInfo:(NSString *)type{
    
    if ([type isEqualToString:@"更多"]) {
        if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
            [self.delegate clickMoreInfoInCell:self type:@"更多"];
        }
        
    } else if ([type isEqualToString:@"评论"])
    {
        if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
            [self.delegate clickMoreInfoInCell:self type:@"评论"];
        }
    } else if ([type isEqualToString:@"赞"])
    {
        if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
            [self.delegate clickMoreInfoInCell:self type:@"赞"];
        }
    }else if ([type isEqualToString:@"打赏"])
    {
        if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
            [self.delegate clickMoreInfoInCell:self type:@"打赏"];
        }
    }
    
}


#pragma mark 头像 更多
-(void)didHomeHeaderViewClickIcon:(NSString *)loginName Cell:(UITableViewCell *)cell
{
    if ([loginName isEqualToString:@"头像"]) {
        if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
            [self.delegate clickMoreInfoInCell:self type:@"头像"];
        }
        
    } else
    {
        if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
            [self.delegate clickMoreInfoInCell:self type:@"更多"];
        }
    }
 
}

//图片点击
-(void)SingleTap:(UITapGestureRecognizer*)recognizer{
    
    UIImageView *clickV = (UIImageView *)recognizer.view;
    [self.delegate clickPicWithIndex:clickV.tag InCell:self imge:clickV smallArray:self.smallArray];
    
}

//视频点击
-(void)SingleTapVideo:(UITapGestureRecognizer*)recognizer{
    
    if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
        [self.delegate clickMoreInfoInCell:self type:@"视频"];
    }
}
-(void)setPublishModel:(PublishModel *)publishModel{
    _publishModel = publishModel;
}
//-(void)setRefrashModel:(NewRefreshModel *)refrashModel{
//
//
//    _refrashModel = refrashModel;
//
//    for (UIView *subView in self.contentView.subviews) {
//        NSLog(@"%@",subView);
//
//        if ([subView isKindOfClass:[UIImageView class]]) {
//            NSLog(@"removeFromSuperview ==%d",subView.tag);
//            [subView removeFromSuperview];
//        }
//    }
//
//    for (UIView *subView in self.homeView.ageHeight.subviews) {
//        NSLog(@"%@",subView);
//        if (subView.tag == 100) {
//            [subView removeFromSuperview];
//        }
//    }
//    if ([refrashModel.MemberID isEqualToString:[LSingleton shareClient].loginUser.MemberID]) {
//        [self.btmView.moreBtn setImage:[UIImage imageNamed:@"icon_novelty_trash"] forState:UIControlStateNormal];;
//    } else
//    {
//        [self.btmView.moreBtn setImage:[UIImage imageNamed:@"home_icon_more"] forState:UIControlStateNormal];;
//
//
//    }
//
//    NSString *pathIcon = [CommonTools URLConverToURL:refrashModel.HeadImaSmall];
//
//    [self.homeView.iconImagView sd_setImageWithURL:[NSURL URLWithString:pathIcon] placeholderImage:[UIImage imageNamed:@"dynamic_default_avatar"]];
//
//    self.homeView.nickName.text = refrashModel.Nickname;
//
//    if (refrashModel.Sex ==1) {
//        self.homeView.sexView.image = [UIImage imageNamed:@"home_icon_man"];
//    } else
//    {
//        self.homeView.sexView.image = [UIImage imageNamed:@"home_icon_woman"];
//    }
//
//    self.homeView.ageLabel.text = refrashModel.Age;
//
//    self.btmView.pariseBtn.selected = refrashModel.IsUpvote?YES:NO;
//
//    [self.homeView fillWithPublishModel:self.publishModel type:@"首页"];
//
//
//    NSString *timeString = [CommonTools swichStringtoData:refrashModel.FreshCreateTime];
//
//    CGFloat longer = (CGFloat)refrashModel.Distance/1000;
//
//    CGSize disSize = [timeString sizeWithAttributes:@{NSFontAttributeName: [UIFont systemFontOfSize:12 * KWIDTH]}];
//
//    self.homeView.dateLabel.text = timeString;
//    NSString *dis = [NSString stringWithFormat:@"%0.2fkm",longer];
//
//    if(refrashModel.Sex ==2){
//        //self.homeView.ageHeight.text = refrashModel.City_Often?refrashModel.City_Often:@"";
//        if(refrashModel.City_Often.length>0){
//            NSArray *cityArr = [refrashModel.City_Often componentsSeparatedByString:@","];
//            NSInteger count = cityArr.count;
//            CGFloat distance = 0.0;
//            if(count>3){
//                count = 3;
//            }
//            for (NSInteger i = 0; i < count; i++) {
//                NSString *cityDetail = cityArr[i];
//
//                NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:12 * KWIDTH]};
//                CGSize citySize = sizeWithText(cityDetail, attribute, CGSizeMake(180, 0));
//
//                UILabel *cityLabel = [[UILabel alloc]initWithFrame:CGRectMake(distance, 0, citySize.width + 10, 20)];
//                cityLabel.text = cityDetail;
//                cityLabel.textAlignment = NSTextAlignmentCenter;
//                cityLabel.tag = 100;
//                cityLabel.font = [UIFont systemFontOfSize:12 * KWIDTH];
//                cityLabel.layer.cornerRadius = 6.0;
//                cityLabel.layer.borderWidth = 1.0;
//                cityLabel.layer.borderColor = RGBColor(255, 138, 95).CGColor;
//                cityLabel.backgroundColor = RGBColor(255, 243, 238);
//                cityLabel.textColor = RGBColor(245, 138, 95);
//                cityLabel.layer.masksToBounds = YES;
//                [self.homeView.ageHeight addSubview:cityLabel];
//                distance += citySize.width;
//                distance += 24;
//            }
//            self.homeView.ageHeight.text = @"";
//        }else{
//            self.homeView.ageHeight.text = @"";
//        }
//    }else{ //男性则显示发布的位置商圈（没有则不显示）、职业
//        NSString *businessArea = refrashModel.FreshBusiness?refrashModel.FreshBusiness:@"";
//        if(businessArea.length>0){
//            self.homeView.ageHeight.text = [NSString stringWithFormat:@"%@ | %@",refrashModel.FreshBusiness,refrashModel.Profession?refrashModel.Profession:@"保密"];
//        }else{
//            self.homeView.ageHeight.text = refrashModel.Profession?refrashModel.Profession:@"保密";
//        }
//    }
//
//
//    NSString *area = [NSString stringWithFormat:@"  %@",refrashModel.FreshCity?refrashModel.FreshCity:@"本地"];
//
//    [self.homeView.localBtn setTitle:area forState: UIControlStateNormal];
//
//    NSDictionary *attribute = @{NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:16 * KWIDTH]};
//    //    CGsize
//    CGSize fontSize = sizeWithText(refrashModel.FreshTitle, attribute, CGSizeMake(screen_width -30*KWIDTH, 0));
//
//    self.detailLabel.text = refrashModel.FreshTitle;
//    self.detailLabel.frame = CGRectMake(15 * KWIDTH, (95-7.5) * KWIDTH, screen_width -30*KWIDTH, fontSize.height);
//
//    NSArray *imageAarray = refrashModel.FreshImages;
//
//    NSInteger count = imageAarray.count;
//    CGFloat  height;
//    [self.smallArray removeAllObjects];
//
//
//    if(count==0){
//        self.detailImageV.frame = CGRectMake( 12, self.detailLabel.bottom + MARGIN, screen_width - 24, 0);
//        self.btmView.y = self.detailImageV.bottom + 3;
//    }else if (count==1){
//        PublishFreshImage *imgaModel = [imageAarray objectAtIndexWithCheck:0];
////        NSString *strUrl = [imgaModel.PhotoPathSmall stringByReplacingOccurrencesOfString:@"\\" withString:@"/"];
////        NSString *downloadUrl = AFAppDotNetAPIBaseURLString(strUrl);
//
//        NSString *downloadUrl = [CommonTools URLConverToURL:imgaModel.PhotoPathSmall];
//
//
//
//        UIImageView *picV = [[UIImageView alloc]init];
//        picV.tag = 0;
//        self.smallImage = picV;
//        [picV sd_setImageWithURL:[NSURL URLWithString:downloadUrl] placeholderImage:[UIImage imageNamed:@""]];
//
//        if (imgaModel.PhotoWidth == nil) {
//            height = (screen_width-30*KWIDTH)/2;
//        } else {
//            height = (screen_width-30*KWIDTH)*([imgaModel.PhotoHeight floatValue]/[imgaModel.PhotoWidth floatValue]/2);
//        }
//
//
//        if (height >0 ) {
//            picV.frame = CGRectMake( 12, self.detailLabel.bottom + 10*KWIDTH, (screen_width - 24)/2, height);
//        } else{
//            picV.frame = CGRectMake( 12, self.detailLabel.bottom + 10*KWIDTH, (screen_width - 24)/2, 0);
//        }
//
//        [self.contentView addSubview:picV];
//
//        UITapGestureRecognizer* singleRecognizer;
//        singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
//        //点击的次数
//        singleRecognizer.numberOfTapsRequired = 1; // 单击
//        picV.userInteractionEnabled = YES;
//        [picV addGestureRecognizer:singleRecognizer];
//        [self.smallArray addObject:picV];
//
//        self.btmView.y = picV.bottom + 3;
//    }else{
//        NSInteger line = count / 3;
//        if(count % 3 > 0) line++;
//        CGFloat imageWh = (screen_width - 60) / 3;
//        for (NSInteger i = 0; i < count; i++) {
//            PublishFreshImage *imgaModel = [imageAarray objectAtIndexWithCheck:i];
//            NSString *downloadUrl = [CommonTools URLConverToURL:imgaModel.PhotoPathSmall];
//
//            UIImageView *picV = [[UIImageView alloc]init];
//            picV.contentMode = UIViewContentModeScaleAspectFill;
//            picV.clipsToBounds = YES;
//            [picV sd_setImageWithURL:[NSURL URLWithString:downloadUrl] placeholderImage:[UIImage imageNamed:@""]];
//            picV.frame = CGRectMake(12 + i % 3 * (12 + imageWh),self.detailLabel.bottom + 10*KWIDTH + i / 3 * (12 + imageWh), imageWh, imageWh);
//            picV.tag = i;
//
//            [self.smallArray addObject:picV];
//            UITapGestureRecognizer* singleRecognizer;
//            singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
//            //点击的次数
//            singleRecognizer.numberOfTapsRequired = 1; // 单击
//            picV.userInteractionEnabled = YES;
//            [picV addGestureRecognizer:singleRecognizer];
//
//            [self.contentView addSubview:picV];
//        }
//        self.btmView.y = self.detailLabel.bottom + 10*KWIDTH + line * (12 + imageWh);
//    }
//
//    //    self.headView.squareModel = refrashModel;
//
//    self.cellHeight = self.btmView.bottom;
//
//    self.frame = CGRectMake(0, 0, screen_width, self.cellHeight);
//}
#pragma mark - getters and setters
-(void)setRefrashModel:(NewRefreshModel *)refrashModel{
    
    
    _refrashModel = refrashModel;
    
    for (UIView *subView in self.contentView.subviews) {
        NSLog(@"%@",subView);
        if ([subView isKindOfClass:[UIImageView class]]) {
            [subView removeFromSuperview];
        }
    }
   
    
    [self.homeView.moreBtn setImage:[UIImage imageNamed:@"icon_novelty_report"] forState:UIControlStateNormal];;
    
    NSString *pathIcon = refrashModel.HeadImaBig;

//    [CommonTools URLConverToURL:refrashModel.HeadImaSmall];
    
    [self.homeView.iconImagView sd_setImageWithURL:[NSURL URLWithString:pathIcon] placeholderImage:[UIImage imageNamed:@"5gshidi"]];
    if (refrashModel.IsAuth_Anchor == 1) {
        self.homeView.authImageView.hidden = NO;
    }else
    {
        self.homeView.authImageView.hidden =  YES;
    }

 
//    self.btmView.pariseBtn.selected = refrashModel.IsUpvote == 1?YES:NO;
    NSString *comment = [NSString stringWithFormat:@" %@",LStringInt(refrashModel.CommentCount)];
    NSString *pariseL = [NSString stringWithFormat:@" %@",refrashModel.LoveCount];
    NSString *rewardCount = [NSString stringWithFormat:@" %@",refrashModel.RewardCount];

//    self.btmView.pariseLabel.text = pariseL;
//    [self.btmView.commentBtn setTitle:comment forState:UIControlStateNormal];
//    [self.btmView.giftBtn setTitle:rewardCount forState:UIControlStateNormal];

    [self.homeView fillWithfrashModel:refrashModel];
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:16 * KWIDTH]};
    //    CGsize
    CGSize fontSize = sizeWithText(refrashModel.FreshTitle, attribute, CGSizeMake(screen_width -30*KWIDTH, 0));

    self.detailLabel.text = refrashModel.FreshTitle;
    self.detailLabel.frame = CGRectMake(15 * KWIDTH, self.homeView.bottom, screen_width -30*KWIDTH, fontSize.height);

    CGFloat  height;
    
    CGFloat  imageBottom;

    [self.smallArray removeAllObjects];

    if (refrashModel.FreshType == 1) {
        NSArray *imageAarray = refrashModel.FreshImages;
        
        NSInteger count = imageAarray.count;
        if(count==0){
            self.detailImageV.frame = CGRectMake(15*KWIDTH, self.detailLabel.bottom + MARGIN, screen_width - 30*KWIDTH, 0);
            imageBottom = self.detailImageV.bottom + 10*KWIDTH;
        }else if (count==1){
            PublishFreshImage *imgaModel = [imageAarray objectAtIndexWithCheck:0];
            
            NSString *downloadUrl = refrashModel.HeadImaBig;
            
            UIImageView *picV = [[UIImageView alloc]init];
            picV.tag = 0;
            self.smallImage = picV;
            [picV sd_setImageWithURL:[NSURL URLWithString:downloadUrl] placeholderImage:[UIImage imageNamed:@""]];
            
            if (imgaModel.PhotoWidth == nil) {
                height = (screen_width-30*KWIDTH)/2;
            } else {
                height = (screen_width-30*KWIDTH)*([imgaModel.PhotoHeight floatValue]/[imgaModel.PhotoWidth floatValue]/2);
            }
            
            
            if (height >0 ) {
                picV.frame = CGRectMake( 15*KWIDTH, self.detailLabel.bottom + 10*KWIDTH, (screen_width - 30*KWIDTH)/2, height);
            } else{
                picV.frame = CGRectMake( 15*KWIDTH, self.detailLabel.bottom + 10*KWIDTH, (screen_width - 30*KWIDTH)/2, 0);
            }
            
            [self.contentView addSubview:picV];
            UITapGestureRecognizer* singleRecognizer;
            singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
            //点击的次数
            singleRecognizer.numberOfTapsRequired = 1; // 单击
//            picV.userInteractionEnabled = YES;
            [picV addGestureRecognizer:singleRecognizer];
            [self.smallArray addObject:picV];
            
            
            imageBottom = picV.bottom + 10*KWIDTH;
        }else{
            NSInteger line = count / 3;
            if(count % 3 > 0) line++;
            CGFloat imageWh = (screen_width - 50*KWIDTH) / 3;
            for (NSInteger i = 0; i < count; i++) {
//                PublishFreshImage *imgaModel = [imageAarray objectAtIndexWithCheck:i];
                NSString *downloadUrl =refrashModel.HeadImaBig;
//
                UIImageView *picV = [[UIImageView alloc]init];
                picV.contentMode = UIViewContentModeScaleAspectFill;
                picV.clipsToBounds = YES;
                [picV sd_setImageWithURL:[NSURL URLWithString:downloadUrl] placeholderImage:[UIImage imageNamed:@""]];
                picV.frame = CGRectMake(15*KWIDTH + i % 3 * (10*KWIDTH + imageWh),self.detailLabel.bottom + 10*KWIDTH + i / 3 * (10*KWIDTH + imageWh), imageWh, imageWh);
                picV.tag = i;
                
                [self.smallArray addObject:picV];
                UITapGestureRecognizer* singleRecognizer;
                singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
                //点击的次数
                singleRecognizer.numberOfTapsRequired = 1; // 单击
//                picV.userInteractionEnabled = YES;
                [picV addGestureRecognizer:singleRecognizer];
                
                [self.contentView addSubview:picV];
            }
            
            
            imageBottom = self.detailLabel.bottom + 10*KWIDTH + line * (12 + imageWh);
        }
    } else {
        NSArray *videoAarray = refrashModel.FreshVideos;
//        FreshVideo *videoModel = [videoAarray objectAtIndexWithCheck:0];
        NSString *downloadUrl = refrashModel.HeadImaBig;
        
        
        UIImageView *picV = [[UIImageView alloc]init];
        [picV sd_setImageWithURL:[NSURL URLWithString:downloadUrl] placeholderImage:[UIImage imageNamed:@""]];

        picV.frame = CGRectMake(15*KWIDTH, self.detailLabel.bottom + 10*KWIDTH, 250*0.8*KWIDTH, 440*0.8*KWIDTH);
        picV.contentMode = UIViewContentModeScaleAspectFill;
        picV.clipsToBounds = YES;
        [self.contentView addSubview:picV];
        UITapGestureRecognizer* singleRecognizer;
        singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTapVideo:)];
        //点击的次数
        singleRecognizer.numberOfTapsRequired = 1; // 单击
//        picV.userInteractionEnabled = YES;
        [picV addGestureRecognizer:singleRecognizer];
        
        
        UIImageView *palyImag = [[UIImageView alloc]init];
        palyImag.image = [UIImage imageNamed:@"vs_start_preview"];
        
        palyImag.frame = CGRectMake(0, 0, 80*KWIDTH, 80*KWIDTH);
        palyImag.center = picV.center;
        [self.contentView addSubview:palyImag];
        imageBottom = picV.bottom + 10*KWIDTH;
    }

    self.addressLabel.frame = CGRectMake(self.detailLabel.left,imageBottom, 150, 12*KWIDTH);
    self.timeLabel.frame = CGRectMake(screen_width-150, self.addressLabel.top, 140,12 *KWIDTH);
    NSString *address;
    if (refrashModel.FreshCity.length >0&&refrashModel.Business.length>0) {
        address =  [NSString stringWithFormat:@"%@.%@" ,refrashModel.FreshCity,refrashModel.Business];
    } else if(refrashModel.FreshCity.length == 0){
        address =  [NSString stringWithFormat:@"%@",refrashModel.Business?refrashModel.Business:@""];
    }else
    {
       address =  [NSString stringWithFormat:@"%@" ,refrashModel.FreshCity?refrashModel.FreshCity:@""];
    }
    self.addressLabel.text = address;
    //
    NSString *timeString;
//    = [CommonTools swichStringtoData:refrashModel.FreshCreateTime];
    CGFloat longer = (CGFloat)refrashModel.Distance/1000;

    NSString *dis = [NSString stringWithFormat:@"%0.2fkm",longer];

    if (refrashModel.Distance >0&&refrashModel.FreshCreateTime.length>0) {
        timeString =  [NSString stringWithFormat:@"%@.%@" ,dis,timeString];
    } else if(refrashModel.FreshCreateTime.length == 0){
        timeString =  [NSString stringWithFormat:@"%@",dis?dis:@""];
    }else
    {
        timeString =  [NSString stringWithFormat:@"%@" ,timeString?timeString:@""];
    }
    self.timeLabel.text = timeString;
   self.cellHeight =self.addressLabel.bottom + 5*KWIDTH ;
    
    self.frame = CGRectMake(0, 0, screen_width, self.cellHeight);

}

//-(SquareUserInfoHeaderView *)headView{
//    if(_headView==nil){
//        _headView = [[SquareUserInfoHeaderView alloc]initWithFrame:CGRectMake(0, 0, screen_width, 85 * KWIDTH) headType:SQUARE];
//    }
//    return _headView;
//}

//-(SquareBtmInfoView *)btmView{
//    if (_btmView==nil) {
//        _btmView = [[SquareBtmInfoView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 40 * KWIDTH) withType:@"愿望"];
//        _btmView.delegate = self;
//    }
//    return _btmView;
//}

-(UILabel *)detailLabel{
    if(_detailLabel==nil){
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.textColor = RGBColor(51,51,51);
        _detailLabel.font =[UIFont systemFontOfSize:16*KWIDTH];
        _detailLabel.numberOfLines = 0;
        _detailLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _detailLabel;
}

-(UILabel *)addressLabel{
    if(_addressLabel==nil){
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.textColor = RGBColor(255, 53, 116);
        _addressLabel.font =[UIFont fontWithName:@"PingFang-SC-Medium" size:10 * KWIDTH];
        _addressLabel.numberOfLines = 0;
        _addressLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _addressLabel;
}
-(UILabel *)timeLabel{
    if(_timeLabel==nil){
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = RGBColor(153, 153, 153);
        _timeLabel.font =[UIFont fontWithName:@"PingFang-SC-Medium" size:10 * KWIDTH];
        _timeLabel.numberOfLines = 0;
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
}

-(UIImageView *)detailImageV{
    if(_detailImageV==nil){
        _detailImageV = [[UIImageView alloc]init];
    }
    return _detailImageV;
}

#pragma mark - another
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

