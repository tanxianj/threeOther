//
//  Calculate.h
//  第三方相关
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculate : NSObject
@property(nonatomic,assign)NSInteger result;//计算结果
+(void)markCalculate:(void (^)(Calculate *make))block;
-(Calculate *)clear;//清零

-(Calculate *)printResult;//打印结果

-(Calculate * (^)(NSInteger))add;//在结果上加

-(Calculate *(^)(NSInteger))sub;//在结果上减
-(Calculate *(^)(NSInteger))by;//在结果上乘
@end
