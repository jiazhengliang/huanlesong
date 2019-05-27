//
//  jzlView.m
//  LXGGView
//
//  Created by jonejia on 2018/5/25.
//  Copyright © 2018年 漫漫. All rights reserved.
//

#import "jzlView.h"
//#import "SDPhotoBrowser.h"
#import "TZImagePickerController.h"
#import "PubicPicCollectionViewCell.h"
#import "addViewCell.h"
#define kKeyWindow [UIApplication sharedApplication].keyWindow

#define COL_COUNT 5
typedef enum : NSInteger {
    
    LXDataUrl,
    LXDataImage
}LXGGDataType;
@interface  jzlView()<UINavigationControllerDelegate, UIImagePickerControllerDelegate,TZImagePickerControllerDelegate,UICollectionViewDelegate,UICollectionViewDataSource,publickPictureDelegate>

@property(nonatomic,strong)UIImageView *eidtImageView;//正在编辑的imageView
@property(nonatomic,assign)BOOL isEidtImage;//是否在编辑图片
@property (nonatomic,strong) UICollectionView *perSonGiftCollectioView;


@end
@implementation jzlView

-(UICollectionView *)perSonGiftCollectioView
{
    if (!_perSonGiftCollectioView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];

        layout.footerReferenceSize = CGSizeMake(screen_width, 50);
        _perSonGiftCollectioView = [UICollectionView alloc];
        _perSonGiftCollectioView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 200) collectionViewLayout:layout];
        _perSonGiftCollectioView.dataSource = self;
        _perSonGiftCollectioView.delegate = self;
//        layout.minimumLineSpacing = 5;
        _perSonGiftCollectioView.backgroundColor = [UIColor whiteColor];

        [_perSonGiftCollectioView registerClass:[PubicPicCollectionViewCell class] forCellWithReuseIdentifier:@"PubicPicCollectionViewCell"];
        [_perSonGiftCollectioView registerClass:[addViewCell class] forCellWithReuseIdentifier:@"addViewCell"];
        [_perSonGiftCollectioView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HeaderView"];  //  一定要设置

        
    }
    return _perSonGiftCollectioView;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.perSonGiftCollectioView];
        _imageA = [NSMutableArray array];
        _imageAIsBes = [NSMutableArray array];
//        [self addSubview:self.locationBtn];
        
    }
    return self;
}


-(void)beginLayout{
    

}

-(void)addPic{
    
    if (self.isSelect3rdPicker ) {
        
        if ((self.maxCount - self.imageA.count)>0) {
            TZImagePickerController *pickerController = [[TZImagePickerController alloc]initWithMaxImagesCount:self.maxCount - self.imageA.count delegate:self];
            //        pickerController.sortAscendingByModificationDate = NO;
            
            __weak typeof(self) weakSelf = self;
            [pickerController setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photo, NSArray *assets, BOOL isSelectOriginalPhoto){
                
                if (photo.count) {
                    
                    [weakSelf addNewImages:photo];
                    
                    
                }
            }];
            [self.currentVc presentViewController:pickerController animated:YES completion:nil];
        } else
        {
//            [DisplayUtils alert:@"已超过最大的照片数量"];
        }
 
        
    }else{
        [self showAlert];
    }
    
}



