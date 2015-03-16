//
//  NSString+WJTools.h
//  Kevin
//
//  Created by Kevin on 13/1/14.
//  Copyright (c) 2013年 Kevin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WJTools)

/**
 *  返回缓存路径的完整路径名
 */
- (NSString *)cacheDir;
/**
 *  返回文档路径的完整路径名
 */
- (NSString *)documentDir;
/**
 *  返回临时路径的完整路径名
 */
- (NSString *)tmpDir;
/**
 *  将字典数据转换为JSON参数格式的NSString类型
 *
 *  @param dict 字典
 *
 *  @return 转换好的字符串
 */
+ (NSString *)JSONStringWithDictionary : (NSDictionary *)dict;
/**
 *  将年月日格式的日期字符串转换为字典
 *
 *  @return 转换好的字典
 */
- (NSDictionary *)getDateDictionary;
/**
 *  将年月日格式的日期字符串转换为自定义分隔符格式的日期
 *
 *  @param separate 自定义分隔符
 *
 *  @return 转换好的字符串
 */
- (NSString *)formatDateStringWithSeparateStr:(NSString *)separate;
/**
 *  将自定义格式日期字符串转换为年月日标准格式日期
 *
 *  @param separate 自定义分隔符
 *
 *  @return 转换好的字符串
 */
- (NSString *)nomalFormatDateStringWithSeparateStr:(NSString *)separate;
/**
 *  判断字符串是否是中国国内手机号 (粗略判断)
 *
 *  @return 是/不是
 */
- (BOOL)isPhoneNumber;
/**
 *  判断字符串内的版本号是否比原来的新
 *
 *  @param otherVersion 需要比较的版本号
 *
 *  @return 是/不是
 */
- (BOOL)isNewerVersionThan:(NSString*)otherVersion;

@end
