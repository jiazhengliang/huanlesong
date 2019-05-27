//
//  XYPhotosTableViewCell.m
//  huanLeSong
//
//  Created by Alex China on 2018/10/9.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "XYPhotosTableViewCell.h"
#import "TZImagePickerController.h"
#import <Masonry/Masonry.h>
#import "UIView+XYConvenience.h"
//#import "XYBrowsePhotosVController.h"

@interface XYPhotosTableViewCell() <TZImagePickerControllerDelegate>
@property(nonatomic,strong)UIView *lContentView;
@property(nonatomic,strong,readwrite)UIView *lHeaderView;
@property(nonatomic,strong)UILabel *labelText;
@property(nonatomic,strong)UILabel *labelText2;
@property(nonatomic,assign)CGFloat cellHeight;
@end

@implementation XYPhotosTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.lHeaderView = [[UIView alloc] init];
        [self addSubview:self.lHeaderView];
        [self.lHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(self);
            make.height.mas_equalTo(34);
        }];
        
        self.labelText = [[UILabel alloc] init];
        self.labelText.font =[UIFont systemFontOfSize:12];
        self.labelText.textColor = [UIColor colorWithRGBHex:0x666666];
        self.labelText.textAlignment = NSTextAlignmentLeft;
        self.labelText.text = @"请提供问题的相关截图或照片(选填)";
        [self.lHeaderView addSubview:self.labelText];
        [self.labelText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lHeaderView).offset(LViewLeftSpacingInScreen);
            make.top.right.bottom.equalTo(self.lHeaderView);
        }];
        
        self.labelText2 = [[UILabel alloc] init];
        self.labelText2.font = [UIFont systemFontOfSize:14];
        self.labelText2.textColor = [UIColor colorWithRGB:0x666666];
        self.labelText2.textAlignment = NSTextAlignmentRight;
        [self.lHeaderView addSubview:self.labelText2];
        [self.labelText2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.lHeaderView).offset(-LViewLeftSpacingInScreen);
            make.top.right.bottom.equalTo(self.lHeaderView);
        }];
        
        self.lContentView = [[UIView alloc] init];
        [self addSubview:self.lContentView];
        [self.lContentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lHeaderView.mas_bottom);
            make.bottom.left.right.equalTo(self);
        }];
        
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.rowCount = 4;
        self.photosMaxCount = 4;
        self.photos = [[NSMutableArray alloc] init];
        
        [self resetPhotos];
    }
    return self;
}

- (void)setRowCount:(NSInteger)rowCount {
    if (_rowCount != rowCount) {
        _rowCount = rowCount;
        [self resetPhotos];
    }
}

