//
//  MineViewCell.h
//  huanLeSong
//
//  Created by Wendy China on 2018/5/7.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MineViewCell : UITableViewCell

/**
 标题
 */
@property (nonatomic, strong) UILabel *titleLabel;


@property (nonatomic, strong) UILabel *subTitleLabel;

/**
 图标
 */
@property (nonatomic, strong) UIImageView *imagView;
@end
