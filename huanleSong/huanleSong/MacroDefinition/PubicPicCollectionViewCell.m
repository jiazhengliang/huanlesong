//
//  PubicPicCollectionViewCell.m
//  huanLeSong
//
//  Created by jonejia on 2018/5/28.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "PubicPicCollectionViewCell.h"

@implementation PubicPicCollectionViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
        
    }
    
    return self;
}

-(UIView *)converView
{
    if (_converView == nil) {
        _converView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, (screen_width- 55)/5, (screen_width- 55)/5)];
        _converView.backgroundColor = [UIColor blackColor];
        _converView.layer.cornerRadius = 4;
        _converView.layer.masksToBounds = YES;
        
        _converView.alpha = 0.4;
        _converView.hidden = YES;
        
    }
    return _converView;
}

-(void)creatImage:(UIImage *)iamge
{
    
    [_imageView removeFromSuperview];
    [_converView removeFromSuperview];
    [_picBes removeFromSuperview];
    [_deleBtn removeFromSuperview];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (screen_width- 55)/5, (screen_width- 55)/5)];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.clipsToBounds = YES;
    imageView.layer.cornerRadius = 4;
    [self.contentView addSubview:imageView];
    imageView.image = iamge;
    
    _imageView = imageView;

    [self.contentView addSubview:self.converView];
    [self.contentView addSubview:self.deleBtn];
    [self.contentView addSubview:self.picBes];
    
}


-(UIButton *)deleBtn
{
    if (_deleBtn== nil) {
        _deleBtn = [[UIButton alloc] init];
        _deleBtn.frame = CGRectMake((screen_width- 55)/5-18, 0, 18, 18);
        [_deleBtn setImage:[UIImage imageNamed:@"screen_icon_close"] forState:UIControlStateNormal];
        [_deleBtn addTarget:self action:@selector(deleBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleBtn;
}


-(UIButton *)picBes
{
    if (_picBes== nil) {
        _picBes = [[UIButton alloc] init];
        _picBes.frame =CGRectMake((screen_width- 55)/5-19,(screen_width- 55)/5-25, 19, 25);
        [_picBes setImage:[UIImage imageNamed:@"wish_icon_lock"] forState:UIControlStateSelected];
        [_picBes setImage:[UIImage imageNamed:@"wish_icon_unlock"] forState:UIControlStateNormal];
        
        [_picBes addTarget:self action:@selector(picBesBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _picBes;
}


-(void)deleBtn:(UIButton *)btn
{
    if ([self.dateDelegate respondsToSelector:@selector(didpublickPictureCollCellClick:type:)]){
        [self.dateDelegate didpublickPictureCollCellClick:self type:@"删除"];
    }
}



-(void)picBesBtn:(UIButton *)btn
{
    if (btn.selected == NO) {
        btn.selected = YES;
        _converView.hidden = NO;
        if ([self.dateDelegate respondsToSelector:@selector(didpublickPictureCollCellClick:type:)]){
            [self.dateDelegate didpublickPictureCollCellClick:self type:@"加锁"];
        }
    } else
    {
        btn.selected = NO;
        _converView.hidden = YES;
        if ([self.dateDelegate respondsToSelector:@selector(didpublickPictureCollCellClick:type:)]){
            [self.dateDelegate didpublickPictureCollCellClick:self type:@"解锁"];
        }
    }
    
    
}


-(void)tapShow:(UITapGestureRecognizer *)tap{
    
    if ([self.dateDelegate respondsToSelector:@selector(didpublickPictureCollCellClick:type:)]){
        [self.dateDelegate didpublickPictureCollCellClick:self type:@"图片"];
    }
    
}
@end
