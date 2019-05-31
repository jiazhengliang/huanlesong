//
//  LoginViewController.m
//  huanleSong
//
//  Created by mac on 2019/5/6.
//  Copyright © 2019 mac. All rights reserved.
//

#import "LoginViewController.h"
#import "HNUserModel.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import <Masonry/Masonry.h>
#import "LFactoryRootController.h"
#import "InitializationUIMethod.h"
#import "AppDelegate.h"
#define Width     (SCREEN_WIDTH - Handle(25)*8)/4

@interface LoginViewController ()

@property (nonatomic, strong) UIImageView  *bgImgView;
@property (nonatomic, strong) UIImageView  *logoImage;
@property (nonatomic, strong) UITextField  *accountText;
@property (nonatomic,strong)  UIView       *toplineView;

@property (nonatomic, strong) UITextField  *passwordText;
@property (nonatomic,strong)  UIView       *endLineView;

//@property (nonatomic, strong) UIButton     *eyeBtn;
@property (nonatomic, strong) UIButton     *codeBtn;

@property (nonatomic,strong)  UIButton     *RigestBut;  // 新用户注册

@property (nonatomic, strong) UIButton     *forgetPasswordBtn;  // 忘记密码
@property (nonatomic, strong) UIButton     *loginBtn;

@property (nonatomic, strong) UIButton     *registerAgreeBtn;  // 注册协议

@property (nonatomic,strong)NSMutableArray *imageArray;
@property (nonatomic,strong)NSMutableArray *titleArray;
@property (nonatomic,strong)UIView         *bottomView;
@property (nonatomic,strong)HNUserModel    *userModel;

@property (nonatomic, assign) int time;  //60s倒计时
@property (nonatomic, strong) NSTimer *timer;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self setUI];
    [self setMasonry];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.navigationController setNavigationBarHidden:NO animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)loginApp:(NSDictionary *)dict with:(NSString*)logintype{
    
    
}





#pragma mark - loadData

- (void)loginApp
{
    if(self.accountText.text.length == 0)
    {
        [SVProgressHUD showInfoWithStatus:@"手机号不能为空"];
        return;
    }
    else if (self.passwordText.text.length == 0)
    {
        [SVProgressHUD showInfoWithStatus:@"验证码不能为空"];

        return;
    }
    
    if ([self.accountText.text isEqualToString:@"13788889999"]&&[self.passwordText.text isEqualToString:@"8888"]) {
        [SVProgressHUD show];
        [self performSelector:@selector(loginbtnView) withObject:nil afterDelay:1.0];
    }
    


    NSDictionary  *dict = @{
                            @"phone" : self.accountText.text,
                            @"code"  : self.passwordText.text,
                            };
    
    

}

-(void)loginbtnView{
    [SVProgressHUD dismiss];
    UITabBarController *TabBarController  = [LFactoryRootController createTabBarController];
    AppDelegate  *delegate =(AppDelegate*)[UIApplication sharedApplication].delegate;
    
    delegate.window.rootViewController = TabBarController;
    
}
- (void)LoginIM:(HNUserModel*)model
{
    
}



#pragma mark - privateMethod

