//
//  IconImageView.m
//  huanLeSong
//
//  Created by jonejia on 2018/5/11.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "IconImageView.h"

@implementation IconImageView

-(instancetype)init{
    self =  [super init];
    
    if (self) {
        self.backgroundColor = RGBColor(74, 74, 74);
        NSLog(@"头像初始化");
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];

}


-(void)CornerLayer:(CGFloat)widths
{
    self.layer.cornerRadius = widths/2;
    self.layer.masksToBounds = YES;
    self.userInteractionEnabled = YES;

}

-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    self.layer.cornerRadius = frame.size.width/2;
    self.layer.masksToBounds = YES;
    self.userInteractionEnabled = YES;
}


@end
