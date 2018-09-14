//
//  DateToTimeAgo.m
//  消汇邦
//
//  Created by bang on 2018/3/29.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import "DateToTimeAgo.h"

@implementation DateToTimeAgo
+ (NSString *)friendTime:(NSString *)time{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSTimeInterval temp = [[NSDate date]timeIntervalSinceDate:[dateFormatter dateFromString:time]];
    int days = ((int)temp)/(3600*24);
    
    //    if (days >= 7) {
    //        return [time timeString];
    //    }
    
    if (days >= 1) {
        return [NSString stringWithFormat:@"%d天前",days];
    }
    
    
    int hours = ((int)temp)%(3600*24)/3600;
    
    if (hours >= 1) {
        return [NSString stringWithFormat:@"%d小时前",hours];
    }
    
    int minutes = ((int)temp)%(3600*24)%3600/60;
    
    if (minutes >= 1) {
        return [NSString stringWithFormat:@"%d分钟前",minutes];
    }
    
    int seconds = ((int)temp)%(3600*24)%3600%60;
    
    if (seconds >= 1) {
        return [NSString stringWithFormat:@"%d秒钟前",seconds];
    }
    
    return time;
    
}
@end
