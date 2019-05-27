//
//  feedbackController.m
//  huanleSong
//
//  Created by joneMac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "feedbackController.h"
#import "XYTextTableViewCell.h"
#import "XYPhotosTableViewCell.h"
@interface feedbackController()
@property (strong,nonatomic) UITableView *dateTableView;
@property(nonatomic,strong)UIView *headerQuestionView;
@property(nonatomic,strong)UIView *headerPhotosView;
@property(nonatomic,strong)UIView *headerConstactView;
@property(nonatomic,strong)XYTextTableViewCell   *questionTextCell;
@property(nonatomic,strong)XYPhotosTableViewCell *photosCell;
@property(nonatomic,strong)LFBVCContactCell *contactCell;
@property(nonatomic,strong)UIView *submitView;
@end
@implementation feedbackController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"问题与反馈";
    self.barView.backgroundColor= UIColor.whiteColor;
    self.barView.setTitleColor;
    [self.view addSubview:self.dateTableView];
    
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    
    [self.barView setLeftButton:self.leftBtn];
    self.view.backgroundColor = UIColor.grayColor;

    // Do any additional setup after loading the view.
}

-(void)leftBtnClick{
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(UITableView *)dateTableView{
    if (!_dateTableView) {
        _dateTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_width, screen_height-64)];
        _dateTableView.backgroundColor = buyDetailBackColor;
        _dateTableView.delegate = self;
        _dateTableView.dataSource = self;
        _dateTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    }
    return _dateTableView;
}



#pragma mark---UITableView Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 44;
    }
    else if (section == 1) {
        return 20;
    }
    else {
        return 44;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return self.headerQuestionView;
    }
    else if (section == 1) {
        return nil;
    }
    else {
        return self.headerConstactView;
    }
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        return self.questionTextCell;
    }
    else if (indexPath.section == 1) {
        return self.photosCell;
    }
    else {
        return self.contactCell;
    }
}

- (UIView *)headerQuestionView {
    if (!_headerQuestionView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LScreen.size.width, 44)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LViewLeftSpacingInScreen, 10, 300, 34)];
        [view addSubview:label];
        label.textColor = [UIColor colorWithRGBHex:0x666666];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"您的问题和意见";
        self.headerQuestionView = view;
    }
    return _headerQuestionView;
}
- (UIView *)headerPhotosView {
    if (!_headerPhotosView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LScreen.size.width, 44)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LViewLeftSpacingInScreen, 10, 300, 34)];
        [view addSubview:label];
        label.textColor = [UIColor colorWithRGBHex:0x666666];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"请提供相关问题的截图或照片(选填)";
        self.headerPhotosView = view;
    }
    return _headerPhotosView;
}
- (UIView *)headerConstactView {
    if (!_headerConstactView) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, LScreen.size.width, 44)];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(LViewLeftSpacingInScreen, 10, 300, 34)];
        [view addSubview:label];
        label.textColor = [UIColor colorWithRGBHex:0x666666];
        label.font = [UIFont systemFontOfSize:12];
        label.text = @"您的联系方式";
        self.headerConstactView = view;
    }
    return _headerConstactView;
}

- (XYTextTableViewCell *)questionTextCell {
    if (!_questionTextCell) {
        XYTextTableViewCell *cell = [[XYTextTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.wordsMaxCount = 200;
        cell.textView.font = [UIFont systemFontOfSize:12];
        cell.textView.textColor = [UIColor colorWithRGBHex:0x999999];
        self.questionTextCell = cell;
    }
    return _questionTextCell;
}

- (XYPhotosTableViewCell *)photosCell {
    if (!_photosCell) {
        XYPhotosTableViewCell *cell = [[XYPhotosTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.rowCount = 4;
        cell.photosMaxCount = 4;
        self.photosCell = cell;
    }
    return _photosCell;
}

- (LFBVCContactCell *)contactCell {
    if (!_contactCell) {
        LFBVCContactCell *cell = [[LFBVCContactCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        cell.textField.font =[UIFont systemFontOfSize:12];
        _contactCell = cell;
        
    }
    return _contactCell;
}

@end