- (void)newPersionRegistBtnClick
{
//    HNRegisterVC *vc = [[HNRegisterVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)loginBtnClick
{
    [self.view endEditing:YES];
    
    if (self.accountText.text.length == 0)
    {
        [SVProgressHUD showInfoWithStatus:@"请输入手机号"];
        return;
    }

    if (self.passwordText.text.length == 0)
    {
        [SVProgressHUD showInfoWithStatus:@"请输入密码"];
        return;
    }
    
    if (self.passwordText.text.length < 4)
    {
        [SVProgressHUD showInfoWithStatus:@"密码不能小于4位"];

        return;
    }
    
    [self loginApp];
}

- (void)forgetPasswordBtnClick
{
//    HNForgetPwdVC *vc = [[HNForgetPwdVC alloc] init];
//    [self.navigationController pushViewController:vc animated:YES];
}

- (void)registerAgreeBtnClick
{

}

- (void)eyeBtnClick:(UIButton *)btn
{
    btn.selected = !btn.selected;
    
    if (btn.selected == YES)
    {
        self.passwordText.secureTextEntry = NO;
    }
    else
    {
        self.passwordText.secureTextEntry = YES;
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{

}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField == self.accountText)
    {
        if (textField.text.length > 11)
        {
            textField.text = [textField.text substringToIndex:11];
        }
    }
    else
    {
        if (textField.text.length > 16)
        {
            textField.text = [textField.text substringToIndex:16];
        }
    }

}

#pragma mark - setUI

- (void)setUI
{
    [self.view addSubview:self.bgImgView];
    [self.view addSubview:self.logoImage];
    [self.view addSubview:self.accountText];
//    self.accountText.text = @"13788889999";
//    self.passwordText.text = @"8888";

    [self.view addSubview:self.codeBtn];
    [self.view addSubview:self.passwordText];
    _toplineView =[[UIView alloc]init];
    _toplineView.backgroundColor = UIColor.grayColor;
    [self.view addSubview:_toplineView];
    _endLineView =[[UIView alloc]init];
    _endLineView.backgroundColor = UIColor.grayColor;
    [self.view addSubview:_endLineView];
    //    [self.view addSubview:self.RigestBut];
    //    [self.view addSubview:self.forgetPasswordBtn];
    [self.view addSubview:self.loginBtn];
    [self.view addSubview:self.bottomView];
    //    [self.view addSubview:self.registerAgreeBtn];
}

- (void)setMasonry
{
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.mas_equalTo(self.view);
    }];
    
    [self.logoImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kSTATUSBAR_NAVIGATION_HEIGHT +Handle(40));
        make.centerX.mas_equalTo(self.view.mas_centerX);
        //        make.size.mas_equalTo(CGSizeMake(Handle_width(152 / 2), Handle_height(152 / 2)));
    }];
    
    [self.accountText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.logoImage.mas_bottom).mas_offset(Handle(55));
        make.width.mas_equalTo(Handle(265));
        make.centerX.mas_equalTo(self.view);
        make.height.mas_offset(Handle_height(50));
    }];
    
    [_toplineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.accountText.mas_bottom).mas_offset(Handle(5));
        make.centerX.width.mas_equalTo(self.accountText);
        make.height.mas_equalTo(Handle(0.5));
    }];
    
    [self.codeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_toplineView.mas_right);
        make.centerY.mas_equalTo(self.accountText);
        make.height.mas_equalTo(Handle_height(30));
        make.width.mas_equalTo(Handle_width(100));
    }];
    
    [self.passwordText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(_toplineView.mas_bottom).mas_offset(Handle(15));
        make.centerX.width.height.mas_equalTo(self.accountText);
    }];
    [_endLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.passwordText.mas_bottom).mas_offset(Handle(5));
        make.centerX.width.mas_equalTo(self.passwordText);
        make.height.mas_equalTo(Handle(0.5));
    }];
    
    
    //    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.leading.mas_equalTo(_endLineView);
    //        make.top.mas_equalTo(_endLineView.mas_bottom).mas_offset(Handle(10));
    //        make.height.mas_equalTo(Handle(17));
    //    }];
    //
    //    [self.RigestBut mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerY.mas_equalTo(self.forgetPasswordBtn);
    //        make.trailing.mas_equalTo(_endLineView);
    //
    //    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(_endLineView.mas_bottom).mas_offset(Handle(30));
        make.width.mas_offset(Handle_width(260/2));
        make.height.mas_offset(Handle_height(44));
    }];
    
    
    UILabel  *lineTitle = InsertLabel(self.view, CGRectZero, NSTextAlignmentCenter, @"其他登录方式", SystemFontSize(15),  UIColor.whiteColor) ;
    [self.view addSubview:lineTitle];
    
    [lineTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self.loginBtn).mas_offset(Handle(60));
        make.centerX.mas_equalTo(self.view);
        
    }];
    UIImageView  *leftLine =[[UIImageView alloc]init];
    leftLine.image = GetImage(@"other_gradient_left");
    [self.view addSubview:leftLine];
    
    [leftLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(lineTitle);
        make.trailing.mas_equalTo(lineTitle.mas_leading).mas_offset(-Handle(10));
        make.width.mas_equalTo(Handle(65));
        make.height.mas_equalTo(Handle(2));
    }];
    
    
    UIImageView  *rightLine =[[UIImageView alloc]init];
    rightLine.image = GetImage(@"other_gradient_right");
    [self.view addSubview:rightLine];
    
    [rightLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(lineTitle);
        make.leading.mas_equalTo(lineTitle.mas_trailing).mas_offset(Handle(10));
        make.width.mas_equalTo(Handle(65));
        make.height.mas_equalTo(Handle(2));
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.mas_equalTo(self.view);
        make.top.mas_equalTo(lineTitle.mas_bottom).mas_offset(Handle(35));
        make.height.mas_equalTo(Width);
    }];
    
    
    //    [self.registerAgreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.centerX.mas_equalTo(self.view.mas_centerX);
    //        make.bottom.mas_equalTo(self.view.mas_bottom).mas_offset(-Handle(20));
    //    }];
}

