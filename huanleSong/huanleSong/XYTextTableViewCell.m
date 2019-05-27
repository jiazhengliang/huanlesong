//
//  XYTextTableViewCell.m
//  huanLeSong
//
//  Created by Alex China on 2018/10/9.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "XYTextTableViewCell.h"
#import "UITextView+XYExpand.h"

@implementation XYTextTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.textView];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(LViewLeftSpacingInScreen);
            make.right.equalTo(self).offset(-LViewLeftSpacingInScreen);
            make.top.equalTo(self).offset(10);
            //make.bottom.equalTo(self).offset(-10);
            make.height.mas_equalTo(150);
        }];
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.textView);
            make.top.equalTo(self.textView.mas_bottom);
            make.bottom.equalTo(self).offset(-10);
        }];
        self.textView.contentInset = UIEdgeInsetsMake(0, -5, 0, 5);
        //[self.textView setViewGrayBorder];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setWordsMaxCount:(NSInteger)wordsMaxCount {
    if (_wordsMaxCount != wordsMaxCount) {
        _wordsMaxCount = wordsMaxCount;
        [self textViewDidChange:self.textView];
    }
}

- (void)textViewDidChange:(UITextView *)textView {
    self.label.text = [[NSString alloc] initWithFormat:@"%li/%li",textView.text.length,self.wordsMaxCount];
}



- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSString * aString = [textView.text stringByReplacingCharactersInRange:range withString:text];
    
    
    if (aString.length > self.wordsMaxCount) {
        return NO;
    }
//    NSUInteger textLength = 0;
//    for (NSUInteger i = 0; i < aString.length; i++) {
//        unichar uc = [aString characterAtIndex:i];
//        textLength += isascii(uc)?1:2;
//        
//        if (textLength > self.wordsMaxCount*2  && aString.length > range.length) {
//            return NO;
//        }
//    }
    
    return YES;
}

- (UITextView *)textView {
    if (!_textView) {
        UITextView *view = [[UITextView alloc] init];
        view.zw_placeHolder = @"具体清晰的描述有助于我们快速解决您的问题";
        view.zw_placeHolderColor = [UIColor colorWithRGB:0x999999];
        view.textColor = [UIColor colorWithRGB:0x999999];
        view.font = [UIFont systemFontOfSize:14];
        view.delegate = self;
        self.textView = view;
    }
    return _textView;
}

- (UILabel *)label {
    if (!_label) {
        UILabel *label = [[UILabel alloc] init];
        label.font =[UIFont systemFontOfSize:14];
        label.textColor =  [UIColor colorWithRGB:0x999999];
        label.textAlignment = NSTextAlignmentRight;
        self.label = label;
    }
    return _label;
}

@end
@interface LFBVCContactCell ()<UITextFieldDelegate>

@end
@implementation LFBVCContactCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UITextField *tf = [[UITextField alloc] init];
        tf.placeholder = @"QQ、邮箱或手机等联系方式";
        tf.textColor = [UIColor colorWithRGB:0x666666];
        tf.font = [UIFont systemFontOfSize:16];
        self.textField = tf;
        self.textField.delegate = self;
        
        [self.contentView addSubview:self.textField];
        [self.textField mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(LViewLeftSpacingInScreen);
            make.top.equalTo(self.contentView).offset(15);
            make.bottom.equalTo(self.contentView).offset(-15);
            make.right.equalTo(self.contentView).offset(-LViewLeftSpacingInScreen);
        }];
    }
    return self;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSUInteger textLength = 0;
    for (NSUInteger i = 0; i < textField.text.length; i++) {
        unichar uc = [textField.text characterAtIndex:i];
        textLength += isascii(uc)?1:2;
        
        if (textLength > 20  && string.length > range.length) {
            return NO;
        }
    }
    
    return YES;
}


@end
