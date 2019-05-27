//
//  PubicPicCollectionViewCell.h
//  huanLeSong
//
//  Created by jonejia on 2018/5/28.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>
#define collectionPictureW ((screen_width- 55)/5)

@protocol publickPictureDelegate <NSObject>

-(void)didpublickPictureCollCellClick:(UICollectionViewCell *)cell type:(NSString *)type;

@end
@interface PubicPicCollectionViewCell : UICollectionViewCell
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UIImageView *converView;
@property (nonatomic, strong)UIButton *deleBtn;
@property (nonatomic, strong)UIButton *picBes;

@property (nonatomic, weak) id<publickPictureDelegate> dateDelegate;
-(void)creatImage:(UIImage *)iamge;
@end
