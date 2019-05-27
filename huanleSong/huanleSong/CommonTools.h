//
//  CommonTools.h
//  ZhongTou
//
//  Created by Jone on 2017/10/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <CommonCrypto/CommonDigest.h>

@interface CommonTools : NSObject
+(BOOL)isLocationServiceOpen;

+(NSString *)timeChangeSting:(NSString *)time;

+(NSString *)StringChangeLocationSting:(NSString *)oldString;
+ (NSString *)changMinuteToTime:(NSString *)minute;

//获取时间戳(毫秒)
+(NSString *)getTimeScamp;
//获取时间戳(秒)
+(NSString *)getSecondTimeScamp;

//将数组转换为字符
+(NSString *)arrayChangeSign:(NSArray *)array;

//将字典转换为jons字符串
+(NSString *)convertToJsonData:(NSDictionary *)dict;

//将字典转换为jons字符串
+(NSString *)URLConverToURL:(NSString *)url;

//将json字符串转换为字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

//将字符串转换为字典
+ (NSDictionary *)dictionaryWithString:(NSString *)string;

+ (NSMutableAttributedString *)changeStrWittContext:(NSString *)context ChangeColorText:(NSString *)ColorStr WithColor:(id)ColorValue WithFont:(id)FontValue;


+(NSString *)GetSHA1:(NSString *)input;

+(NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key;

+(NSString *)swichStringtoData:(NSString *)LastLoginTime;

+(NSString *)swichStringtoDistance:(NSInteger)distance;


+(NSString *)savescanresultimage:(UIImage *)resultimage imagename:(NSString *)strimagename;

+(UIImage *)newimageFramOldimage:(UIImage *)oldimage;

@end
