//
//  CommonTools.m
//  ZhongTou
//
//  Created by Jone on 2017/10/18.
//  Copyright © 2017年 Jone. All rights reserved.
//

#import "CommonTools.h"
#import <CommonCrypto/CommonCryptor.h>

static NSTimeInterval timeStamp_second() {
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    return [dat timeIntervalSince1970];
}

@implementation CommonTools
+ (BOOL)isLocationServiceOpen {
    if ([CLLocationManager locationServicesEnabled] &&
        ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized
         || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {

            return YES;
        }
    else if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied){
        return NO;
    } else
    {
        return YES;

    }
    
}

+(NSString *)timeChangeSting:(NSString *)time

{
    long between = [time longLongValue]/1000;
    long day1 = between / (24 * 3600);
    int hour1 = between % (24 * 3600) / 3600;
    int minute1 = between % 3600 / 60;
    int second1 = between % 60;
    return [NSString stringWithFormat:@"总耗时: %ld天%d小时%d分%d秒",day1,hour1,minute1,second1];
}

// 将一段时间转换 eg：5分钟转化为00：05：00
+ (NSString *)changMinuteToTime:(NSString *)minute
{
    NSInteger time = [minute integerValue];
    if(time < 60)
    {
        return [NSString stringWithFormat:@"00:%02d",time];
    }
    else
    {
        int hours = (int)(time/3600);
        int minute = (int)(time-hours*3600)/60;
        int second = time-hours*3600-minute*60;
        return [NSString stringWithFormat:@"%02d:%02d:%02d",hours,minute,second];
    }
    
}

+(NSString *)StringChangeLocationSting:(NSString *)oldString
{
    NSMutableString *newString = [NSMutableString string];
    for (NSUInteger i = oldString.length;i>0;i--) {
        [newString appendString:[oldString substringWithRange:NSMakeRange(i-1, 1)]];
    }
    [newString appendString:AppTokenString];
    return newString;
}

+ (NSString *)getTimeScamp {
    return [NSString stringWithFormat:@"%.0f", timeStamp_second()*1000];
    
}

+ (NSString *)getSecondTimeScamp {
    return [NSString stringWithFormat:@"%.0f", timeStamp_second()];
}

+(NSString *)arrayChangeSign:(NSArray *)array
{
    NSString *nonce = [array objectAtIndexWithCheck:0];
    NSString *timestamp = [array objectAtIndexWithCheck:1];
    NSString *methodName = [array objectAtIndexWithCheck:2];
    NSString *requestData = [array objectAtIndexWithCheck:3];

    NSString *signValue = @"";
    
    return signValue;
}

+ (NSMutableAttributedString *)changeStrWittContext:(NSString *)context ChangeColorText:(NSString *)ColorStr WithColor:(id)ColorValue WithFont:(id)FontValue {
    if (context == nil || ColorStr == nil) {
        return nil;
    }
    NSMutableAttributedString* inputStr = [[NSMutableAttributedString alloc]initWithString:context];
    NSRange ColorRange = NSMakeRange([[inputStr string]rangeOfString:ColorStr options:NSBackwardsSearch].location, [[inputStr string]rangeOfString:ColorStr].length);
    
    [inputStr addAttributes:@{NSForegroundColorAttributeName:ColorValue,NSFontAttributeName:FontValue} range:ColorRange];
    return inputStr;
    
}


+(NSString *)GetSHA1:(NSString *)input{
    
    
    NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return output;
    
}


