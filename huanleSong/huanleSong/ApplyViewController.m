//
//  ApplyViewController.m
//  huanleSong
//
//  Created by jones on 2019/5/31.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ApplyViewController.h"

@interface ApplyViewController ()


@property (strong, nonatomic) UITableView *tableView;
@property(strong,nonatomic)NSArray *infoArray;
@property(strong,nonatomic)NSArray *infoSubArray;

@end

@implementation ApplyViewController
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64)];
        _tableView.backgroundColor = buyDetailBackColor;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _tableView.scrollEnabled = NO;
        
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.barView setTitle:@"发布旅游"];
    self.barView.backgroundColor= UIColor.whiteColor;
    self.barView.setTitleColor;
    
    self.view.backgroundColor = BackGroundColor;
    self.infoArray = @[@"主题",@"地点",@"时间",@"预计花费",@"人数",@"备注"];

    UIImageView *iamge = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 151)];
    iamge.image = [UIImage imageNamed:@"l_yh_img_home"];
    self.tableView.tableHeaderView = iamge;
    
    
    [self.view addSubview:self.tableView];
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    
    [self.barView setLeftButton:self.leftBtn];
    
    UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,screen_width, 80)];
    
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(20, 30,screen_width-40, 50)];
    [buttonBack addTarget:self action:@selector(submitClick) forControlEvents:UIControlEventTouchUpInside];

    buttonBack.backgroundColor = RGBColor(255, 53, 116);
    [footView addSubview:buttonBack];
    [buttonBack setTitle:@"发布" forState:UIControlStateNormal];
    buttonBack.titleLabel.textColor  = UIColor.whiteColor;
    buttonBack.layer.cornerRadius = 5;
    
    self.tableView.tableFooterView = footView;
    // Do any additional setup after loading the view.
}

-(void)submitClick
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];

    NSString *name =  [defaults objectForKey:@"apply_1"];
    NSString *heigh =  [defaults objectForKey:@"apply_2"];
    NSString *weight =  [defaults objectForKey:@"apply_3"];
    NSString *langugue =  [defaults objectForKey:@"apply_4"];
    NSString *likes =  [defaults objectForKey:@"apply_5"];
    NSString *address =  [defaults objectForKey:@"apply_6"];
    
    if (name.length == 0||heigh.length == 0||weight.length == 0 ||langugue.length ==0||likes.length == 0||address.length == 0) {
        
        [DisplayUtils alert:@"请输入完相关信息"];
       
    } else
    {
        [SVProgressHUD show];
         [self performSelector:@selector(delaySubmit) withObject:nil afterDelay:1.0];
    }
}
-(void)delaySubmit{
    
    [SVProgressHUD dismiss];
    [DisplayUtils alert:@"申请成功，等待系统审核"];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *name =  [defaults objectForKey:@"apply_1"];
    NSString *heigh =  [defaults objectForKey:@"apply_2"];
    NSString *weight =  [defaults objectForKey:@"apply_3"];
    NSString *langugue =  [defaults objectForKey:@"apply_4"];
    NSString *likes =  [defaults objectForKey:@"apply_5"];
    NSString *address =  [defaults objectForKey:@"apply_6"];
    
    self.infoSubArray = @[name?name:@"",
                          heigh?heigh:@"",
                          weight?weight:@"",
                          langugue?langugue:@"",
                          likes?likes:@"",
                          address?address:@""];
    
    [self.tableView reloadData];
}

-(void)leftBtnClick{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark-------------UITableViewDelegate

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *IDENTITY2=@"MineViewCell";
    
    MineViewCell *headerCell=[tableView dequeueReusableCellWithIdentifier:IDENTITY2];
    if (headerCell==nil) {
        [tableView registerClass:[MineViewCell class] forCellReuseIdentifier:IDENTITY2];
        headerCell=[tableView dequeueReusableCellWithIdentifier:IDENTITY2 forIndexPath:indexPath];
    }
    NSString *image;
    NSString *titleString;
    titleString = [self.infoArray objectAtIndexWithCheck:indexPath.section];
    image = [self.infoSubArray objectAtIndexWithCheck:indexPath.section];
    headerCell.titleLabel.text =titleString;
    headerCell.subTitleLabel.text = image;
    headerCell.subTitleLabel.hidden = NO;
    return headerCell;
}

#pragma mark 返回多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.infoArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1
    ;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 45*KWIDTH;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    //    if (section==0) {
    //        MineHeaderView *headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 205*KWIDTH)];
    //        return headerView;
    //
    //    } else
    //    {
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 15*KWIDTH)];
    lineView.backgroundColor = BackGroundColor;
    return lineView;
    //    }
    return nil;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
   
    return 15*KWIDTH;

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *string = [NSString stringWithFormat:@"apply_%d",indexPath.section + 1];
    
    NSString *textString = [self.infoArray objectAtIndex:indexPath.section];
    ModelViewController *model = [[ModelViewController alloc] init];
    model.titleString = string;
    model.textstring = [NSString stringWithFormat:@"请输入%@",textString];
    model.type = @"发布";
    [self.navigationController pushViewController:model animated:YES];
}


@end