//替换图片
-(void)changeImageForIndex:(NSUInteger)index image:(UIImage *)changeImage{
    
    [self.imageA replaceObjectAtIndex:index withObject:changeImage];
}
-(void)addNewImage:(UIImage *)newImage{
    
    [self.imageA insertObject:newImage atIndex:0];
    UIImageView *imageView = [self createImageView];
    imageView.image = newImage;

    [self insertSubview:imageView atIndex:0];
    
    if (self.imageA.count  == self.maxCount) {
        UIImageView *addIcon = self.subviews[self.maxCount];
        
        [addIcon removeFromSuperview];
        
    }
    
}
//添加多张图片--
-(void)addNewImages:(NSArray *)newImages{
    
    //默认多张图片选择顺序是按照用户选择顺序，所以这里进行反序，因为后面把刚添加的index 置为0；
    
    NSArray* images = [[newImages reverseObjectEnumerator] allObjects];
    if (self.isImageBes == NO) {
        for (int i =0; i<newImages.count; i++) {
            
            [self.imageAIsBes addObject:@"0"];
        }
    }

    [self.imageA addObjectsFromArray:newImages];
    [self.perSonGiftCollectioView reloadData];
    int num = (self.imageA.count+1)/5;

    CGFloat height =  num *kCollectionCellHeight ;
    
}
-(void)changImage:(UITapGestureRecognizer *)tap{
    
    self.isEidtImage = YES;
    self.eidtImageView = (UIImageView *)tap.view;
    if (self.isSelect3rdPicker) {
        
        
        TZImagePickerController *pickerController = [[TZImagePickerController alloc]initWithMaxImagesCount:self.maxCount - self.imageA.count delegate:self];
        
         __weak typeof(self) weakSelf = self;
        [pickerController setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photo, NSArray *assets, BOOL isSelectOriginalPhoto){
            
            
            
            if (photo.count) {
                
                UIImage *image =  photo[0];
                weakSelf.eidtImageView.image = image;
                
                NSUInteger index = [weakSelf.subviews indexOfObject:weakSelf.eidtImageView];
                [weakSelf changeImageForIndex:index image:image];
                weakSelf.isEidtImage = NO;
                weakSelf.eidtImageView = nil;
                
                
            }
        }];
        [self.currentVc presentViewController:pickerController animated:YES completion:nil];
        
    }else{
        
        [self showAlert];
    }
}
-(void)showAlert{
    
    UIAlertController *headImageChangeActionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            
            imagePicker.navigationBar.translucent = NO;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self.currentVc.navigationController presentViewController:imagePicker animated:YES completion:nil];
        }else{
        }
        
        
    }];
    
    [headImageChangeActionSheet addAction:cameraAction];
    
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"从相册中选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = YES;
            imagePicker.navigationBar.translucent = NO;
            
            imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self.currentVc.navigationController presentViewController:imagePicker animated:YES completion:nil];
        }
        
        
    }];
    
    [headImageChangeActionSheet addAction:albumAction];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        self.isEidtImage = NO;
        self.eidtImageView = nil;
    }];
    
    
    [headImageChangeActionSheet addAction:cancelAction];
    
    [self.currentVc.navigationController presentViewController:headImageChangeActionSheet animated:YES completion:nil];
    
}




#pragma mark --- <UIImagePickerControllerDelegate>
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = info[@"UIImagePickerControllerOriginalImage"];
    [picker dismissViewControllerAnimated:YES completion:nil];
    if (image) {
        
        
        if (self.isEidtImage) {
            
            self.eidtImageView.image = image;
            
            NSUInteger index = [self.subviews indexOfObject:self.eidtImageView];
            [self changeImageForIndex:index image:image];
            self.isEidtImage = NO;
            self.eidtImageView = nil;
            
        }else{
            [self addNewImage:image];
        }
        
        
    }
    
    
    
}
-(UIImageView *)createImageView{
    
    //创建图片
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.userInteractionEnabled = YES;
    imageView.backgroundColor =[UIColor hexStringToColor:@"F1F1F1"];
    imageView.contentMode =UIViewContentModeScaleAspectFill;
    [imageView setFTCornerdious:4];
    return imageView;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageA.count+1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == self.imageA.count) {
        addViewCell *followLabelCollectionCell = (addViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"addViewCell" forIndexPath:indexPath];
        followLabelCollectionCell.dateDelegate = self;

        followLabelCollectionCell.imageView.image = [UIImage imageNamed:@"wish_icon_addphotos"];
        return followLabelCollectionCell;
    } else
    {
        PubicPicCollectionViewCell *followLabelCollectionCell = (PubicPicCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"PubicPicCollectionViewCell" forIndexPath:indexPath];
        followLabelCollectionCell.dateDelegate = self;

       [followLabelCollectionCell creatImage:[self.imageA objectAtIndex:indexPath.row]];
        if (_isImageBes == YES) {
            
            followLabelCollectionCell.picBes.selected = NO;
            followLabelCollectionCell.converView.hidden = YES;
            followLabelCollectionCell.picBes.hidden = YES;
        } else
        {
            NSString *num = [self.imageAIsBes objectAtIndexWithCheck:indexPath.row];

            if (indexPath.row == 0) {
                followLabelCollectionCell.picBes.selected = NO;
                followLabelCollectionCell.converView.hidden = YES;
                followLabelCollectionCell.picBes.hidden = YES;
            } else
            {
                followLabelCollectionCell.picBes.hidden = NO;
                
                if ([num isEqualToString:@"1"]) {
                    followLabelCollectionCell.picBes.selected = YES;
                    followLabelCollectionCell.converView.hidden = NO;
                    
                } else
                {
                    followLabelCollectionCell.picBes.selected = NO;
                    followLabelCollectionCell.converView.hidden = YES;
                    
                }
            }
        }


      followLabelCollectionCell.imageView.tag = indexPath.row + 100;

        return followLabelCollectionCell;
    }

    return nil;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
    if (_isImageBes == YES) {
 
        
        [headerView addSubview:self.locationBtn];
        [self.locationBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
            //15, 15, LScreen.size.width-30/*180*KWIDTH*/, 30
            make.top.equalTo(headerView).offset(15);
            make.left.equalTo(headerView).offset(15);
            make.height.mas_equalTo(30);
        }];
    }
    else {
     
    }
     return headerView;
}

