//
//  addViewCell.m
//  LXGGView
//
//  Created by jonejia on 2018/5/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "addViewCell.h"

@implementation addViewCell
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (screen_width- 55)/5, (screen_width- 55)/5)];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        [self.contentView addSubview:imageView];
        
        _imageView = imageView;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapShow:)];
        imageView.userInteractionEnabled = YES;
        [imageView addGestureRecognizer:tapGesture];

        self.contentView.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}
-(void)tapShow:(UITapGestureRecognizer *)tap{
    
    if ([self.dateDelegate respondsToSelector:@selector(didpublickPictureCollCellClick:type:)]){
        [self.dateDelegate didpublickPictureCollCellClick:self type:@"添加"];
    }
    
}
@end
