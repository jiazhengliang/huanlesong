//
//  PublicViewController.m
//  huanLeSong
//
//  Created by Wendy China on 2018/4/18.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "PublicWishController.h"
#import "jzlView.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "LPickerView.h"
//#import "ContactController.h"

@interface PublicWishController ()<UIScrollViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UITextField *titleField;

@property (nonatomic, strong)UIButton *selectedBtn;

@property (nonatomic, strong)UITextField *contactField;

@property (strong, nonatomic) jzlView *onePhotoView;
//
//@property (strong, nonatomic) HXPhotoManager *oneManager;

@property (nonatomic, strong) NSMutableArray *array;

@property (copy, nonatomic)NSString *latitude;

@property (copy, nonatomic)NSString *longitude;

@property (nonatomic, strong) CLLocationManager *locationManager;

//@property (nonatomic, strong)UISwitch *renzSwitch;
//
//@property (nonatomic, strong)UISwitch *justVipSwitch;

@property (nonatomic, strong) NSMutableArray  *imagArray;

@property (nonatomic, strong) NSMutableArray  *imagArrayIsBes;

@property (nonatomic, strong)  UILabel *subContactLabel;

@property (nonatomic, strong) UILabel *subTimeLabel;

@property (nonatomic, strong)LPickerView * pickerView;

@property(strong,nonatomic) NSArray *timeArray;

@property(strong,nonatomic) NSArray *timeArrayNum;

@property (nonatomic, copy) NSString *validityTime;

@property (nonatomic, copy) NSString *qqContact;

@property (nonatomic, copy) NSString *wxContact;

@property (nonatomic, copy) NSString *phoneContact;

@property(strong,nonatomic) NSArray *vipLeverArray;

@end

@implementation PublicWishController
-(LPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[LPickerView alloc] initWithFrame:CGRectMake(0, screen_height-220*KWIDTH, screen_width, 220*KWIDTH)];
        
    }
    return  _pickerView;
}



-(UIScrollView *)scrollView
{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.scrollsToTop = NO;
        _scrollView.frame = CGRectMake(0, 64 , screen_width, screen_height - 64);
        _scrollView.backgroundColor = UIColor.whiteColor;
        _scrollView.contentSize = CGSizeMake(screen_width , 0);
        _scrollView.pagingEnabled = YES;
        _scrollView.delegate = self;
        _scrollView.bounces = NO;
        _scrollView.scrollEnabled=YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
    }
    
    return _scrollView;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil];
    
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.timeArray = @[@"不限",@"3天",@"5天",@"10天",@"30天"];
    self.vipLeverArray = @[@"是",@"否"];
//    [VipCommonTool getMenVipArray];
    self.timeArrayNum = @[@"0",@"3",@"5",@"10",@"30"];
    self.validityTime = @"0";
    self.view.backgroundColor = UIColor.whiteColor;
    [self initNavigtionBar];
    [self creatUI];
    [self startLocation];

    self.imagArrayIsBes = [NSMutableArray array];
    self.imagArray = [NSMutableArray array];
    [self.view addSubview:self.pickerView];
    __weak typeof(self) weakSelf = self;
    
    self.pickerView.selectBlock = ^(NSInteger selectFirst, NSString *type) {
        NSLog(@"%ld===%@",selectFirst,type);
        weakSelf.pickerView.hidden = YES;
        
        if (selectFirst == -100) {
            NSLog(@"点击了取消");
        } else
        {
            NSLog(@"点击了确认");
            if ([type isEqualToString:@"有效期"]) {
                weakSelf.subTimeLabel.text = [weakSelf.timeArray objectAtIndexWithCheck:selectFirst];
                weakSelf.validityTime = [weakSelf.timeArrayNum objectAtIndexWithCheck:selectFirst];
            } else
            {
                weakSelf.subContactLabel.text = [weakSelf.vipLeverArray objectAtIndexWithCheck:selectFirst];
            }
          
        }
        
    };
    self.pickerView.hidden = YES;
}

