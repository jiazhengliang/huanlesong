//
//  CustomBaseViewController.m
//  huanleSong
//
//  Created by mac on 2019/5/11.
//  Copyright © 2019 mac. All rights reserved.
//

#import "CustomBaseViewController.h"

@interface CustomBaseViewController ()

@end

@implementation CustomBaseViewController

- (void)dealloc {
    NSLog(@"%@",[NSString stringWithFormat:@"C %@, It was released.",NSStringFromClass(self.class)]);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSInteger childViewControllersCount = self.navigationController.childViewControllers.count;
    if (childViewControllersCount == 1) {
        self.tabBarController.tabBar.hidden = NO;
    }else{
        self.tabBarController.tabBar.hidden = YES;
    }
    
}



-(void)loadView
{
    [super loadView];
    _barView = [[CustomNavigationBarView alloc] initWithFrame:CGRectMake(0, 0, NavigationBarWidth, NavigationBarHeight)];
    [self.view addSubview:_barView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setTitle:(NSString *)title
{
    [_barView setTitle:title];
    
}

-(void)setTitleWithAttributedString:(NSAttributedString *)title
{
    [_barView setTitleWithAttributedString:title];
    
}

-(void)setNavigationBarTitleView:(UIView *)view{
    [_barView setTitleView:view];
}

-(UIView *)getNavigationBarTitleView
{
    return [_barView getTitleView];
}

-(void)setNavigationBarLeftButton:(UIButton *)button
{
    button.titleLabel.font = NavigationBarTitleFont;
    
    [_barView setLeftButton:button];
    
}

-(void)setNavigationBarRightButton:(UIButton *)button
{
    button.titleLabel.font = NavigationBarTitleFont;
    [_barView setRightButton:button];
    
}

-(UIButton *)getNavigationBarRightButton
{
    return   [_barView getRightButton];
    
}

-(void)setNavigationBarLeftView:(UIView *)view
{
    [_barView setLeftView:view];
    
}

-(void)setNavigationBarRightView:(UIView *)view
{
    [_barView setRightView:view];
}

-(void)hideNavigationBar:(BOOL)hide
{
    _barView.hidden = hide;
}

-(void)hideNavigationBar:(BOOL)hide animation:(BOOL)animation
{
    if (animation) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:1];
        if (hide) {
            [_barView setAlpha:0.0f];
        } else
        {
            [_barView setAlpha:1];
            
        }
        [UIView commitAnimations];
    } else
    {
        _barView.hidden = hide;
        [_barView setAlpha:1];
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setNavigationBarBackgroundColor:(UIColor*)color
{
    _barView.backgroundColor = color;
}

- (void)bringBarViewToFront
{
    [self.view bringSubviewToFront:_barView];
}

-(void)setNavigationBarAlph:(CGFloat)alph
{
    [_barView setAlpha:alph];
}

-(void)initWithNOData
{
    if (self.dataView ==nil)
    {
        self.dataView = [[UIView alloc]initWithFrame:CGRectMake(0, Content_Y, screen_width, Content_Height-Content_Y )];
        
        [self.view addSubview:self.dataView];
        
        int height = (Content_Height-Content_Y)/ 2;
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"on_data_icon"]];
        image.frame = CGRectMake(screen_width/2 - 80*KWIDTH, height - 189*KWIDTH , 160*KWIDTH, 160*KWIDTH);
        [self.dataView addSubview:image];
        
        
        [self.dataView updateConstraints];
        
        [self.view addSubview:self.dataView];
    }
}

-(void)backClickBtn{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)removeNoDataView
{
    [self.dataView removeFromSuperview];
    
    self.dataView = nil;
    
}


-(UIButton *)leftBtn{
    if(_leftBtn == nil){
        _leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
        [_leftBtn addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _leftBtn;
}


-(UIButton *)rightBtn{
    if(_rightBtn == nil){
        _rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
        _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
        [_rightBtn addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _rightBtn;
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
