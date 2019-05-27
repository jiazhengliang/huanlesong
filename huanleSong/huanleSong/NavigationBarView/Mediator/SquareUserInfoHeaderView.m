//
//  SquareUserInfoHeaderView.m
//  huanLeSong
//
//  Created by mitko on 2018/5/16.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "SquareUserInfoHeaderView.h"
#import "IconImageView.h"
#import "NewRefreshModel.h"

@interface SquareUserInfoHeaderView()


@property (nonatomic,strong) IconImageView *iconV;
@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *distanceAndTimeLabel;
@property (nonatomic,strong) UILabel *sexAndAgeAndAddrLabel;

@end

@implementation SquareUserInfoHeaderView

#pragma mark - life cycle

-(instancetype)initWithFrame:(CGRect)frame headType:(HeadType)headType{
    if(self=[super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.iconV];
        [self addSubview:self.userNameLabel];
        [self addSubview:self.distanceAndTimeLabel];
        [self addSubview:self.sexAndAgeAndAddrLabel];
        self.headType = headType;
    }
    return self;
}

#pragma mark - getters and setters
-(void)setIsTest:(BOOL)isTest{
    _isTest = isTest;

}

-(void)setSquareModel:(NewRefreshModel *)squareModel{
    _squareModel = squareModel;
    NSString *sex;
    if(squareModel.Sex==1){
        sex = @"男";
    }else if (squareModel.Sex ==2){
        sex = @"女";
    }else{
        sex = @"已隐藏";
    }
    NSString *age = squareModel.Age?squareModel.Age:@"保密";
    NSString *city = squareModel.FreshCity;
    if([city isEqualToString:@"0"]){
        city = @"未知地址";
    }
    NSString *sexInfo = [NSString stringWithFormat:@"%@ | %@ | %@",sex,age,city];
    
    self.iconV.frame = CGRectMake(15 * KWIDTH, 15 * KWIDTH, 55 * KWIDTH, 55 * KWIDTH);

    NSString *downloadUrl = [CommonTools URLConverToURL:squareModel.HeadImaSmall];

    [self.iconV sd_setImageWithURL:[NSURL URLWithString:downloadUrl] placeholderImage:[UIImage imageNamed:@"header.jpeg"]];
    
    self.userNameLabel.frame = CGRectMake(88 * KWIDTH, 22 * KWIDTH, 173 * KWIDTH, 16 * KWIDTH);
    
    self.distanceAndTimeLabel.frame = CGRectMake(screen_width - 14 * KWIDTH - 106 * KWIDTH, 23 * KWIDTH, 106 * KWIDTH, 12);
    
    self.sexAndAgeAndAddrLabel.frame = CGRectMake(88 * KWIDTH, 50 * KWIDTH, 162 * KWIDTH, 14 * KWIDTH);
    
    self.userNameLabel.text = squareModel.Nickname;
    NSString *timeString = [CommonTools swichStringtoData:squareModel.FreshCreateTime];
    
    CGFloat longer = (CGFloat)squareModel.Distance/1000;
    
     self.distanceAndTimeLabel.text =[NSString stringWithFormat:@"%0.2fkm|%@",longer,timeString];
    
    NSString *income = squareModel.Income?squareModel.Income:@"保密";
    NSString *area = squareModel.FreshArea?squareModel.FreshArea:@"保密";
    
    self.sexAndAgeAndAddrLabel.text = [NSString stringWithFormat:@"%@ | %@ | %@",income,age,area];



}

//-(void)fillWithModel:(NearAuthModel *)model
//{
//    NSString *sex;
//    if([model.Sex isEqualToString:@"1"]){
//        sex = @"男";
//    }else if ([model.Sex isEqualToString:@"2"]){
//        sex = @"女";
//    }else{
//        sex = @"已隐藏";
//    }
//    NSString *age = model.Age;
//    NSString *city = model.Area;
//    if([city isEqualToString:@"0"]){
//        city = @"未知地址";
//    }
//    
//    self.iconV.frame = CGRectMake(15 * KWIDTH, 15 * KWIDTH, 55 * KWIDTH, 55 * KWIDTH);
//    NSString *path = [CommonTools URLConverToURL:model.HeadImageSmall];
//    
//    [self.iconV sd_setImageWithURL:[NSURL URLWithString:path] placeholderImage:[UIImage imageNamed:@"header.jpeg"]];
//    
//    self.userNameLabel.frame = CGRectMake(88 * KWIDTH, 22 * KWIDTH, 173 * KWIDTH, 16 * KWIDTH);
//    
//    self.distanceAndTimeLabel.frame = CGRectMake(screen_width - 14 * KWIDTH - 106 * KWIDTH, 23 * KWIDTH, 106 * KWIDTH, 12);
//    
//    self.sexAndAgeAndAddrLabel.frame = CGRectMake(88 * KWIDTH, 50 * KWIDTH, 162 * KWIDTH, 14 * KWIDTH);
//    
//    self.userNameLabel.text = model.Nickname;
//
//
//    NSString *sexAgeAddr = [NSString stringWithFormat:@"%@/$%@K+/%@",(model.Age?model.Age:@"保密"),(model.Income?model.Income:@"0"),(model.Area?model.Area:@"不详")];
//    NSString *distanceLabel =[NSString stringWithFormat:@"0.61km  | %@",(model.LastLocationX?model.LastLocationX:@"不详")];
//
//    
//    self.sexAndAgeAndAddrLabel.text = sexAgeAddr;
//    self.distanceAndTimeLabel.text = distanceLabel;
//}

-(IconImageView *)iconV{
    if(_iconV==nil){
        _iconV = [[IconImageView alloc]init];
    }
    return _iconV;
}

-(UILabel *)userNameLabel{
    if(_userNameLabel==nil){
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.textColor = RGBColor(51,51,51);
        _userNameLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:16 * KWIDTH];
        _userNameLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _userNameLabel;
}

-(UILabel *)distanceAndTimeLabel{
    if(_distanceAndTimeLabel==nil){
        _distanceAndTimeLabel = [[UILabel alloc] init];
        _distanceAndTimeLabel.textColor = RGBColor(153,153,153);
        _distanceAndTimeLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:12 * KWIDTH];
        _distanceAndTimeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _distanceAndTimeLabel;
}

-(UILabel *)sexAndAgeAndAddrLabel{
    if(_sexAndAgeAndAddrLabel==nil){
        _sexAndAgeAndAddrLabel = [[UILabel alloc] init];
        _sexAndAgeAndAddrLabel.textColor = RGBColor(153,153,153);
        _sexAndAgeAndAddrLabel.font = [UIFont fontWithName:@"PingFang-SC-Medium" size:14 * KWIDTH];
        _sexAndAgeAndAddrLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _sexAndAgeAndAddrLabel;
}

@end




