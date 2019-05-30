#import "PublishAgreementController.h"


#import "SVProgressHUD.h"
#import <Masonry/Masonry.h>
#import <YYKit/YYKit.h>
#import "MJRefresh.h"
#import <SafariServices/SafariServices.h>

@interface PublishAgreementController () <UITextViewDelegate, UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) UIImageView *titleIcon;

@property (nonatomic, strong) UIButton *close;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *agreementBg;

@property (nonatomic, strong) UITextView *agreement;

@property (nonatomic, strong) UIView *agreeView;

@property (nonatomic, strong) UIImageView *checkView;

@property (nonatomic, strong) UILabel *checkCaption;

@property (nonatomic, strong) UIButton *confirm;

@property (nonatomic, assign) BOOL isSelected;

@end

@implementation PublishAgreementController

- (void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.titleIcon];
    [self.view addSubview:self.close];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.confirm];
    [self.view addSubview:self.agreeView];
    [self.view addSubview:self.agreementBg];
    [self.view addSubview:self.agreement];
    [self makeConstraint];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self.agreeView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        self.isSelected = !self.isSelected;
    }]];
    

    
    self.isSelected = NO;
    // Do any additional setup after loading the view.
}

#pragma mark -
#pragma mark - Properties & Layout

- (UIImageView *)titleIcon {
    if (_titleIcon == nil) {
        _titleIcon = [[UIImageView alloc] init];
        [_titleIcon setImage:[UIImage imageNamed:@"video_agreement_icon"]];
    }
    return _titleIcon;
}

- (UIButton *)close {
    if (_close == nil) {
        _close = [UIButton buttonWithType:UIButtonTypeCustom];
        [_close setImage:[UIImage imageNamed:@"video_close_black"] forState:UIControlStateNormal];
        [_close setUserInteractionEnabled:YES];
        [_close setExclusiveTouch:YES];
//        [[_close rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }];
    }
    return _close;
}

- (UILabel *)titleLabel {
    if (_titleLabel == nil) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15.0];
        _titleLabel.text = @"您首次发布旅游者视频，请查阅并遵守监管规定";
        _titleLabel.textColor = [UIColor colorWithHexString:@"#333333"];
        _titleLabel.numberOfLines = 0;
    }
    return _titleLabel;
}

- (UIButton *)confirm {
    if (_confirm == nil) {
        _confirm = [UIButton buttonWithType:UIButtonTypeCustom];
        [_confirm setTitle:@"确认同意" forState:UIControlStateNormal];
        [_confirm setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _confirm.titleLabel.font = [UIFont systemFontOfSize:14.0];
        [_confirm setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#ff6619"]] forState:UIControlStateNormal];
        [_confirm setUserInteractionEnabled:YES];
        [_confirm setExclusiveTouch:YES];
        [_confirm addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirm;
}

- (UIView *)agreeView {
    if (_agreeView == nil) {
        _agreeView = [UIView new];
        _agreeView.backgroundColor = [UIColor whiteColor];
        [_agreeView addSubview:self.checkView];
        [_agreeView addSubview:self.checkCaption];
        [_agreeView setUserInteractionEnabled:YES];
        [_agreeView setExclusiveTouch:YES];
    }
    return _agreeView;
}

- (UIImageView *)checkView {
    if (_checkView == nil) {
        _checkView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"save_local_selected"]];
    }
    return _checkView;
}

- (UILabel *)checkCaption {
    if (_checkCaption == nil) {
        _checkCaption = [[UILabel alloc] init];
        _checkCaption.font = [UIFont systemFontOfSize:13.0];
        _checkCaption.textColor = [UIColor colorWithHexString:@"#ff6619"];
        _checkCaption.numberOfLines = 0;
        _checkCaption.text = @"本人已查阅并同意遵守《“旅游者”用户隐私政策》";
    }
    return _checkCaption;
}

- (UIImageView *)agreementBg {
    if (_agreementBg == nil) {
        _agreementBg = [[UIImageView alloc] init];
        [_agreementBg setImage:[UIImage imageNamed:@"video_agreement_bg"]];
    }
    
    return _agreementBg;
}

- (UITextView *)agreement {
    if (_agreement == nil) {
        _agreement = [[UITextView alloc] init];
        _agreement.editable = NO;
        _agreement.backgroundColor = [UIColor clearColor];
        _agreement.delegate = self;
        NSMutableAttributedString *contentAttriText = [[NSMutableAttributedString alloc] initWithURL:[[NSBundle mainBundle] URLForResource:@"AgreementContent" withExtension:@"rtf"] options:nil documentAttributes:nil error:nil];
        
        
        _agreement.attributedText = contentAttriText;
    }
    return _agreement;
}

- (void)makeConstraint {
    [self.titleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.mas_equalTo(18.0);
        make.width.mas_equalTo(51.0);
        make.height.mas_equalTo(44.0);
    }];
    
    [self.close mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-18.0);
        make.top.mas_equalTo(18.0);
        make.width.height.mas_equalTo(26.0);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleIcon.mas_bottom).offset(15.0);
        make.left.mas_equalTo(38.0);
        make.right.mas_equalTo(-38.0);
    }];
    
    [self.confirm mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0.0);
        make.bottom.mas_equalTo(0.0);
        make.right.mas_equalTo(0.0);
        make.height.mas_equalTo(47.0);
    }];
    
    [self.agreeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0.0);
        make.bottom.equalTo(self.confirm.mas_top).offset(0.0);
        make.right.mas_equalTo(0.0);
        make.height.mas_equalTo(47.0);
    }];
    
    [self.checkView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(18.0);
        make.width.height.mas_equalTo(14.0);
        make.centerY.mas_equalTo(0.0);
    }];
    
    [self.checkCaption mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.checkView.mas_right).offset(5.0);
        make.centerY.mas_equalTo(0.0);
        make.right.mas_equalTo(-18.0);
    }];
    
    [self.agreementBg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12.0);
        make.top.equalTo(self.titleIcon.mas_bottom).offset(60.0);
        make.right.mas_equalTo(-12.0);
        make.bottom.equalTo(self.agreeView.mas_top).offset(0.0);
    }];
    
    [self.agreement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16.0);
        make.top.equalTo(self.titleIcon.mas_bottom).offset(62.0);
        make.right.mas_equalTo(-16.0);
        make.bottom.equalTo(self.agreeView.mas_top).offset(-2.0);
    }];
}

-(void)confirmClick
{
     [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"user_first"];

    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark -
#pragma mark - Text view delegate

- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange interaction:(UITextItemInteraction)interaction {
    if ([URL.absoluteString isEqualToString:@"AgreementLink"]) {
//        NSURL *url = [NSURL URLWithString:H5URL];
//        SFSafariViewController *controller = [[SFSafariViewController alloc] initWithURL:url];
//        controller.title = @"“家乡头条”用户隐私政策";
//        controller.preferredControlTintColor = [UIColor colorWithHexString:@"#333333"];
//        
//        controller.modalPresentationStyle = UIModalPresentationCustom;
//        controller.transitioningDelegate = self;
//        
//        [self presentViewController:controller animated:YES completion:nil];
    }
    return NO;
};

- (UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(UIViewController *)presenting sourceViewController:(UIViewController *)source {
    return nil;
}

@end
