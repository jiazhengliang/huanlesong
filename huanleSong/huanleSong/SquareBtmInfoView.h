//
//  SquareBtmInfoView.h
//  huanLeSong
//
//  Created by mitko on 2018/5/16.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SquareBtmInfoViewDelegate <NSObject>

-(void)clickMoreInfo:(NSString*)type;

@end

@interface SquareBtmInfoView : UIView

@property (nonatomic,strong) UIButton *pariseBtn;

@property (nonatomic,strong) UILabel *pariseLabel;


-(instancetype)initWithFrame:(CGRect)frame withType:(NSString *)type;

@property (nonatomic,weak) id<SquareBtmInfoViewDelegate>delegate;

@property (nonatomic,strong) UIButton *moreBtn;

@property (nonatomic,strong) UIView *line;
@property (nonatomic,strong) UIButton *commentBtn;
@property (nonatomic,strong) UILabel *commentLabel;
@property (nonatomic,strong) UIButton *giftBtn;
@property (nonatomic,strong) UILabel *giftLabel;


@end
