//
//  PersonViewController.m
//  huanleSong
//
//  Created by joneMac on 2019/5/13.
//  Copyright © 2019 mac. All rights reserved.
//

#import "PersonViewController.h"
#import "MineViewCell.h"
@interface PersonViewController ()
@property (strong, nonatomic) UITableView *tableView;
@property(strong,nonatomic)NSArray *infoArray;
@property(strong,nonatomic)NSArray *infoSubArray;

@end

@implementation PersonViewController
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
    [self.barView setTitle:@"个人资料"];
    self.barView.backgroundColor= UIColor.whiteColor;
    self.barView.setTitleColor;
    
    
    self.view.backgroundColor = BackGroundColor;
    self.infoArray = @[@"昵称",@"身高",@"体重",@"语言",@"特长",@"爱好地"];
    
    self.infoSubArray = @[@"小姐姐",@"168cm",@"50kg",@"英语",@"爬山",@"深圳"];

    [self.view addSubview:self.tableView];
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    
    [self.barView setLeftButton:self.leftBtn];
    
    // Do any additional setup after loading the view.
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
    //    if (section==0) {
    //        return 205*KWIDTH;
    //    } else
    //    {
    return 15*KWIDTH;
    //    }
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
