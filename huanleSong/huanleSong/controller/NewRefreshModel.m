//
//  NewRefreshModel.m
//  huanLeSong
//
//  Created by mitko on 2018/5/31.
//  Copyright © 2018年 Wendy China. All rights reserved.
//

#import "NewRefreshModel.h"

@implementation NewRefreshModel

+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"FreshImages" : @"PublishFreshImage",
             @"FreshVideos":@"FreshVideo",
             @"RecommendList":@"Recommend",
             @"FreshComments":@"FreshCommen",

             };
}
@end


@implementation PublishFreshImage

@end
@implementation FreshVideo

@end
@implementation Recommend

@end
@implementation FreshCommen

@end

