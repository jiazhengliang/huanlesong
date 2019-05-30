//
//  MineViewCell.m
//  huanLeSong
//
//  Created by Wendy China on 2018/5/7.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "MineViewCell.h"
@interface MineViewCell()


@property (nonatomic, strong) UIImageView *arrView;

@end
@implementation MineViewCell

-(UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = RGBColor(74, 74, 74);
        _titleLabel.font =[UIFont fontWithName:@"PingFang-SC-Medium" size:15*KWIDTH];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        
    }
    return _titleLabel;
}

-(UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc] init];
        _subTitleLabel.textColor = RGBColor(74, 74, 74);
        _subTitleLabel.font =[UIFont fontWithName:@"PingFang-SC-Medium" size:15*KWIDTH];
        _subTitleLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return _subTitleLabel;
}


-(UIImageView *)imagView
{
    if (!_imagView) {
        _imagView = [[UIImageView alloc] init];
        
        //        _imagView.backgroundColor = [UIColor grayColor];
    }
    return _imagView;
}


-(UIImageView *)arrView
{
    if (!_arrView) {
        _arrView = [[UIImageView alloc] init];
        _arrView.image = [UIImage imageNamed:@"more_list"];
    }
    return _arrView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imagView.frame = CGRectMake(20, 13*KWIDTH, 21*KWIDTH, 20*KWIDTH);
    self.titleLabel.frame = CGRectMake(self.imagView.right+5, self.imagView.top , 100*KWIDTH, 20*KWIDTH);
    self.arrView.frame = CGRectMake(screen_width-30, 13*KWIDTH, 20*KWIDTH, 20*KWIDTH);
    
    self.subTitleLabel.frame = CGRectMake(screen_width-150*KWIDTH, 13*KWIDTH, 120*KWIDTH, 20*KWIDTH)
    ;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.imagView];
        [self.contentView addSubview:self.arrView];
        [self.contentView addSubview:self.subTitleLabel];
        self.subTitleLabel.hidden = YES;

        [self setNeedsUpdateConstraints];
        [self updateConstraintsIfNeeded];
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
