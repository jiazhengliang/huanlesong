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

@property (nonatomic,strong) UIButton *blackbtn;


@property (nonatomic,strong) UIButton *jibaoBtn;


@end

@implementation SquareTableViewCell

-(UIButton *)blackbtn
{
    if (_blackbtn == nil) {
        _blackbtn = [[UIButton alloc] init];
        [_blackbtn setTitle:@"拉黑" forState:UIControlStateNormal];
        [_blackbtn setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
        _blackbtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _blackbtn;
}

-(UIButton *)jibaoBtn
{
    if (_jibaoBtn == nil) {
        _jibaoBtn = [[UIButton alloc] init];
        [_jibaoBtn setTitle:@"举报" forState:UIControlStateNormal];
        [_jibaoBtn setTitleColor:UIColor.grayColor forState:UIControlStateNormal];
        _jibaoBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    return _jibaoBtn;
}

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
        
        [self.contentView addSubview:self.blackbtn];
        [self.contentView addSubview:self.jibaoBtn];
        
        [self.blackbtn addTarget:self action:@selector(blockBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [self.jibaoBtn addTarget:self action:@selector(jibaoBtnClick) forControlEvents:UIControlEventTouchUpInside];

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

-(void)blockBtnClick
{
    NSLog(@"拉黑");
    if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
        [self.delegate clickMoreInfoInCell:self type:@"拉黑"];
    }
}

-(void)jibaoBtnClick
{
    NSLog(@"举报");
    if ([self.delegate respondsToSelector:@selector(clickMoreInfoInCell:type:)]){
        [self.delegate clickMoreInfoInCell:self type:@"举报"];
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
    self.timeLabel.frame = CGRectMake(10, self.addressLabel.top, 100,12 *KWIDTH);
    
    self.blackbtn.frame = CGRectMake(screen_width-210, self.timeLabel.top-10 *KWIDTH, 100,32 *KWIDTH);
    
    self.jibaoBtn.frame = CGRectMake(screen_width-110, self.timeLabel.top-10 *KWIDTH, 100,32 *KWIDTH);

    NSString *address;
    int rand  = arc4random() % 100000;
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
    CGFloat longer = (CGFloat)rand/1000;

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
   self.cellHeight =self.blackbtn.bottom + 15*KWIDTH ;
    
    self.frame = CGRectMake(0, 0, screen_width, self.cellHeight);

}


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

