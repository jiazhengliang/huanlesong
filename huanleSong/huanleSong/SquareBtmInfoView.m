//
//  SquareBtmInfoView.m
//  huanLeSong
//
//  Created by mitko on 2018/5/16.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "SquareBtmInfoView.h"

@interface SquareBtmInfoView()


@end

@implementation SquareBtmInfoView

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}

-(void)layoutSubviews{
    [super layoutSubviews];
}

-(instancetype)initWithFrame:(CGRect)frame withType:(NSString *)type{
    if(self=[super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        
//        [self addSubview:self.line];
//        self.line.hidden = YES;
        [self addSubview:self.commentBtn];
        
        
        [self addSubview:self.pariseBtn];
//        [self addSubview:self.moreBtn];
        [self addSubview:self.giftBtn];
        [self addSubview:self.pariseLabel];
        [self addSubview:self.commentLabel];
        [self addSubview:self.giftLabel];
      
        _pariseBtn.frame =CGRectMake(15*KWIDTH, 5, 22*KWIDTH, 22*KWIDTH);
        
        _pariseLabel.frame = CGRectMake(self.pariseBtn.right+2*KWIDTH, self.pariseBtn.top, 60*KWIDTH, 22*KWIDTH);
        
        
        _commentBtn.frame = CGRectMake(self.pariseBtn.left+80*KWIDTH,_pariseBtn.top, 80*KWIDTH, 22*KWIDTH);
        
        _commentBtn.centerX = _pariseBtn.centerX+80*KWIDTH;
        _giftBtn.frame = CGRectMake(self.commentBtn.left+80*KWIDTH,_pariseBtn.top, 100*KWIDTH, 22*KWIDTH);
        _giftBtn.centerX = _commentBtn.centerX+80*KWIDTH;

    }
    return self;
}

-(void)commentClick{
    if ([self.delegate respondsToSelector:@selector(clickMoreInfo:)]){
        [self.delegate clickMoreInfo:@"评论"];
    };
}

-(void)praiseBtnClick{

    if ([self.delegate respondsToSelector:@selector(clickMoreInfo:)]){
        [self.delegate clickMoreInfo:@"赞"];

        _pariseBtn.selected = YES;
    };
}
-(void)giftBtnClick{
    NSLog(@"第一1111");
    if ([self.delegate respondsToSelector:@selector(clickMoreInfo:)]){
        [self.delegate clickMoreInfo:@"打赏"];
    };
}

-(void)moreBtnClick{
    NSLog(@"第一1111");
    if ([self.delegate respondsToSelector:@selector(clickMoreInfo:)]){
        [self.delegate clickMoreInfo:@"更多"];
    };
    
}

#pragma mark - setters and getters
//-(UIView *)line{
//    if(_line==nil){
//        _line = [[UIView alloc] initWithFrame:CGRectMake(15, 10, screen_width-30, 0)];
//        _line.backgroundColor = RGBColor(245,245,245);
//    }
//    return _line;
//}

-(UIButton *)commentBtn{
    if(_commentBtn==nil){
        _commentBtn = [[UIButton alloc] init];
        [_commentBtn setImage:[UIImage imageNamed:@"icon_novelty_talk"] forState:UIControlStateNormal];
        [_commentBtn addTarget:self action:@selector(commentClick) forControlEvents:UIControlEventTouchUpInside];
        _commentBtn.titleLabel.font = [UIFont systemFontOfSize:12*KWIDTH];
        [_commentBtn setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
    }
    return _commentBtn;
}

-(UIButton *)pariseBtn{
    if(_pariseBtn==nil){
        _pariseBtn  = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44*KWIDTH, 44*KWIDTH)];
//        _pariseBtn.sparkIcon = [UIImage imageNamed:@"icon_novelty_praise"];

        [_pariseBtn setImage:[UIImage imageNamed:@"icon_novelty_praise_no"] forState:UIControlStateNormal];
        [_pariseBtn setImage:[UIImage imageNamed:@"icon_novelty_praise"] forState:UIControlStateSelected];
        [_pariseBtn addTarget:self action:@selector(praiseBtnClick) forControlEvents:UIControlEventTouchUpInside];

    }
    return _pariseBtn;
}

-(UIButton *)giftBtn{
    if(_giftBtn==nil){
        _giftBtn = [[UIButton alloc] init];
        [_giftBtn setImage:[UIImage imageNamed:@"icon_novelty_reward"] forState:UIControlStateNormal];
        [_giftBtn addTarget:self action:@selector(giftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_giftBtn setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateSelected];
        [_giftBtn setTitleColor:RGBColor(153, 153, 153) forState:UIControlStateNormal];
        _giftBtn.titleLabel.font = [UIFont systemFontOfSize:12*KWIDTH];
    }
    return _giftBtn;
}



-(UIButton *)moreBtn{
    if(_moreBtn==nil){
        _moreBtn = [[UIButton alloc] init];
        [_moreBtn setImage:[UIImage imageNamed:@"home_icon_more"] forState:UIControlStateNormal];
        [_moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _moreBtn;
}


-(UILabel *)pariseLabel
{
    if (_pariseLabel == nil) {
        _pariseLabel = [[UILabel alloc] init];
        _pariseLabel.textColor = RGBColor(153, 153, 153);
        _pariseLabel.font = [UIFont systemFontOfSize:12*KWIDTH];
        _pariseLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _pariseLabel;
}


-(UILabel *)commentLabel{
    if (!_commentLabel) {
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.textColor =RGBColor(255,94,142);
        _commentLabel.font = [UIFont systemFontOfSize:11*KWIDTH];
        _commentLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _commentLabel;
}
-(UILabel *)giftLabel{
    if (!_giftLabel) {
        _giftLabel = [[UILabel alloc] init];
        _giftLabel.textColor = [UIColor whiteColor];
        _giftLabel.font = [UIFont systemFontOfSize:11*KWIDTH];
        _giftLabel.textAlignment = NSTextAlignmentLeft;
    }
    return _giftLabel;
}



@end




