//
//  LPickerView.m
//  huanLeSong
//
//  Created by jonejia on 2018/5/18.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "LPickerView.h"
@interface LPickerView()<UIPickerViewDelegate,UIPickerViewDataSource>
@property(nonatomic, strong) UIPickerView * pickerView;

@end

@implementation LPickerView
-(instancetype)initWithFrame:(CGRect)frame
{
    if(self=[super initWithFrame:frame]){
        UIView *containView = [[UIView alloc] init];
        containView.frame = CGRectMake(0, 0, screen_width,frame.size.height);
        [self addSubview:containView];
        self.containView = containView;

        UIView *toolBar = [[UIView alloc] init];
        toolBar.frame = CGRectMake(0, 0, screen_width, 50*KWIDTH);
        toolBar.backgroundColor = BackGroundColor;
        [containView addSubview:toolBar];
        
        UIButton *cancleButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60*KWIDTH, 50*KWIDTH)];
        [cancleButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancleButton setTitleColor:UIColor.grayColor forState:UIControlStateNormal];

        [cancleButton addTarget:self action:@selector(cancelButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [toolBar addSubview:cancleButton];
        
        UIButton *sureButton = [[UIButton alloc] initWithFrame:CGRectMake(screen_width-60*KWIDTH, 0, 60*KWIDTH, 50*KWIDTH)];
        [sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [sureButton setTitleColor:UIColor.redColor forState:UIControlStateNormal];
        
        [sureButton addTarget:self action:@selector(sureButtonClick) forControlEvents:UIControlEventTouchUpInside];
        
        [toolBar addSubview:sureButton];
        
        
        UIPickerView *pickerView = [[UIPickerView alloc] init];
        pickerView.backgroundColor = BackGroundColor;
        pickerView.frame = CGRectMake(0,toolBar.bottom, screen_width, containView.height - toolBar.height);
        pickerView.delegate = self;
        pickerView.dataSource = self;
        [containView addSubview:pickerView];
        self.pickerView = pickerView;
    }
    return self;
        
}
-(void)setFirstArray:(NSArray *)firstArray withType:(NSString *)type
{
    _firstArray = firstArray;
    self.type = type;
    [self.pickerView reloadAllComponents];
    [self.pickerView selectRow:0 inComponent:0 animated:YES];
}
-(void)setFirstArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray withType:(NSString *)type
{
    _firstArray = [firstArray copy];
    _secondArray = [secondArray copy];
    self.type = type;
    [self.pickerView reloadAllComponents];
    [self.pickerView selectRow:0 inComponent:0 animated:YES];
    [self.pickerView selectRow:0 inComponent:1 animated:YES];

}



- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.firstArray.count;
    }else {
        return self.secondArray.count;
    }
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    if ([self.type isEqualToString:@"年龄范围"]) {
        return 2;
    } else
    {
        return 1;
    }
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 3, 30)];
    label.adjustsFontSizeToFitWidth = YES;
    label.textAlignment = NSTextAlignmentCenter;
    if (component == 0) {
        label.text = [self.firstArray objectAtIndexWithCheck:row];
    } else {
        label.text = [self.secondArray objectAtIndexWithCheck:row];
    }
//    else if (component == 2){
//        label.text = self.threeArray[row];
//    }
//    label.text = [self.firstArray objectAtIndexWithCheck:row];
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {//选择省
        if ([self.type isEqualToString:@"年龄范围"]) {
            NSMutableArray *newArray = [NSMutableArray array];
            for (NSInteger i = row; i<self.firstArray.count; i++) {
                [newArray addObject:self.firstArray[i]];
            }
            self.secondArray = newArray;
            NSLog(@"%@",self.secondArray);
            //
            [self.pickerView reloadComponent:1];
            [self.pickerView selectRow:0 inComponent:1 animated:YES];
            
            self.selectFirst = row;
            self.selectSecond = 0;
        } else {
            self.selectFirst = row;

        }
    }else if (component == 1){//选择市
        self.selectSecond = row;

      
    }else if (component == 2){//选择区
   
    }
    

}


- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40.0;
}

- (void)sureButtonClick {

    if ([self.type isEqualToString:@"年龄范围"]) {
        NSString *seleString = [self.firstArray objectAtIndexWithCheck:self.selectFirst];
        NSString *seleSecondString = [self.secondArray objectAtIndex:self.selectSecond];
        self.secondBlock(seleString, seleSecondString, self.type);
    } else
    {
        self.selectBlock(self.selectFirst,self.type);

    }
}

- (void)cancelButtonClick {
     if ([self.type isEqualToString:@"年龄范围"]) {
         self.secondBlock(@"-100", @"-100", self.type);
     }
     else{
         self.selectBlock(-100,self.type);

     }

}
@end
