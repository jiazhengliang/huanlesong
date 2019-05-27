//
//  PlayerViewController.m
//  huanleSong
//
//  Created by joneMac on 2019/5/13.
//  Copyright © 2019 mac. All rights reserved.
//

#import "PlayerViewController.h"
#import "KZVideoPlayer.h"
@interface PlayerViewController ()
@property (nonatomic, strong)KZVideoPlayer *player;

@end

@implementation PlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSURL *playUrl = [NSURL URLWithString:self.url];
    
    
    [self.leftBtn setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    self.player = [[KZVideoPlayer alloc] initWithFrame:self.view.bounds videoUrl:playUrl];
    [self.view addSubview:self.player];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.

    [self.barView setLeftButton:self.leftBtn];
    
    [self.view bringSubviewToFront:self.barView];
}


-(void)leftBtnClick{
    
    [self.player stop];
    [self.player removeFromSuperview];
    self.player = nil;
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)dealloc
{
    NSLog(@"消费了dealloc");
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
