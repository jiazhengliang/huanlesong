//
//  XYPhotosTableViewCell.h
//  huanLeSong
//
//  Created by Alex China on 2018/10/9.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYPhotosTableViewCell : UITableViewCell

@property(nonatomic,strong,readonly)UIView *lHeaderView;

//
@property(nonatomic,strong)NSMutableArray *photos;

//默认为4
@property(nonatomic,assign)NSInteger photosMaxCount;

//每行显示几个图，默认4个
@property(nonatomic,assign)NSInteger rowCount;

@end

@interface XYDelButton : UIView

@property(nonatomic,strong)UIButton *delButton;
@property(nonatomic,strong)UIButton *imgButton;

@end
