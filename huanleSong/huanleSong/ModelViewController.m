//
//  ModelViewController.m
//  huanleSong
//
//  Created by jones on 2019/5/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ModelViewController.h"

@interface ModelViewController ()
@property (nonatomic, strong) UITextField *accountText;
@end

@implementation ModelViewController
- (UITextField *)accountText
{
    if (!_accountText)
    {
        _accountText = InsertTextFieldWithTextColor(nil,self, CGRectZero, @"请输入手机号", SystemFontSize(16), NSTextAlignmentLeft, UIControlContentVerticalAlignmentCenter, UIColor.grayColor);
            _accountText.backgroundColor =UIColorFromRGBA(234, 234, 234, 1.0);
        [_accountText setValue:UIColorFromRGBA(190, 190, 190, 1.0) forKeyPath:@"_placeholderLabel.textColor"];
        _accountText.keyboardType = UIKeyboardTypeNumberPad;
        _accountText.clearButtonMode = UITextFieldViewModeWhileEditing;
        _accountText.layer.cornerRadius = 5;
        _accountText.layer.masksToBounds = YES;
    }
    return _accountText;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.accountText];
    [self.barView setTitle:@"修改个人资料"];
    self.barView.backgroundColor= UIColor.whiteColor;
    self.barView.setTitleColor;
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonBack addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
//    [buttonBack setImage:[UIImage imageNamed:@"fenxg"] forState:UIControlStateNormal];
    [buttonBack setTitle:@"提交" forState:UIControlStateNormal];
    [buttonBack setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self.barView setRightButton:buttonBack];
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    
    [self.barView setLeftButton:self.leftBtn];
    
    self.view.backgroundColor = BackGroundColor;
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(NavigationBarHeight + 50);
        make.left.mas_equalTo(10);
        make.right.mas_equalTo(-10);
        make.height.mas_equalTo(50);
        
    }];
    
    
    // Do any additional setup after loading the view.
}

-(void)rightBtnClick{
    if (self.accountText.text.length >0) {
        [SVProgressHUD show];
        
        [self performSelector:@selector(delaySubmit) withObject:nil afterDelay:1.0];
    }else
    {
        [DisplayUtils alert:@"请输入修改的内容"];
    }
}

-(void)leftBtnClick{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)delaySubmit
{
    [SVProgressHUD dismiss];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    [defaults setObject:self.accountText.text forKey:self.titleString];
    
    
    [defaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];

    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
