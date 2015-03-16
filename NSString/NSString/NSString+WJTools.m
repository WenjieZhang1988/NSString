//
//  NSString+WJTools.m
//  Kevin
//
//  Created by Kevin on 13/1/14.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import "NSString+WJTools.h"

@implementation NSString (WJTools)

- (NSString *)cacheDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)documentDir {
    NSString *dir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (NSString *)tmpDir {
    NSString *dir = NSTemporaryDirectory();
    return [dir stringByAppendingPathComponent:[self lastPathComponent]];
}

- (BOOL)isPhoneNumber
{
    if (self.length < 1)
        return NO;
    NSString * pattern = @"^1[34578]\\d{9}$";
    NSRegularExpression * regex = [[NSRegularExpression alloc] initWithPattern:pattern options:0 error:nil];
    NSArray * results = [regex matchesInString:self options:0 range:NSMakeRange(0, self.length)];
    return results.count == 1 ? YES : NO;
}

+ (NSString *)JSONStringWithDictionary : (NSDictionary *)dict
{
    /** 转换参数格式 */
    NSData * tempData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
    NSString * tempString = [[NSString alloc] initWithData:tempData encoding:NSUTF8StringEncoding];
    return tempString ? tempString : @"";
}

- (NSDictionary *)getDateDictionary
{
    NSMutableDictionary *yearDic = [NSMutableDictionary dictionary];
    if ([self rangeOfString:@"年"].location != NSNotFound && [self rangeOfString:@"月"].location != NSNotFound && [self rangeOfString:@"日"].location != NSNotFound) {
        
        NSArray *arryear =   [self componentsSeparatedByString:@"年"];
        [yearDic setValue:[NSString stringWithFormat:@"%@",arryear[0]] forKey:@"year"];  // 年
        
        NSArray *arrmonth =   [arryear[1] componentsSeparatedByString:@"月"];
        [yearDic setValue:[NSString stringWithFormat:@"%@",arrmonth[0]] forKey:@"month"];  // 月
        
        NSArray *arrday =   [arrmonth[1] componentsSeparatedByString:@"日"];
        [yearDic setValue:[NSString stringWithFormat:@"%@",arrday[0]] forKey:@"day"];     // 日
    }else if ([self rangeOfString:@"时"].location != NSNotFound &&[self rangeOfString:@"分"].location != NSNotFound) {
        NSArray *arrHour =   [self componentsSeparatedByString:@"时"];
        [yearDic setValue:[NSString stringWithFormat:@"%@",arrHour[0]] forKey:@"hour"];  // 时
        
        NSArray *arrminute=   [arrHour[1] componentsSeparatedByString:@"分"];
        [yearDic setValue:[NSString stringWithFormat:@"%@",arrminute[0]] forKey:@"minute"];  // 分
    }
    return yearDic;
}

- (NSString *)formatDateStringWithSeparateStr : (NSString *)separate
{
    NSDictionary *dateDic = [self getDateDictionary];
    NSString *dateStr = [NSString stringWithFormat:@"%@%@%@%@%@",dateDic[@"year"],separate,dateDic[@"month"],separate,dateDic[@"day"]];
    return dateStr;
}

- (NSString *)nomalFormatDateStringWithSeparateStr : (NSString *)separate
{
    NSArray * tempArray = [self componentsSeparatedByString:separate];
    if (tempArray.count < 3)
        return @"1988年09月22日";
    NSString * newDate = [NSString stringWithFormat:@"%@年%@月%@日",tempArray[0],tempArray[1],tempArray[2]];
    return newDate;
}

- (BOOL)isNewerVersionThan:(NSString*)otherVersion
{
    return ([self compare:otherVersion options:NSNumericSearch] == NSOrderedAscending);
}

@end
