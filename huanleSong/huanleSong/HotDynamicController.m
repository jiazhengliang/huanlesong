

#import "HotDynamicController.h"
#import "SquareTableViewCell.h"
#import "PublicWishController.h"
//
//#import "WishDataManager.h"
#import "NewRefreshModel.h"
#import "PlayerViewController.h"
//#import "ReportController.h"
//
//#import "WXApi.h"
//#import "MSSBrowseDefine.h"
//#import "PublishModel.h"
//#import "FreshRecommentCell.h"
//#import "SquareDetailCommentTableViewCell.h"
//#import "FreshChoiceRewardView.h"
//#import "PublicView.h"
//#import "CommonProtocol.h"

@interface HotDynamicController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong,nonatomic) UITableView *dateTableView;
@property (nonatomic,strong) NSMutableArray *infoArr;
@property (nonatomic, assign) NSInteger pageInde;
@property (nonatomic,strong) NSMutableArray *vipInfoModelArr;

@property (nonatomic,strong) NewRefreshModel *priseModel;

@property (nonatomic,strong) NSIndexPath *priseIndex;

@property (nonatomic,strong) UIView *choiceRewardBgView;

@property (nonatomic,strong)NSArray *imagearray;

@end

@implementation HotDynamicController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.dateTableView];
//    [self addTableHeader:self.dateTableView];
     __weak typeof(self) weakSelf = self;
//    NSArray *imagearray;
    if (_isfrom == YES) {
         self.title = @"我的视频";
        self.imagearray =@[@{
                      @"HeadImaBig": @"http://jxtt.diangoumall.com/149c30b0vodcq1258058953/7e8d2b855285890789595419918/5285890789595419919.jpg",
                      @"Nickname": @"龙源",
                      @"City_Often": @"广东",
                      @"FreshTitle": @"姑娘，你那不是穷游，是穷浪！",
                      @"CreateTime": @"2018-12-13",
                      @"play_url": @"http://jxtt.diangoumall.com/149c30b0vodcq1258058953/7e8d2b855285890789595419918/sPwwfvJgV4QA.mp4"
                      }];
    } else
    {
        self.title = @"首页";
       self.imagearray =@[@{
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/80a3caac5285890787211309561/5285890787211309562.jpg",
                                   @"Nickname": @"龙源",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"姑娘，你那不是穷游，是穷浪！",
                                   @"CreateTime": @"2018-12-13",
                                   
                                   @"play_url": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/80a3caac5285890787211309561/86Dc0IGoPkEA.mp4"
                                   }, @{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/80fc8ea65285890787211356130/5285890787211356131.jpg",
                                   @"Nickname": @"董Season ",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"跟你的恋爱啊，好像是去一个遥远的异国旅行，沿路都很开心，就算心里知道绝对没有机会在那里定居",
                                   @"CreateTime": @"2018-12-13",
                                   
                                   @"play_url": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/80fc8ea65285890787211356130/3i3sMzeQqzgA.mp4",
                                   
                                   }, @{
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/af36614c5285890787208303840/5285890787208303841.jpg",
                                   @"Nickname": @"优酷X5  ",
                                   @"City_Often": @"广西",
                                   @"FreshTitle": @"我不是设计师，又不会画画，买它干啥？",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url":  @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/af36614c5285890787208303840/IHoiqgWT9cMA.mp4",
                                   
                                   }, @{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/af35c4725285890787208302487/5285890787208302488.jpg",
                                   @"Nickname": @"CoolManLuLu  ",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"我想问问，他们贴的什么膜",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url":  @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/af35c4725285890787208302487/70DCEhT3zIMA.mp4",
                                   },@{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/af35261f5285890787208301010/5285890787208301011.jpg",
                                   @"Nickname": @"顽童ck",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"背着背包的路上，看过许多人，听过许多故事，见过旅行风景，就这样，慢慢学会了长大",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url":  @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/af35261f5285890787208301010/aCIzE9aPWWIA.mp4",
                                   }, @{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/ad87467e5285890787208299286/5285890787208299287.jpg",
                                   @"Nickname": @"盲僧洗头用汰渍 ",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"不要悲观地认为自己很不幸，其实比你更不幸的人还很多；不要乐观地认为自己很伟大，其实你只是沧海之一粟",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url":  @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/ad87467e5285890787208299286/QjQ8mIa6RNkA.mp4",
                                   }, @{
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/ad2bae2d5285890787208247123/5285890787208247124.jpg",
                                   @"Nickname": @"幻夜旧城碎梦 ",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"憧憬一段任性的旅行，最好在青春飞扬的时节，最好有个遥远美丽的目的地，最好能伴阳光前行，最好，有你",
                                   @"CreateTime": @"2018-12-13", @"play_url":@"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/ad2bae2d5285890787208247123/vBnoHY6E2JMA.mp4",
                                   
                                   }, @{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/acf3d8ed5285890787208214714/5285890787208214715.jpg",
                                   @"Nickname": @"不颜草啊 25天前",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"出去旅行，不是去看风景，而是去寻回自己——最本真的自己",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url":  @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/acf3d8ed5285890787208214714/0D5oMl2YCvYA.mp4",
                                   
                                   }, @{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/aaa154eb5285890787208119132/5285890787208119133.jpg",
                                   @"Nickname": @"chin0102 2",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"当遗忘变成另一种开始，我踏出了旅途的第一步！",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/aaa154eb5285890787208119132/A6GFPWk5QaQA.mp4",
                                   
                                   },@{
                                   
                                   @"HeadImaBig": @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/70a68e145285890787207961722/5285890787207961724.jpg",
                                   @"Nickname": @"神云逐浪",
                                   @"City_Often": @"广东",
                                   @"FreshTitle": @"带上心灵去旅行，以平和的心态看待一切，文画音，看似耳目所为，其实是内心世界的感受。可以以心感悟，以此沉淀，足矣；耳听佳音，目极美好，已是福音；携一勺花之语，摘一曲花之歌，让心释然，已是欣慰",
                                   @"CreateTime": @"2018-12-13",
                                   @"play_url":  @"http://1400100725.vod2.myqcloud.com/8b7d5993vodgzp1400100725/70a68e145285890787207961722/Bo3dBjr62p8A.mp4",
                                   }];
        
    }
   
    self.barView.backgroundColor= UIColor.whiteColor;
    self.barView.setTitleColor;
    self.pageInde = 1;
    
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonBack addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"fenxg"] forState:UIControlStateNormal];
    
    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self.barView setRightButton:buttonBack];
    
    self.view.backgroundColor = UIColor.grayColor;
