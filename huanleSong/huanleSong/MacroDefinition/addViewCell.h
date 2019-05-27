//
//  addViewCell.h
//  LXGGView
//
//  Created by jonejia on 2018/5/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PubicPicCollectionViewCell.h"
@interface addViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *converView;
@property (nonatomic, weak) id<publickPictureDelegate> dateDelegate;

@end
