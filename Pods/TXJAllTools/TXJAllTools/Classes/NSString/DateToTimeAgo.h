//
//  DateToTimeAgo.h
//  消汇邦
//
//  Created by bang on 2018/3/29.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateToTimeAgo : NSObject

/**
 返回传入时间与当前时间的差距 即多久之前 yyyy-MM-dd HH:mm:ss

 @param time 需要对比的时间字符串
 @return 多久之前
 */
+ (NSString *)friendTime:(NSString *)time;
@end
