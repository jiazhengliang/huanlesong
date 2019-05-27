//
//  SexAndAgeView.h
//  huanLeSong
//
//  Created by jonejia on 2018/10/24.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SexAndAgeView : UIView
-(instancetype)initWithFrame:(CGRect)frame;
-(void)fillWithSex:(NSInteger)sex withAge:(NSString *)age withVipLever:(NSInteger)vipLever;
@end