//    [self getFreshList];

   
    self.infoArr = [NSMutableArray array];
    
    for (int i = 0; i<_imagearray.count; i++) {
        NSDictionary *dic = [_imagearray objectAtIndex:i];
        
        NewRefreshModel *model = [NewRefreshModel mj_objectWithKeyValues:dic];
        
        [self.infoArr addObject:model];
    }
    
    
    NSLog(@"self.infoArr = %@",_infoArr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)leftBtnClick
{
 
    [self.navigationController pushViewController:[PublicWishController new] animated:YES];
    NSLog(@"leftBtnClick");
}

#pragma mark---UITableView Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   return self.imagearray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
//
        return cell.frame.size.height;
//    }

//    return 100;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    NewRefreshModel *model = [self.infoArr objectAtIndexWithCheck:indexPath.section];

    PlayerViewController *playvc = [PlayerViewController new];
    playvc.url = model.play_url;
    [self.navigationController pushViewController:playvc animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NewRefreshModel *model = [self.infoArr objectAtIndexWithCheck:indexPath.section];

    SquareTableViewCell *headerCell = [SquareTableViewCell cellWithTableView:tableView indexpath:indexPath];

    headerCell.delegate = self;
    headerCell.refrashModel = model ;

    headerCell.smallImage.tag = indexPath.section +100;
    headerCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return headerCell;

}


#pragma mark - getters and setters

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

-(NSMutableArray *)infoArr{
    if(_infoArr==nil){
        _infoArr = [NSMutableArray array];
    }
    return _infoArr;
}

-(NSMutableArray *)vipInfoModelArr{
    if(_vipInfoModelArr==nil){
        _vipInfoModelArr = [NSMutableArray array];
    }
    return _vipInfoModelArr;
}

@end


