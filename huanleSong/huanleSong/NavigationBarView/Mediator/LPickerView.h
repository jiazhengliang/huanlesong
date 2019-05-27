//
//  LPickerView.h
//  huanLeSong
//
//  Created by jonejia on 2018/5/18.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^selectFirstBlock)(NSInteger
                                 selectFirst,NSString *type);

typedef void (^selectSecondBlock)(NSString
                                  *selectString,NSString
                                  *selectSecond,NSString *type);
@interface LPickerView : UIView

@property(nonatomic, copy) NSString *type;

@property (nonatomic, weak) UIView *containView;
///第一列
@property(nonatomic, copy) NSArray * firstArray;
///第二列
@property(nonatomic, copy) NSMutableArray * secondArray;
///第三列
@property(nonatomic, strong) NSArray * threeArray;


///传进来的默认选中的第一列
@property(nonatomic, assign) NSInteger selectFirst;

///传进来的默认选中的第二列
@property(nonatomic, assign) NSInteger selectSecond;

///传进来的默认选中的第三列
@property(nonatomic, assign) NSInteger selectThree;

@property (nonatomic, copy) selectFirstBlock selectBlock;

@property (nonatomic, copy) selectSecondBlock secondBlock;


-(void)setFirstArray:(NSArray *)firstArray withType:(NSString *)type;


-(void)setFirstArray:(NSArray *)firstArray secondArray:(NSArray *)secondArray withType:(NSString *)type;


@end