- (void)addPhoto {
    if (self.photosMaxCount-self.photos.count == 0) {
        return;
    }
    TZImagePickerController *ImagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:self.photosMaxCount-self.photos.count delegate:self];
    ImagePicker.allowTakePicture = YES;
    ImagePicker.allowPickingGif  = NO;
    ImagePicker.allowPickingVideo= NO;
    ImagePicker.allowPickingImage= YES;
    ImagePicker.allowPickingOriginalPhoto = YES;
    ImagePicker.alwaysEnableDoneBtn = YES;
    ImagePicker.timeout = 30;
    @LWeakify(self);
    [ImagePicker setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        @LStrongify(self);
        [self.photos addObjectsFromArray:photos];
        [self resetPhotos];
        [self reloadData];
    }];
    [[self accordingViewfindViewController] presentViewController:ImagePicker animated:YES completion:nil];
}
- (void)lookPhoto:(XYDelButton *)button {
//    XYBrowsePhotosCommonVController *browse = [[XYBrowsePhotosCommonVController alloc] init];
//    browse.localImages = self.photos;
//    browse.showPattern= XYShowPatternModal;
//    browse.curr_index = button.tag;
//    [browse showInController:[self accordingViewfindViewController]];
}
- (void)delPhoto:(XYDelButton *)button {
    if (self.photos.count > button.tag) {
        [self.photos removeObjectAtIndex:button.tag];
        [self resetPhotos];
        [self reloadData];
    }
}
- (void)reloadData {
    UIViewController *vc = [self accordingViewfindViewController];
    if ([vc respondsToSelector:@selector(tableView)]) {
        UITableViewController *t_vc = (UITableViewController *)vc;
        if ([t_vc.tableView isKindOfClass:[UITableView class]]) {
            [t_vc.tableView reloadData];
        }
    }
}
- (void)resetPhotos {
    for (UIView *view in [self.lContentView subviews]) {
        [view removeFromSuperview];
    }
    
    CGFloat spacing = 10;
    CGFloat size = (LScreen.size.width-LViewLeftSpacingInScreen*2-spacing*(self.rowCount-1))/self.rowCount;
    
    NSMutableArray *buts = [[NSMutableArray alloc] init];
    for (UIImage *image in self.photos) {
        XYDelButton *button = [[XYDelButton alloc] initWithFrame:CGRectMake(0, 0, size, size)];
        [button.imgButton setImage:image forState:UIControlStateNormal];
        [button.imgButton addTarget:self action:@selector(lookPhoto:) forControlEvents:LUIControlEventTouchWay];
        [button.delButton addTarget:self action:@selector(delPhoto:) forControlEvents:LUIControlEventTouchWay];
        [buts addObject:button];
    }
    
    if (self.photos.count < self.photosMaxCount) {
        XYDelButton *add = [[XYDelButton alloc] initWithFrame:CGRectMake(0, 0, size, size)];
        add.delButton.hidden = YES;
        [add.imgButton setBackgroundImage:[UIImage imageNamed:@"wish_icon_addphotos"] forState:UIControlStateNormal];
        [add.imgButton addTarget:self action:@selector(addPhoto) forControlEvents:LUIControlEventTouchWay];
        [buts addObject:add];
    }
    
    XYDelButton *leftBtn = nil;
    XYDelButton *topBtn  = nil;
    for (int i=0; i<buts.count; i++) {
        XYDelButton *but = [buts objectAtIndexWithCheck:i];
        but.delButton.tag = i;
        but.imgButton.tag = i;
        but.imgButton.contentMode = UIViewContentModeScaleAspectFill;
        but.imgButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
        //[but setViewGrayBorder];
        
        [self.lContentView addSubview:but];
        [but mas_makeConstraints:^(MASConstraintMaker *make) {
            if (leftBtn) {
                make.left.equalTo(leftBtn.mas_right).offset(spacing);
            }
            else {
                make.left.equalTo(self.lContentView).offset(LViewLeftSpacingInScreen);
            }
            
            if (topBtn) {
                make.top.equalTo(topBtn.mas_bottom).offset(spacing);
            }
            else {
                make.top.equalTo(self.lContentView).offset(0);
            }
            
            make.size.mas_equalTo(CGSizeMake(size, size));
        }];
        
        leftBtn = but;
        if ((i+1)%self.rowCount == 0) {
            leftBtn = nil;
        }
        
        if ((i+1)%self.rowCount == 0 && i+1 < buts.count) {
            topBtn = [buts objectAtIndexWithCheck:i];
        }
    }
    
    CGFloat rows = buts.count/self.rowCount;
    if (buts.count%self.rowCount > 0) {
        rows ++;
    }
    
    self.cellHeight = rows*(size+spacing);
    [self.lContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lHeaderView.mas_bottom);
        make.bottom.left.right.equalTo(self);
        make.height.mas_equalTo(self.cellHeight);
    }];
    self.labelText2.text = [NSString stringWithFormat:@"%li/%li",self.photos.count,self.photosMaxCount];
}

- (void)updateConstraints {
    if (self.cellHeight > 0) {
    }
    
    [super updateConstraints];
}

@end
/*
 不经厨子手,难得五味香。
 图俏不穿棉,冻死也应该。
 衣不如新，人不如故。
 人靠衣裳马靠鞍。
 新三年，旧三年，缝缝补补又三年。
 冷不择衣，饥不择食。
 吊眼眉毛豪气长。
 穿衣戴帽，各有所好。
 */


@implementation XYDelButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *imgbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:imgbutton];
        [imgbutton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-12);
            make.top.equalTo(self).offset(12);
            make.left.bottom.equalTo(self);
        }];
        self.imgButton = imgbutton;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:@"xy_delete_pink"] forState:UIControlStateNormal];
        [self addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(0);
            make.top.equalTo(self).offset(0);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        self.delButton = button;
        
    }
    return self;
}

@end
