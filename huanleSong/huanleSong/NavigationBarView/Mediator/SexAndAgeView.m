//
//  SexAndAgeView.m
//  huanLeSong
//
//  Created by jonejia on 2018/10/24.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "SexAndAgeView.h"
@interface SexAndAgeView()
/**
 性别背景
 */
@property (nonatomic, strong) UIImageView *ageBgView;

/**
 性别
 */
@property (nonatomic, strong) UIImageView *sexView;

/**
 年龄
 */
@property (nonatomic, strong) UILabel *ageLabel;


@property (nonatomic, strong) UIImageView *vipView;

@end
@implementation SexAndAgeView
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame])
    {
        self.backgroundColor = [UIColor whiteColor];

        [self addSubview:self.ageBgView];
        [self.ageBgView addSubview:self.sexView];
        [self.ageBgView addSubview:self.ageLabel];
        [self addSubview:self.vipView];
        self.ageBgView.frame = CGRectMake(MARGIN, 5, 33*KWIDTH , 15*KWIDTH);
        self.sexView.frame = CGRectMake(3*KWIDTH, 2.5*KWIDTH, 10*KWIDTH, 10*KWIDTH);
        self.ageLabel.frame = CGRectMake(self.sexView.right+3*KWIDTH, 0, 20*KWIDTH,15*KWIDTH);
        self.vipView.frame = CGRectMake(self.ageBgView.right+5,self.ageBgView.top, 53*KWIDTH, 15*KWIDTH);
        
    }
    return self;
}

-(UIImageView *)vipView
{
    if (!_vipView) {
        _vipView = [[UIImageView alloc] init];
        
    }
    return _vipView;
}

-(UIImageView *)ageBgView{
    if (!_ageBgView) {
        _ageBgView = [[UIImageView alloc] init];
        _ageBgView.image = [UIImage imageNamed:@"home_icon_sex_bg"];
    }
    return _ageBgView;
}
-(UIImageView *)sexView
{
    if (!_sexView) {
        _sexView = [[UIImageView alloc] init];
        _sexView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _sexView;
}

-(UILabel *)ageLabel{
    if (!_ageLabel) {
        _ageLabel = [[UILabel alloc] init];
        _ageLabel.textColor = [UIColor whiteColor];
        _ageLabel.font =[UIFont fontWithName:@"PingFang-SC-Medium" size:12*KWIDTH];
        _ageLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _ageLabel;
}

-(void)fillWithSex:(NSInteger)sex withAge:(NSString *)age withVipLever:(NSInteger)vipLever
{
//    NSString *vipImag = [VipCommonTool getVipImageWith:vipLever];
    self.vipView.image = [UIImage imageNamed:@""];
    self.ageLabel.text = age;
    if (sex == 1) {
        self.sexView.image = [UIImage imageNamed:@"home_icon_man"];
    } else
    {
        self.sexView.image = [UIImage imageNamed:@"home_icon_woman"];
    }

}

@end
