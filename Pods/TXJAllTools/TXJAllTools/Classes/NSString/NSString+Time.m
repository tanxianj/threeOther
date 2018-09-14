//
//  NSString+Time.m
//  UNLIFE
//
//  Created by 谭显敬 on 2018/8/1.
//  Copyright © 2018年 wonhigh. All rights reserved.
//

#import "NSString+Time.h"

@implementation NSString (Time)
+(NSString *)getNowTimeTimestamp{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    
    [formatter setTimeZone:timeZone];
    
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    
    return timeSp;
}
-(NSString *)timeToMMDDweak{
    NSString *timeStampString  = [NSString stringWithFormat:@"%@",self];
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd"];
    NSString *dateString       = [formatter stringFromDate: date];
    
    return dateString;
}
-(NSString *)timeToHHmmss{
    NSString *timeStampString  = [NSString stringWithFormat:@"%@",self];
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
-(NSString *)timeStampToString{
    NSString *timeStampString  = [NSString stringWithFormat:@"%@",self];
    // iOS 生成的时间戳是10位
    NSTimeInterval interval    =[timeStampString doubleValue] / 1000.0;
    NSDate *date               = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString       = [formatter stringFromDate: date];
    return dateString;
}
- (NSString *)timeStringWithYYMMDD{
    if (self.length >= 16) {
        return [self substringWithRange:NSMakeRange(5, 11)];
    }
    return self;
}
- (NSString *)timeString{
    if (self.length >= 16) {
        return [self substringWithRange:NSMakeRange(5, 11)];
    }
    return self;
}

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight{
    return [self addLineHeight:lineHeight withFont:lineHeight - 5];
}

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize textAlignment:(NSTextAlignment)alignment{
    if (self.length == 0) {
        return nil;
    }else{
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.minimumLineHeight = lineHeight;
        style.alignment = alignment;
        NSDictionary *attributes = @{NSParagraphStyleAttributeName:style,NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
        return [[NSAttributedString alloc]initWithString:self attributes:attributes];
    }
}

- (NSAttributedString *)addLineHeight:(CGFloat)lineHeight withFont:(CGFloat)fontSize{
    return [self addLineHeight:lineHeight withFont:fontSize textAlignment:NSTextAlignmentLeft];
}

- (NSString *)convertToChineseTime{
    NSArray *temp = [self componentsSeparatedByString:@" "];
    if (temp.count >= 1) {
        NSString *tempString = temp.firstObject;
        NSArray *tempArr = [tempString componentsSeparatedByString:@"-"];
        if (tempArr.count >= 3) {
            return [NSString stringWithFormat:@"%@年%@月%@日",tempArr[0],tempArr[1],tempArr[2]];
        }else{
            return tempString;
        }
    }else{
        return self;
    }
}

- (NSString *)convertToPriceString{
    
    return [NSString stringWithFormat:@"¥%@",self];
}

- (NSString *)stringByTrimmingAllWhiteCharacter{
    NSArray* words = [self componentsSeparatedByCharactersInSet :[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString* nospacestring = [words componentsJoinedByString:@""];
    return nospacestring;
}
//获取当前的时间

+(NSString*)getCurrentYearAndMonth{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY-MM"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    
    return currentTimeString;
    
}
//获取当前的时间
+(NSString*)getCurrentTimes{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    [formatter setDateFormat:@"YYYY-MM-dd"];
    
    //现在时间,你可以输出来看下是什么格式
    
    NSDate *datenow = [NSDate date];
    
    //----------将nsdate按formatter格式转成nsstring
    
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    
    
    return currentTimeString;
    
}
//将字符串转成NSDate类型
+(NSDate *)dateFromString:(NSString *)dateString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];
    return destDate;
}
//传入今天的时间，返回未来几天的时间
+(NSMutableArray *)GetToFutureDay:(NSString *)daystr day:(NSInteger)daynumber{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorian components:NSCalendarUnitWeekday | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay fromDate:[NSString dateFromString:daystr]];
    NSMutableArray *dayArray = [NSMutableArray array];
    NSUInteger Udaynumber  = labs(daynumber);
    
    for (int i = 1 ; i<=Udaynumber; i++) {
        if (daynumber >0) {
            [components setDay:([components day]+1)];
        }else{
            [components setDay:([components day]-1)];
        }
        [components setWeekday:[components day]];
        
        NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
        NSDateFormatter *dateday = [[NSDateFormatter alloc] init];
        [dateday setDateFormat:@"yyyy-MM-dd"];
        NSDictionary  *dic = @{@"day":[dateday stringFromDate:beginningOfWeek],
                               @"week":[NSString Getweek:[dateday stringFromDate:beginningOfWeek]]
                               };
        [dayArray addObject:dic];
    }
    return dayArray;
}
+(NSString*)Getweek:(NSString *)dayStr{
    NSCalendar*calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents*comps = [[NSDateComponents alloc]init];
    
    NSInteger unitFlags =NSCalendarUnitWeekday;
    
    comps = [calendar components:unitFlags fromDate:[NSString dateFromString:dayStr]];
    NSString *week;
    switch ([comps weekday]) {
        case 1:
            week = @"星期日";
            break;
        case 2:
            week = @"星期一";
            break;
        case 3:
            week = @"星期二";
            break;
        case 4:
            week = @"星期三";
            break;
        case 5:
            week = @"星期四";
            break;
        case 6:
            week = @"星期五";
            break;
        case 7:
            week = @"星期六";
            break;
        default:
            break;
    }
    return week;
}
/*
 
 * 需要传入的时间格式 2017-06-14 14:18:54
 
 */


// 和当前时间进行比较  输出字符串为（刚刚几个小时前 几天前 ）

+(NSString *)inputTimeStr:(NSString *)str

{//把字符串转为NSdate
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *timeDate = [dateFormatter dateFromString:str];
    NSDate *currentDate = [NSDate date];
    NSTimeInterval timeInterval = [currentDate timeIntervalSinceDate:timeDate];
    long temp = 0;
    NSString *result;
    if (timeInterval/60 < 1)
    {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) <60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    else if((temp = temp/60) <24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    else if((temp = temp/24) <30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    else if((temp = temp/30) <12){
        result = [NSString stringWithFormat:@"%ld月前",temp];
    }
    else{
        temp = temp/12;
        result = [NSString stringWithFormat:@"%ld年前",temp];
    }
    return  result;}

//把时间字符串转换成NSDate

+ (NSDate *)becomeDateStr:(NSString *)dateStr

{
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    
    [formatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate *date1 = [formatter2 dateFromString:dateStr];
    
    return date1;
    
}

//把时间转换成星期

+ (NSString*)weekdayStringFromDate:(NSDate*)inputDate {
    
    
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    
    
    //    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"zh-Hans"];
    
    
    
    [calendar setTimeZone: timeZone];
    
    
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

//判断是否为昨天

+ (BOOL)isYesterdayWithDate:(NSDate *)newDate

{
    
    BOOL isYesterday = YES;
    
    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    
    //
    
    NSDate *yearsterDay =  [[NSDate alloc] initWithTimeIntervalSinceNow:-secondsPerDay];
    
    /** 前天判断
     
     //    NSDate *qianToday =  [[NSDate alloc] initWithTimeIntervalSinceNow:-2*secondsPerDay];
     
     //    NSDateComponents* comp3 = [calendar components:unitFlags fromDate:qianToday];
     
     //    if (comp1.year == comp3.year && comp1.month == comp3.month && comp1.day == comp3.day)
     
     //    {
     
     //        dateContent = @"前天";
     
     //    }
     
     **/
    
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    //    unsigned unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit |  NSDayCalendarUnit;
    
    NSDateComponents* comp1 = [calendar components:unitFlags fromDate:newDate];
    
    NSDateComponents* comp2 = [calendar components:unitFlags fromDate:yearsterDay];
    
    
    
    if ( comp1.year == comp2.year && comp1.month == comp2.month && comp1.day == comp2.day)
        
    {
        
        isYesterday = YES;
        
    }else
        
    {
        
        isYesterday = NO;
        
    }
    
    return isYesterday;
    
}

//判断今天是本周的第几天

+ (int)getNowDateWeek

{
    
    NSDate *nowDate = [NSDate date];
    
    NSString *nowWeekStr = [self weekdayStringFromDate:nowDate];
    
    int  factWeekDay = 0;
    
    
    
    if ([nowWeekStr isEqualToString:@"周日"])
        
    {
        
        factWeekDay = 7;
        
    }else if ([nowWeekStr isEqualToString:@"周一"])
        
    {
        
        factWeekDay = 1;
        
    }else if ([nowWeekStr isEqualToString:@"周二"])
        
    {
        
        factWeekDay = 2;
        
    }else if ([nowWeekStr isEqualToString:@"周三"])
        
    {
        
        factWeekDay = 3;
        
    }else if ([nowWeekStr isEqualToString:@"周四"])
        
    {
        
        factWeekDay = 4;
        
    }else if ([nowWeekStr isEqualToString:@"周五"])
        
    {
        
        factWeekDay = 5;
        
    }else if ([nowWeekStr isEqualToString:@"周六"])
        
    {
        
        factWeekDay = 6;
        
    }
    
    return  factWeekDay;
    
}
@end
