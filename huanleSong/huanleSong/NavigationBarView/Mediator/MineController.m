//
//  mineController.m
//  huanLeSong
//
//  Created by Wendy China on 2018/4/18.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "MineController.h"
#import "MineViewCell.h"
#import "PersonViewController.h"
#import "feedbackController.h"
#import "MyVideoController.h"
//#import "VIPSetterController.h"
//#import "promoteSelfController.h"
//#import "WishDateListController.h"
//
/////DELETE
//#import "LIMManager.h"
///DELETE

@interface MineController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@property(strong,nonatomic)NSArray *infoArray;

@property(strong,nonatomic)NSArray *infoImageArray;

//@property(nonatomic,strong)MineHeaderView *mineHeaderView;

@end

@implementation MineController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    
    return self;
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_width, screen_height)];
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

    self.view.backgroundColor = BackGroundColor;
//    MineHeaderView *headerView = [[MineHeaderView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 285*KWIDTH)];
//    if ([LSingleton shareClient].loginUser.IsAuth == 1) {
//        headerView.personBtn.selected = YES;
//    } else
//    {
//        headerView.personBtn.selected = NO;
//    }
//
//
//    headerView.delegate = self;
//    self.mineHeaderView = headerView;
//    [self.view addSubview:headerView];
    
    UIView *backGroud = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 215*KWIDTH)];
    UIImage *image = [UIImage imageNamed:@"personal_nav_bg"];
    
    backGroud.layer.contents = (id)image.CGImage;
    [self updateUserData:nil];
    
    self.tableView.tableHeaderView = backGroud;
    self.infoArray = @[@"个人资料",@"我的旅游",@"我的视频",@"视频排行榜",@"推广自己",@"设置"];
    
    self.infoImageArray = @[@"personal_icon_data",@"personal_icon_mywish",@"personal_icon_gift",@"personal_icon_honor",@"personal_icon_spread",@"personal_icon_setup"];

    [self.view addSubview:self.tableView];
    self.barView.hidden = YES;
    
}

-(void)updateUserData:(NSNotification *)notification {
    NSString *pic_path =  @"";
    NSString *downloadUrl = [CommonTools URLConverToURL:pic_path];

 
   
}


-(void)initNavigtionBar
{

    
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

    if (indexPath.section == 0) {
        image = [self.infoImageArray objectAtIndexWithCheck:indexPath.row];
        titleString = [self.infoArray objectAtIndexWithCheck:indexPath.row];
        
    } else if (indexPath.section == 1)
    {
        image = [self.infoImageArray objectAtIndexWithCheck:indexPath.row+3];
        titleString = [self.infoArray objectAtIndexWithCheck:indexPath.row+3];
    }
    headerCell.imagView.image = [UIImage imageNamed:image];

    headerCell.titleLabel.text =titleString;
    return headerCell;
}

#pragma mark 返回多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 3;
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
//    if (section==0) {
//        return 205*KWIDTH;
//    } else
//    {
        return 15*KWIDTH;
//    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.navigationController pushViewController:[PersonViewController new] animated:YES];
    } else if (indexPath.row == 1) {
            [self.navigationController pushViewController:[feedbackController new] animated:YES];
       
    } else
        {
            MyVideoController *videoVc = [MyVideoController new];
            videoVc.titleString = @"我的视频";

            [self.navigationController pushViewController:videoVc animated:YES];

        }
}

@end