+(NSString *)convertToJsonData:(NSDictionary *)dict
{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    //[mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

+(NSString *)URLConverToURL:(NSString *)url
{
    if (!url) {
        return nil;
    }
    if ([url hasPrefix:@"http"]) {
        return url;
    }
    NSMutableString *newUrl = [NSMutableString stringWithFormat:@"%@%@",@"",url];
    NSRange range = NSMakeRange(0, newUrl.length);

    [newUrl replaceOccurrencesOfString:@"\\" withString:@"/" options:NSCaseInsensitiveSearch range:range];
    
    return newUrl;

}


+(NSString *)swichStringtoData:(NSString *)LastLoginTime{
    @try{

        // 时间字符串
        // 日期格式化类
        NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
        // 设置日期格式(为了转换成功)
        fmt.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        
        // NSString * -> NSDate *
        NSDate *date = [fmt dateFromString:LastLoginTime];
        
        NSLog(@"%@", date);
        
        

        NSDate *nowDate = [NSDate date];
        
        NSDate *needFormatDate = [fmt dateFromString:LastLoginTime];

        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        NSString *dateStr = [[NSString alloc] init];
        
        if (time<=60) {  //1分钟以内的
            
            dateStr = @"刚刚";
            
        }else if(time<=60*60){  //一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24*30){  //在两天内的
            NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
           
            fmt.dateFormat = @"MM-dd";
  
            
            NSString * nowDay = [fmt stringFromDate:nowDate];
            NSString * lastDay = [fmt stringFromDate:needFormatDate];
         
            if (time<60*60*24 && [nowDay integerValue] == [lastDay integerValue]) {
                //在同一天
                int hour = time/60/60;
                dateStr  = [NSString stringWithFormat:@"%d小时前",hour];;
            } else if(time>=60*60*24&&time<60*60*24*2&& [nowDay integerValue] != [lastDay integerValue]){
                //昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[fmt stringFromDate:needFormatDate]];
            } else{
               
                int day = time/60/60/24;
                dateStr = [NSString stringWithFormat:@"%d天前",day];
            }
            
        }else {
            
            fmt.dateFormat = @"yyyy";

            NSString * yearStr = [fmt stringFromDate:needFormatDate];
            NSString *nowYear = [fmt stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                //在同一年
                fmt.dateFormat = @"MM-dd";

                dateStr = [fmt stringFromDate:needFormatDate];
            }else{
                [fmt setDateFormat:@"yyyy-MM-dd"];
                fmt.dateFormat = @"yyyy-MM-dd";

                dateStr = [fmt stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    } @catch (NSException *exception) {
        return @"";
    }
}

+(NSString *)swichStringtoDistance:(NSInteger)distance
{
    NSString *longStr = @"";
    if (distance) {
        CGFloat num = (CGFloat)distance/1000;
        
    } else
    {
        
    }
    return longStr;
}

+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


- (NSDictionary *)dictionaryWithString:(NSString *)string {
    
    NSString *paramsStr = string;
    if (paramsStr.length) {
        NSMutableDictionary *paramsDict = [NSMutableDictionary dictionary];
        NSArray *paramArray = [paramsStr componentsSeparatedByString:@"&"];
        for (NSString *param in paramArray) {
            if (param && param.length) {
                NSArray *parArr = [param componentsSeparatedByString:@"="];
                if (parArr.count == 2) {
                    [paramsDict setObject:parArr[1] forKey:parArr[0]];
                }
            }
        }
        return paramsDict;
    }else{
        return nil;
    }
}

//解密
+(NSString *)decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    
    if (!IsNeedDes) {
        return cipherText;
    }
    
    NSData* cipherData =[self convertHexStrToData:cipherText];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
//    NSString * final =[self md5:key];
//    final= [final uppercaseString];
//    final =[final substringWithRange:NSMakeRange(0, 8)];
    char * keyChar =(char*)[key UTF8String];
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding,
                                          keyChar,
                                          kCCKeySizeDES,
                                          keyChar,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString* plainText = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText;
}

//将16进制字符串转成NSData
+ (NSData *)convertHexStrToData:(NSString *)str {
    if (!str || [str length] == 0) {
        return nil;
    }
    
    NSMutableData *hexData = [[NSMutableData alloc] initWithCapacity:8];
    NSRange range;
    if ([str length] % 2 == 0) {
        range = NSMakeRange(0, 2);
    } else {
        range = NSMakeRange(0, 1);
    }
    for (NSInteger i = range.location; i < [str length]; i += 2) {
        unsigned int anInt;
        NSString *hexCharStr = [str substringWithRange:range];
        NSScanner *scanner = [[NSScanner alloc] initWithString:hexCharStr];
        
        [scanner scanHexInt:&anInt];
        NSData *entity = [[NSData alloc] initWithBytes:&anInt length:1];
        [hexData appendData:entity];
        
        range.location += range.length;
        range.length = 2;
    }
    return hexData;
}


+(NSString *)savescanresultimage:(UIImage *)resultimage imagename:(NSString *)strimagename
{
    NSData *imageData = UIImagePNGRepresentation(resultimage);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:strimagename]; //Add the file name
    BOOL result = [imageData writeToFile:filePath atomically:YES];
    if (result) {
        NSLog(@"success");
    }else {
        NSLog(@"no success");
    }
    return filePath;
}

+(UIImage *)newimageFramOldimage:(UIImage *)oldimage
{
    NSData *originalPicFileData = UIImageJPEGRepresentation(oldimage, 1);
    
    NSLog(@"originalPicFileData==%f",originalPicFileData.length/1024.0/1024.0);
    
    if (originalPicFileData.length>512*1024) {
        
        if (originalPicFileData.length>5*1024*1024) {//5M以及以上
            
            originalPicFileData=UIImageJPEGRepresentation(oldimage, 0.2);
            
        }else if (originalPicFileData.length>2*1024*1024) {//5-2M
            
            originalPicFileData=UIImageJPEGRepresentation(oldimage, 0.3);
            
        }else if (originalPicFileData.length>1024*1024) {//2-1M
            
            originalPicFileData=UIImageJPEGRepresentation(oldimage, 0.4);
            
        }else {
            
            originalPicFileData=UIImageJPEGRepresentation(oldimage, 0.5);
            
        }
        
    }
    UIImage *resultImage = [UIImage imageWithData:originalPicFileData];

    return resultImage;
    
}
@end
