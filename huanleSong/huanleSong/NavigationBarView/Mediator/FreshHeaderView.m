//
//  FreshHeaderView.m
//  huanLeSong
//
//  Created by jonejia on 2018/10/24.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "FreshHeaderView.h"
#import "SexAndAgeView.h"
@interface FreshHeaderView()
@property (nonatomic, strong) SexAndAgeView *sexVipView;
@end

@implementation FreshHeaderView

-(UILabel *)nickName{
    if (!_nickName) {
        _nickName = [[UILabel alloc] init];
        _nickName.textColor = RGBColor(102,102,102);
        _nickName.font =[UIFont fontWithName:@"PingFang-SC-Medium" size:15*KWIDTH];
        _nickName.textAlignment = NSTextAlignmentLeft;
        
    }
    return _nickName;
}


-(UIButton *)localBtn{
    if (!_localBtn) {
        _localBtn = [[UIButton alloc] init];
        [_localBtn setImage:[UIImage imageNamed:@"home_icon_address"] forState:UIControlStateNormal];
        [_localBtn addTarget:self action:@selector(localBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _localBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        [_localBtn setTitleColor:RGBColor(163,162,168) forState:UIControlStateNormal];
        
    }
    return _localBtn;
}

-(UIImageView *)authImageView
{
    if (_authImageView == nil) {
        _authImageView = [[UIImageView alloc] init];
        _authImageView.image = [UIImage imageNamed:@"auth_vip"];
        
    }
    return _authImageView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.iconImagView];
        [self addSubview:self.nickName];
        [self addSubview:self.sexVipView];
        [self addSubview:self.moreBtn];
        [self addSubview:self.authImageView];

        self.iconImagView.frame = CGRectMake(15 * KWIDTH, 15*KWIDTH, 44*KWIDTH, 44*KWIDTH);
        self.authImageView.frame = CGRectMake(self.iconImagView.right-15*KWIDTH, self.iconImagView.bottom-15*KWIDTH, 15*KWIDTH, 15*KWIDTH);
        
        self.moreBtn.frame = CGRectMake(screen_width - 50*KWIDTH, 15*KWIDTH,44*KWIDTH, 44*KWIDTH);
    }
    return self;
}
-(SexAndAgeView *)sexVipView
{
    if (_sexVipView == nil) {
        _sexVipView = [[SexAndAgeView alloc] init];
    }
    return _sexVipView;
}

-(IconImageView *)iconImagView
{
    if (!_iconImagView) {
        _iconImagView = [[IconImageView alloc] init];
        
        UITapGestureRecognizer* singleRecognizer;
        singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(SingleTap:)];
        //点击的次数
        singleRecognizer.numberOfTapsRequired = 1; // 单击
        //给self.view添加一个手势监测；
        [_iconImagView addGestureRecognizer:singleRecognizer];
        
    }
    return _iconImagView;
}
-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    //    [self layouFrameWithName:@""];
}


-(void)fillWithfrashModel:(NewRefreshModel *)refrashModel{
    
    NSString *pathIcon =refrashModel.HeadImaBig;
//    = [CommonTools URLConverToURL:refrashModel.HeadImaSmall];
    
    [self.iconImagView sd_setImageWithURL:[NSURL URLWithString:pathIcon] placeholderImage:[UIImage imageNamed:@"dynamic_default_avatar"]];
    
    self.nickName.text = refrashModel.Nickname;
    
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont fontWithName:@"PingFang-SC-Medium" size:15*KWIDTH]};
    //    CGsize
    CGSize fontSize = sizeWithText(refrashModel.Nickname, attribute, CGSizeMake(120, 0));
        
    
    self.nickName.frame = CGRectMake(self.iconImagView.right+MARGIN, 0, fontSize.width, 22*KWIDTH);
    self.nickName.centerY = self.iconImagView.centerY;
    self.nickName.textColor = RGBColor(255, 53, 116);
    self.sexVipView.frame = CGRectMake(self.nickName.right+MARGIN, self.nickName.top, 90*KWIDTH , 22*KWIDTH);
    
    [_sexVipView fillWithSex:refrashModel.Sex withAge:refrashModel.Age withVipLever:refrashModel.VipLevel];

}


-(void)localBtnClick
{
    NSLog(@"点了头部的位置");
}

-(void)SingleTap:(UITapGestureRecognizer*)tap
{
    if ([self.dateDelegate respondsToSelector:@selector(didHomeHeaderViewClickIcon:Cell:)]){
        [self.dateDelegate didHomeHeaderViewClickIcon:@"头像" Cell:self.cell];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
}

-(UIButton *)moreBtn{
    if(_moreBtn==nil){
        _moreBtn = [[UIButton alloc] init];
        [_moreBtn setImage:[UIImage imageNamed:@"icon_novelty_report"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}

-(void)moreBtnClick{
    if ([self.dateDelegate respondsToSelector:@selector(didHomeHeaderViewClickIcon:Cell:)]){
        [self.dateDelegate didHomeHeaderViewClickIcon:@"更多" Cell:self.cell];
    }
}
@end