-(void)initNavigtionBar
{
    self.title = @"愿望";
    [self.barView setTitleColor];
    UIButton *buttonBack=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
    [buttonBack addTarget:self action:@selector(leftBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [buttonBack setImage:[UIImage imageNamed:@"icon_return_red_normal"] forState:UIControlStateNormal];
    [buttonBack setImage:[UIImage imageNamed:@"icon_return_pressed"] forState:UIControlStateHighlighted];

    buttonBack.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [self.barView setLeftButton:buttonBack];

    //提交
    UIButton *buttonSubmit=[UIButton buttonWithType:UIButtonTypeCustom];
    buttonSubmit.frame=CGRectMake(0, 0, 44, 44);
    [buttonSubmit setTitle:@"提交" forState:UIControlStateNormal];
    [buttonSubmit setTitleColor:NavigationBarTitleColor forState:UIControlStateNormal];
//    buttonSubmit.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    buttonSubmit.imageEdgeInsets = UIEdgeInsetsMake(10, 6, 10, 14);
    [buttonSubmit addTarget:self action:@selector(rightBtnClick) forControlEvents:UIControlEventTouchUpInside];
    buttonSubmit.titleLabel.font = [UIFont systemFontOfSize:16];;
    [self.barView setRightButton:buttonSubmit];
    
}


-(void)creatUI
{
    
    [self.view addSubview:self.scrollView];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10*KWIDTH, 7, 45*KWIDTH, 40*KWIDTH)];
    titleLabel.text = @"主题";
    titleLabel.font = [UIFont systemFontOfSize:17];
    titleLabel.textColor = UIColor.blackColor;
    [self.scrollView addSubview:titleLabel];
    
    UITextField *titleField = [[UITextField alloc] init];
    titleField.frame = CGRectMake(titleLabel.right+10, titleLabel.top, screen_width-titleLabel.right-42*KWIDTH, titleLabel.height);
    
    titleField.placeholder = @"这一刻的愿望。。。";
    titleField.textColor = UIColor.grayColor;
    titleField.font = [UIFont systemFontOfSize:15];;
    titleField.delegate = self;
    self.titleField = titleField;
    [self.scrollView addSubview:titleField];
    
    UIButton *arrBtn = [[UIButton alloc] init];
    arrBtn.frame = CGRectMake(screen_width-30, titleLabel.top, 30, titleField.height);
    
    [arrBtn addTarget:self action:@selector(arrBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:arrBtn];
    UIView *lineView1 = [[UIView alloc] init];
    lineView1.frame = CGRectMake(10*KWIDTH, arrBtn.bottom+7*KWIDTH, screen_width-20*KWIDTH, 1);
    lineView1.backgroundColor = UIColor.grayColor;
    [self.scrollView addSubview:lineView1];
   
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10*KWIDTH, lineView1.bottom+7*KWIDTH, 70*KWIDTH, 40*KWIDTH)];
    timeLabel.text = @"有效期";
    timeLabel.font =[UIFont systemFontOfSize:14];
    timeLabel.textColor = [UIColor grayColor];
    [self.scrollView addSubview:timeLabel];
    UILabel *subTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(115*KWIDTH, lineView1.bottom+7*KWIDTH, screen_width-150*KWIDTH, 40*KWIDTH)];
    subTimeLabel.textAlignment = NSTextAlignmentRight;
    subTimeLabel.text = @"不限";
    subTimeLabel.font = [UIFont systemFontOfSize:17];
    subTimeLabel.textColor = UIColor.grayColor;
    [self.scrollView addSubview:subTimeLabel];
    
    UIButton *arrBtn2 = [[UIButton alloc] init];
    arrBtn2.frame = CGRectMake(screen_width-30, timeLabel.top, 30, titleField.height);
    [arrBtn2 setImage:[UIImage imageNamed:@"wish_icon_combo"] forState:UIControlStateNormal];
    [self.scrollView addSubview:arrBtn2];

    UIView * titleTap1 =[[UIView alloc] init];
    titleTap1.frame = CGRectMake(0,lineView1.bottom, screen_width, 54*KWIDTH);
    titleTap1.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGestur1=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction1:)];
    [titleTap1 addGestureRecognizer:tapGestur1];
    [self.scrollView addSubview:titleTap1];
    UIView *lineView0 = [[UIView alloc] init];
    lineView0.frame = CGRectMake(10*KWIDTH, arrBtn2.bottom+7*KWIDTH, screen_width-20*KWIDTH, 1);
    lineView0.backgroundColor = UIColor.grayColor;
    [self.scrollView addSubview:lineView0];
    
    UILabel *sexLabel = [[UILabel alloc] initWithFrame:CGRectMake(10*KWIDTH, lineView0.bottom+7*KWIDTH, 150 , titleLabel.height)];
    sexLabel.text = @"是否公开";
    sexLabel.font = [UIFont systemFontOfSize:15];
    sexLabel.textColor = UIColor.grayColor;
    [self.scrollView addSubview:sexLabel];

    UILabel *subContactLabel = [[UILabel alloc] initWithFrame:CGRectMake(115*KWIDTH, sexLabel.top, screen_width-150*KWIDTH, 40*KWIDTH)];
    subContactLabel.textAlignment = NSTextAlignmentRight;
    subContactLabel.text = @"不限";
    subContactLabel.font = [UIFont systemFontOfSize:14];;
    subContactLabel.textColor = UIColor.grayColor;
    self.subContactLabel = subContactLabel;
    [self.scrollView addSubview:subContactLabel];
    
    UIButton *arrBtn3 = [[UIButton alloc] init];
    arrBtn3.frame = CGRectMake(screen_width-30, subContactLabel.top, 30, titleField.height);
    [arrBtn3 setImage:[UIImage imageNamed:@"wish_icon_combo"] forState:UIControlStateNormal];
    [self.scrollView addSubview:arrBtn3];

    UIView * titleTap3 =[[UIView alloc] init];
    titleTap3.frame = CGRectMake(0,lineView0.bottom+7*KWIDTH, screen_width, 54*KWIDTH);
    titleTap3.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGestur3=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction3:)];
    [titleTap3 addGestureRecognizer:tapGestur3];
    [self.scrollView addSubview:titleTap3];
    UIView *lineView5 = [[UIView alloc] init];
    lineView5.frame = CGRectMake(0, subContactLabel.bottom+7*KWIDTH,screen_width, 1);
    lineView5.backgroundColor = UIColor.grayColor;
    [self.scrollView addSubview:lineView5];

    UILabel *phoneLabel = [[UILabel alloc] initWithFrame:CGRectMake(10*KWIDTH, lineView5.bottom+7*KWIDTH, 100*KWIDTH, titleLabel.height)];
    phoneLabel.text = @"相册(限9张)";
    phoneLabel.font = [UIFont systemFontOfSize:17];
    phoneLabel.textColor = UIColor.grayColor;
    [self.scrollView addSubview:phoneLabel];
    
    
    self.array = [NSMutableArray array];
    self.onePhotoView = [[jzlView alloc] initWithFrame:CGRectMake(0, phoneLabel.bottom+10, screen_width, 200)];

    [self.scrollView addSubview:self.onePhotoView];
    self.onePhotoView.isWebUrl  = NO;
    self.onePhotoView.maxCount = 9;
    self.onePhotoView.isSelect3rdPicker  = YES;
    
    
    self.onePhotoView.imageSize = CGSizeMake(90, 90);
    self.onePhotoView.currentVc  = self;
    
    self.onePhotoView.backgroundColor =[UIColor whiteColor];
    self.subTimeLabel = subTimeLabel;
}