#pragma mark ---- 获取验证吗
- (void)codeBtnClick
{
    if (self.accountText.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"手机号不能为空"];
        return;
    }
    
    if (_time > 0 && _time <= 60)
    {
        
    }

    
    NSDictionary *dic = @{
                          @"phone" : self.accountText.text,
                          };
    

}

#pragma mark - 倒计时处理
- (void)setButtonTitleCountDown
{
    _time = 60;
    NSString *timeStr = @"60S";
    [self.codeBtn setTitleColor:MainColor forState:UIControlStateNormal];
    [self.codeBtn setTitle:timeStr forState:UIControlStateNormal];
    self.codeBtn.userInteractionEnabled = NO;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getCountDownText) userInfo:nil repeats:YES];
}

// NSTimer Action
- (void)getCountDownText
{
    _time--;
    NSString *timeStr = [NSString stringWithFormat:@"%ds",_time];
    [self.codeBtn setTitle:timeStr forState:UIControlStateNormal];
    if (_time <= 0) {
        //取消定时器
        [_timer invalidate];
        _timer = nil;
        self.codeBtn.userInteractionEnabled = YES;
        [self.codeBtn setTitle:@"重新获取" forState:UIControlStateNormal];
        [self.codeBtn setTitleColor:UIColorFromRGBA(190, 190, 190, 1.0) forState:UIControlStateNormal];
    }
}

#pragma mark - getter
- (UIImageView *)bgImgView
{
    if (!_bgImgView) {
        _bgImgView = InsertImageView(nil, CGRectZero, GetImage(@""));
    }
    return _bgImgView;
}

- (UIImageView *)logoImage
{
    if(!_logoImage)
    {
        _logoImage = InsertImageView(nil, CGRectZero, GetImage(@"logo"));
        //        _logoImage.layer.masksToBounds = YES;
        //        _logoImage.layer.cornerRadius = Handle(152/4);
    }
    return _logoImage;
}

