//
//  CustomNavigationController.h
//  ZhongTou
//
//  Created by Jone on 2017/7/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Macros.h"
#import "MacroDefinition.h"
#import "InitializationUIMethod.h"
#import "LMacrosGenerator.h"

@interface CustomNavigationController : UINavigationController

- (void)navigationCanDragBack:(BOOL)bCanDragBack;

@end
