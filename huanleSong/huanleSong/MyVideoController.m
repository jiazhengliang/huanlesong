//
//  MyVideoController.m
//  huanleSong
//
//  Created by joneMac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "MyVideoController.h"

@interface MyVideoController ()

@end

@implementation MyVideoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.titleString;
    self.barView.backgroundColor= UIColor.whiteColor;
    self.barView.setTitleColor;

    
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    // Do any additional setup after loading the view.
    
    [self.barView setLeftButton:self.leftBtn];
    self.view.backgroundColor = RGBColor(233, 233, 233);
    
    UIImageView *imageView = [[UIImageView alloc] init]
    ;
    imageView.image = [UIImage imageNamed:@"LNoDataIcon"];

    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    // Do any additional setup after loading the view.
}

-(void)leftBtnClick{
    
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