- (UITextField *)accountText
{
    if (!_accountText)
    {
        _accountText = InsertTextFieldWithTextColor(nil,self, CGRectZero, @"请输入手机号", SystemFontSize(16), NSTextAlignmentLeft, UIControlContentVerticalAlignmentCenter, UIColor.grayColor);
        //        _accountText.backgroundColor = CString(WhiteColor);
        [_accountText setValue:UIColorFromRGBA(190, 190, 190, 1.0) forKeyPath:@"_placeholderLabel.textColor"];
        _accountText.keyboardType = UIKeyboardTypeNumberPad;
        _accountText.clearButtonMode = UITextFieldViewModeWhileEditing;
        
        [_accountText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    }
    return _accountText;
}

- (UITextField *)passwordText
{
    if (!_passwordText)
    {
        _passwordText = InsertTextFieldWithTextColor(nil,self, CGRectZero, @"请输入验证码", SystemFontSize(16), NSTextAlignmentLeft, UIControlContentVerticalAlignmentCenter, UIColor.grayColor);
        [_passwordText setValue:UIColorFromRGBA(190, 190, 190, 1.0) forKeyPath:@"_placeholderLabel.textColor"];
        //        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, Handle_width(30), Handle_height(30))];
        //        [view addSubview:self.eyeBtn];
        //        _passwordText.rightView = view;
        //        _passwordText.rightViewMode = UITextFieldViewModeAlways;
        //        _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
        //        [_passwordText addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                _passwordText.secureTextEntry = YES;
    }
    return _passwordText;
}


//   注册按钮
- (UIButton*)RigestBut
{
    if(!_RigestBut)
    {
        _RigestBut = InsertTitleAndImageButton(nil, CGRectZero, 99, @"新用户注册", UIEdgeInsetsZero, SystemFontSize(14), WhiteBackMainColor, nil, nil, nil, self, @selector(newPersionRegistBtnClick));
    }
    return _RigestBut;
    
    
    
}
- (UIButton *)forgetPasswordBtn
{
    if(!_forgetPasswordBtn)
    {
        _forgetPasswordBtn = InsertTitleAndImageButton(nil, CGRectZero, 99, @"忘记密码?", UIEdgeInsetsZero, SystemFontSize(14), WhiteBackMainColor , nil, nil, nil, self, @selector(forgetPasswordBtnClick));
    }
    return _forgetPasswordBtn;
}

- (UIButton *)loginBtn
{
    if(!_loginBtn)
    {
        _loginBtn = InsertTitleAndImageButton(nil, CGRectZero, 111, @"登录", UIEdgeInsetsZero, SystemFontSize(14), UIColor.lightGrayColor,nil, nil, nil, self, @selector(loginBtnClick));
        _loginBtn.selected = YES;
        [_loginBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _loginBtn.backgroundColor = YiMoMainColor;
        _loginBtn.layer.cornerRadius = Handle(88 / 4);
        //        _loginBtn.enabled = NO;
        _loginBtn.layer.shadowOpacity = 0.56;// 阴影透明度
        _loginBtn.layer.shadowColor =YiMoMainColor.CGColor; // 阴影的颜色
        _loginBtn.layer.shadowRadius = 4;// 阴影扩散的范围控制
        _loginBtn.layer.shadowOffset = CGSizeMake(0, 4);// 阴影的范围
    }
    return _loginBtn;
}



- (UIButton *)registerAgreeBtn
{
    if(!_registerAgreeBtn)
    {
        NSString *allString = [NSString stringWithFormat:@"登录代表您已同意%@服务及隐私条款",kAppName];
        NSString *agreeString = [NSString stringWithFormat:@"%@服务及隐私条款",kAppName];
        _registerAgreeBtn = InsertTitleAndImageButton(nil, CGRectZero, 666, allString, UIEdgeInsetsZero, SystemFontSize(12), UIColorFromHEXA(0x999999, 1.0), nil, nil, nil, self, @selector(registerAgreeBtnClick));
        
        NSAttributedString *string = [InitializationUIMethod getAttributedString:allString withStringAttributedDic:@{NSForegroundColorAttributeName : UIColorFromHEXA(0x999999, 1.0)} withSubString:agreeString withSubStringAttributeDic:@{NSForegroundColorAttributeName : UIColorFromHEXA(0x920CDC, 1.0),NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
        [_registerAgreeBtn setAttributedTitle:string forState:UIControlStateNormal];
    }
    return _registerAgreeBtn;
}



//- (UIButton *)eyeBtn
//{
//    if (!_eyeBtn) {
//        _eyeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _eyeBtn.frame = CGRectMake(0, 0, Handle(30), Handle(30));
//        [_eyeBtn setImage:[UIImage imageNamed:@"eye_close"] forState:UIControlStateNormal];
//        [_eyeBtn setImage:[UIImage imageNamed:@"on"] forState:UIControlStateSelected];
//        //        [_eyeBtn setBackgroundColor:[UIColor redColor]];
//        [_eyeBtn addTarget:self action:@selector(eyeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//        _eyeBtn.selected = NO;
//        [_eyeBtn setEnlargeEdgeWithTop:10 right:5 bottom:10 left:10];
//    }
//    return _eyeBtn;
//}
#pragma mark ---------------------- 属性加载
- (UIView*)bottomView
{
    if (!_bottomView) {
        _bottomView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Width)];
        NSInteger    number = self.imageArray.count;
        CGFloat      lastSpace =Handle(40);
        CGFloat      space = (SCREEN_WIDTH - lastSpace- Width*4)/(4-1);
        if (number!=4) {
            lastSpace =  (Width+space)*(4-number)+lastSpace;
        }
        for (int i = 0; i< self.imageArray.count; i++) {
            UIButton  *button =[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(lastSpace/2+(space+Width)*i, 0, Width, Width);
            [button setBackgroundImage:GetImage([self.imageArray objectAtIndex:i]) forState:UIControlStateNormal];
            button.tag =i;
            [button addTarget:self action:@selector(loginType:) forControlEvents:UIControlEventTouchUpInside];
            [_bottomView addSubview:button];
            //            UILabel    *title =[UILabel verLab:12 textRgbColor:[UIColor whiteColor] textAlighment:NSTextAlignmentCenter];
            //            title.frame = CGRectMake(0, CGRectGetMaxY(button.frame)+ScaleHeight(10), lableW, 15);
            //            title.centerX = button.centerX;
            //            title.text = [self.titleArray objectAtIndex:i];
            //            [_bottomView addSubview:title];
            
        }
    }
    return _bottomView;
}

- (UIButton *)codeBtn
{
    if (!_codeBtn) {
        _codeBtn = InsertImageButton(nil, CGRectZero, 888, nil, nil, self, @selector(codeBtnClick));
        _codeBtn.backgroundColor = [UIColor whiteColor];
        [_codeBtn setTitleColor:UIColorFromRGBA(190, 190, 190, 1.0) forState:UIControlStateNormal];
        [_codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        _codeBtn.titleLabel.font = SystemFontSize(14);
        _codeBtn.layer.cornerRadius = Handle_height(30)/2;
        _codeBtn.layer.masksToBounds = YES;
        [_codeBtn setContentEdgeInsets:UIEdgeInsetsMake(2, 5, 2, 5)];
    }
    return _codeBtn;
}

@end

