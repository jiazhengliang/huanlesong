//
//  XYTextTableViewCell.h
//  huanLeSong
//
//  Created by Alex China on 2018/10/9.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYTextTableViewCell : UITableViewCell<UITextViewDelegate>

@property(nonatomic,strong) UITextView *textView;
@property(nonatomic,strong) UILabel *label;

@property(nonatomic,assign) NSInteger wordsMaxCount;

@end
@interface LFBVCContactCell : UITableViewCell
@property(nonatomic,strong)UITextField *textField;
@end