-(UIButton *)creatNewButtonFrame:(CGRect )frame title:(NSString *)title normalImge:(NSString *)imge hightImge:(NSString *)hightImag
{
    UIButton *maleBtn = [[UIButton alloc] init];
    maleBtn.frame = frame;
    [maleBtn setImage:[UIImage imageNamed:imge] forState:UIControlStateNormal];
    [maleBtn setImage:[UIImage imageNamed:hightImag] forState:UIControlStateSelected];
    [maleBtn setTitle:title forState:UIControlStateNormal];
    [maleBtn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
    maleBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    maleBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    [maleBtn addTarget:self action:@selector(sexBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return maleBtn;
}

-(void)tapAction1:(id)tap

{
    
    NSLog(@"有效期");
    self.pickerView.hidden = NO;
    [self.pickerView setFirstArray:self.timeArray withType:@"有效期"];
    [self.view endEditing:YES];

}

-(void)tapAction3:(id)tap

{
    [self.view endEditing:YES];
    NSLog(@"bottomViewDelegate第一个按钮");
    self.pickerView.hidden = NO;
    [self.pickerView setFirstArray:self.vipLeverArray withType:@"是否"];
    [self.view endEditing:YES];
    
}


-(void)sexBtnClick:(UIButton *)btn
{
    [self.view endEditing:YES];
    btn.selected = YES;
    if (btn!= self.selectedBtn) {
        self.selectedBtn.selected = NO;
        btn.selected = YES;
        self.selectedBtn = btn;
    }else{
        self.selectedBtn.selected = YES;
    }
    NSString *title = self.selectedBtn.titleLabel.text;
    
    NSLog(@"点击了%@",title);
}

-(void)arrBtnClick{
    
    NSLog(@"arrBtnClick");
    
}

#pragma mark 点击了取消
-(void)leftBtnClick
{
    NSLog(@"点击了取消");

    [self.navigationController popViewControllerAnimated:YES];
}


#pragma mark 点击了发布
//-(void)rightBtnClick
//{
//    __weak typeof(self) weakSelf = self;
//    NSLog(@"点击了发布");
//    NSString *publicContent = self.titleField.text;
//
//    NSString *sexString = self.selectedBtn.titleLabel.text;
//
//    WishDataManager *manager = [WishDataManager new]
//    ;
//    NSString *token = LoginToken();
//    if (self.onePhotoView.imageA.count ==0) {
//        [DisplayUtils alert:@"至少添加一张图片"];
//        return;
//    }
//    NSLog(@"%@%@",self.onePhotoView.imageA,self.onePhotoView.imageAIsBes);
//
//    if (publicContent.length == 0) {
//        [DisplayUtils alert:@"说点什么吧～～"];
//        return;
//    }
//
//
//    NSInteger vipLeve = [VipCommonTool StringToVipLever:self.subContactLabel.text];
//    NSDictionary *param = @{
//                            @"Token":token?token:@"",
//                            @"Title":publicContent?publicContent:@"",
//                            @"VipLevel":@(vipLeve),
//                            @"ValidityTime":_validityTime,
//                            @"LocationX":_longitude?_longitude:@"",
//                            @"LocationY":_latitude?_latitude:@"",
//                            };
//
//
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
//    [manager PublicWishWishParam:param imgeArray:self.onePhotoView.imageA besArray:self.onePhotoView.imageAIsBes block:^(NSDictionary *dictionary, NSError *error) {
//        [SVProgressHUD dismiss];
//        NSLog(@"dictionary=%@",dictionary);
//        if ([dictionary[@"Result"]  isEqualToString:@"F"]) {
//            [DisplayUtils alert:dictionary[@"ErrorMessage"]];
//        } else  if ([dictionary[@"Result"] isEqualToString:@"S"])
//        {
//            [DisplayUtils alert:@"愿望信息已上传，审核通过后发布"];
//            [weakSelf performSelector:@selector(leftBtnClick) withObject:nil afterDelay:0.5];
//        }
//
//    }];
//
//}

/**
 1、新鲜事发布：
 接口名为：  MemberUploadAlbum_Cos
 新增参数：  Images 图片路径集，用逗号分隔，其中图片名的命名规则为： 用户ID_照片宽_照片高_顺序_时间戳.png
 
 2、愿望发布接口修改：
 接口名为：  WishPublish_Cos
 新增参数：  Images 图片路径集，用逗号分隔，其中图片名的命名规则为： 用户ID_照片宽_照片高_顺序_是否私密照_时间戳.png
 
 3、相册发布：
 接口名为：  MemberUploadAlbum_Cos
 新增参数：  Images 图片路径集，用逗号分隔，其中图片名的命名规则为： 用户ID_照片宽_照片高_顺序_时间戳.png
*/
#pragma mark 点击了发布
-(void)rightBtnClick
{
    NSString *publicContent = self.titleField.text;

    
    if (self.onePhotoView.imageA.count ==0) {
        [DisplayUtils alert:@"至少添加一张图片"];
        return;
    }

    if (publicContent.length == 0) {
        [DisplayUtils alert:@"说点什么吧～～"];
        return;
    }
     [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];
    __weak typeof(self) weakSelf = self;
//    [LNetworking TengXunPostPictureimages:self.onePhotoView.imageA imageAIsBes:self.onePhotoView.imageAIsBes type:PostPictureTypeWish block:^(NSString *imagesString) {
//        [SVProgressHUD dismiss];
//        [weakSelf PostWishDatePublish:imagesString];
//
//    }];
    
    [self performSelector:@selector(TengXunPostPictureimages) withObject:nil afterDelay:2.0];

}

-(void)TengXunPostPictureimages{
    
    [SVProgressHUD dismiss];
    
}

-(void)PostWishDatePublish:(NSString *)imageString
{
    
    NSString *publicContent = self.titleField.text;
    
    NSString *sexString = self.selectedBtn.titleLabel.text;
    
    NSInteger vipLeve = @"";
//    [VipCommonTool StringToVipLever:self.subContactLabel.text];
        NSDictionary *param = @{
                                @"Title":publicContent?publicContent:@"",
                                @"VipLevel":@(vipLeve),
                                @"ValidityTime":_validityTime,
                                @"LocationX":_longitude?_longitude:@"",
                                @"LocationY":_latitude?_latitude:@"",
                                @"Images":imageString,
                                };
     __weak typeof(self) weakSelf = self;
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeClear];

//    [LNetworking CommonPostMethod:@"WishPublish_Cos" baseParams:param block:^(LNetworkingModel *netWorking) {
//         [SVProgressHUD dismiss];
//        if (netWorking.requestSuccess) {
//            [DisplayUtils alert:@"发布成功"];
//
//            [weakSelf performSelector:@selector(leftBtnClick) withObject:nil afterDelay:0.5f];
//        } else {
//            [DisplayUtils alert:netWorking.ErrorMessage];
//        }
//    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 获取定位
//开始定位
- (void)startLocation {
    if ([CLLocationManager locationServicesEnabled]) {
        //        CLog(@"--------开始定位");
        self.locationManager = [[CLLocationManager alloc]init];
        self.locationManager.delegate = self;
        //控制定位精度,越高耗电量越
        self.locationManager.desiredAccuracy = kCLLocationAccuracyKilometer;
        // 总是授权
        [self.locationManager requestAlwaysAuthorization];
        self.locationManager.distanceFilter = 10.0f;
        [self.locationManager requestAlwaysAuthorization];
        [self.locationManager startUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([error code] == kCLErrorDenied) {
        NSLog(@"访问被拒绝");
//        PXAlertView *alert = [PXAlertView showAlertWithTitle:@"提示" message:Allow_Local_Server cancelTitle:@"确定" completion:^(BOOL cancelled, NSInteger buttonIndex) {
//
//        }];
//        [alert setBackgroundColor:[UIColor whiteColor]];
//        [alert setTitleColor:[UIColor blackColor]];
//        [alert setTitleFont:[UIFont fontWithName:@"Bold" size:17]];
//        [alert setMessageColor:[UIColor blackColor]];
//        [alert setCancelButtonTitleColor:RGBColor(255,165,189)];
//        [alert setCancelButtonFont:[UIFont systemFontOfSize:16]];
//        [alert setCancelButtonBackgroundColor:[UIColor colorWithWhite:0.9 alpha:1]];
        
    }
    if ([error code] == kCLErrorLocationUnknown) {
        NSLog(@"无法获取位置信息");
    }
}

//定位代理经纬度回调
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation *newLocation = locations[0];
    
    // 获取当前所在的城市名
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    self.latitude = [NSString stringWithFormat:@"%f",newLocation.coordinate.latitude];
    self.longitude = [NSString stringWithFormat:@"%f",newLocation.coordinate.longitude];
    NSLog(@"latitude==%@,longitude==%@",_latitude,_longitude);
    //根据经纬度反向地理编译出地址信息
    __weak __typeof(self)weakSelf = self;
    [geocoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *array, NSError *error){
        if (array.count > 0){
            CLPlacemark *placemark = [array objectAtIndex:0];
            
            //获取城市
            NSString *city = placemark.locality;
            if (!city) {
                city = placemark.administrativeArea;
            }
            NSLog(@"city = %@", city);//深圳市
            NSLog(@"--%@",placemark.name);//泰然六路52-6号
            NSLog(@"++++%@",placemark.subLocality); //福田区
            NSLog(@"administrativeArea == %@",placemark.administrativeArea); //广东省
            
            NSString *address = [NSString stringWithFormat:@"%@%@%@%@",placemark.administrativeArea,city,placemark.subLocality,placemark.name];
            

            
        }
        else if (error == nil && [array count] == 0)
        {
            NSLog(@"No results were returned.");
        }
        else if (error != nil)
        {
            NSLog(@"An error occurred = %@", error);
        }
    }];
    //系统会一直更新数据，直到选择停止更新，因为我们只需要获得一次经纬度即可，所以获取之后就停止更新
    [manager stopUpdatingLocation];
    
}



-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
//    if (![XYFunction LegalText:string]) {
//        return NO;
//    }
    NSUInteger textLength = 0;
    for (NSUInteger i = 0; i < textField.text.length; i++) {
        unichar uc = [textField.text characterAtIndex:i];
        textLength += isascii(uc)?1:2;
        
        if (textLength > 50  && string.length > range.length) {
            return NO;
        }
    }
    
    return YES;
}

@end