-(void)didpublickPictureCollCellClick:(UICollectionViewCell *)cell type:(NSString *)type
{
   NSIndexPath *index =   [self.perSonGiftCollectioView indexPathForCell:cell];
    NSLog(@"%@",index);
    if ([type isEqualToString:@"添加"]) {
        [self addPic];
    } else if ([type isEqualToString:@"删除"])
    {
        [self.imageA removeObjectAtIndex:index.row];
        if (self.isImageBes == NO) {
           [self.imageAIsBes removeObjectAtIndex:index.row];
        }
      
        UIView *mirrorView = [cell snapshotViewAfterScreenUpdates:NO];
        mirrorView.frame = cell.frame;
        [self.perSonGiftCollectioView insertSubview:mirrorView atIndex:0];
        cell.hidden = YES;
        [UIView animateWithDuration:0.25 animations:^{
            mirrorView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
        } completion:^(BOOL finished) {
            cell.hidden = NO;
            PubicPicCollectionViewCell *myCell = (PubicPicCollectionViewCell *)cell;
            myCell.imageView.image = nil;
            [mirrorView removeFromSuperview];
        }];
        [self.perSonGiftCollectioView deleteItemsAtIndexPaths:@[index]];

        if (index.section == 0&&index.row ==0) {
            [self.perSonGiftCollectioView reloadItemsAtIndexPaths:@[index]];
            if (self.isImageBes == NO) {
                [self.imageAIsBes replaceObjectAtIndex:0 withObject:@"0"];

            }

        }


    } else if ([type isEqualToString:@"加锁"])
    {
        [self.imageAIsBes replaceObjectAtIndex:index.row withObject:@"1"];

    }else if ([type isEqualToString:@"解锁"])
    {
        [self.imageAIsBes replaceObjectAtIndex:index.row withObject:@"0"];

    }else if ([type isEqualToString:@"图片"])
    {
     
    }
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    

    return UIEdgeInsetsMake(5, 5, 5,5);
    
}
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //    return CGSizeMake(149, 149);
    return CGSizeMake(pictureWidth, pictureWidth);
}



-(UIButton *)locationBtn{
    if(_locationBtn==nil){
        _locationBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _locationBtn.backgroundColor = [UIColor clearColor];//RGBColor( 240, 240, 240);
        _locationBtn.layer.cornerRadius = 15;
        [_locationBtn setImage:[UIImage imageNamed:@"new_refresh_icon_coordinates"] forState:UIControlStateNormal];
        [_locationBtn setTitle:@"定位中" forState:UIControlStateNormal];
        [_locationBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
        _locationBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _locationBtn;
}


@end

