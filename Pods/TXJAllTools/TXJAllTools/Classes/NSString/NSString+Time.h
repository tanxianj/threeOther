//
//  NSString+Time.h
//  UNLIFE
//
//  Created by 谭显敬 on 2018/8/1.
//  Copyright © 2018年 wonhigh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (TimeString)

/**
 得到当前时间--时间戳

 @return  时间戳
 */
+(NSString *)getNowTimeTimestamp;

/**
 字符串截取 YY-MM-DD

 @return YY-MM-DD
 */
- (NSString *)timeStringWithYYMMDD;
/**
 格式化时间
 
 @return MM-dd hh:mm
 */
- (NSString *)timeString;

/**
 时间戳转yyyy-MM-dd HH:mm:ss

 @return yyyy-MM-dd HH:mm:ss
 */
-(NSString *)timeStampToString;
- (NSString *)convertToChineseTime;

/**
 MM-DD weak

 @return .
 */
-(NSString *)timeToMMDDweak;

/**
 HHmmss

 @return .
 */
-(NSString *)timeToHHmmss;

/**
 加上人民币符号

 @return 加上人民币符号
 */
- (NSString *)convertToPriceString;

/**
 字符串加上行高 -- 可自由设置文字方向

 @param lineHeight 行高
 @param fontSize 字体
 @param alignment 字体显示方向
 @return 字符串
 */
- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize textAlignment:(NSTextAlignment)alignment;

/**
  字符串加上行高 --默认NSTextAlignmentLeft

 @param lineHeight 行高
 @param fontSize 字体
 @return  字符串加上行高
 */
- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize;

/**
 文字行高 文字大小默认为行高 -5

 @param lineHeight 行高
 @return 文字行高
 */
- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight;

- (NSString *)stringByTrimmingAllWhiteCharacter;

/**
 得到当前年月 YY-MM

 @return 年月
 */
+(NSString*)getCurrentYearAndMonth;
/**
 得到当前时间 YY-MM-dd

 @return YY-MM-dd
 */
+(NSString*)getCurrentTimes;
//将字符串转成NSDate类型
+(NSDate *)dateFromString:(NSString *)dateString ;


/**
传入某天的时间，返回未来几天的时间 正数=未来 负数=之前
 @param daystr 当前时间字符串
 @param daynumber 需要返回未来的几天 正数=未来 负数=之前
 @return 未来几天的日期
 */
+(NSMutableArray *)GetToFutureDay:(NSString *)daystr day:(NSInteger)daynumber;

/**
 传入时间YY-MM-DD得到 时间的星期几

 @param dayStr 时间字符串
 @return 星期
 */
+(NSString*)Getweek:(NSString *)dayStr;
/*
 
 * 需要传入的时间格式 2017-06-14 14:18:54
 
 */
// 和当前时间进行比较  输出字符串为（刚刚几个小时前 几天前 ）

+(NSString *)inputTimeStr:(NSString *)timeStr;

//把时间字符串转换成NSDate

+ (NSDate *)becomeDateStr:(NSString *)dateStr;
//把时间转换成星期

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate;
//判断是否为昨天

+ (BOOL)isYesterdayWithDate:(NSDate *)newDate;
//判断今天是本周的第几天

+ (int)getNowDateWeek;
@end
