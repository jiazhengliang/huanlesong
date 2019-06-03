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
#import "HotDynamicController.h"
#import "ApplyViewController.h"
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
    
    UIView *backGroud = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_width, 215*KWIDTH)];
    UIImage *image = [UIImage imageNamed:@"personal_nav_bg"];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"logo"];
    imageView.layer.cornerRadius = 40;
    imageView.layer.masksToBounds = YES;
    
    backGroud.layer.contents = (id)image.CGImage;
    [self updateUserData:nil];
    
    self.tableView.tableHeaderView = backGroud;
    self.infoArray = @[@"个人资料",@"发布旅游申请",@"我的旅游",@"我的视频",@"问题与反馈"];
    self.infoImageArray = @[@"personal_icon_data",@"personal_icon_mywish",@"personal_icon_gift",@"personal_icon_honor",@"personal_icon_spread",@"personal_icon_setup"];
    [self.view addSubview:self.tableView];
    self.barView.hidden = YES;
    [backGroud addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(backGroud);
        make.size.mas_equalTo(CGSizeMake(80, 80));
    }];
    
    
    UILabel *nickLab = [[UILabel alloc] init];
    nickLab.text = @"贾宝亮";
    nickLab.font = [UIFont systemFontOfSize:14];
    nickLab.textColor = UIColor.whiteColor;
    [backGroud addSubview:nickLab];
    [nickLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10)
        ;
        make.centerX.equalTo(imageView);
    }];
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

    image = [self.infoImageArray objectAtIndexWithCheck:indexPath.row];
    titleString = [self.infoArray objectAtIndexWithCheck:indexPath.row];
        
 
    headerCell.imagView.image = [UIImage imageNamed:image];

    headerCell.titleLabel.text =titleString;
    return headerCell;
}

#pragma mark 返回多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.infoArray.count;
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
        ApplyViewController *videoVc = [ApplyViewController new];
        [self.navigationController pushViewController:videoVc animated:YES];
       
    } else if (indexPath.row == 2) {
        MyVideoController *videoVc = [MyVideoController new];
        videoVc.titleString = @"我的旅游";
        [self.navigationController pushViewController:videoVc animated:YES];
        
    }  else if (indexPath.row == 3) {
        
        HotDynamicController *videoVc = [HotDynamicController new];
        videoVc.isfrom = YES;
        [self.navigationController pushViewController:videoVc animated:YES];
        
    } else
        {
            feedbackController *videoVc = [feedbackController new];

            [self.navigationController pushViewController:videoVc animated:YES];

        }
}

@end
