//
//  Calculate.m
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "Calculate.h"

@implementation Calculate
-(instancetype)init{
    if (self = [super init]) {
        self.result = 0;
    }
    return self;
}



-(Calculate *)clear{
    self.result = 0;
    return self;
}
-(Calculate *)printResult
{
    XJLog(@"计算结果:%ld\n",self.result);
    return self;
}

-(Calculate *(^)(NSInteger))add
{
    return ^(NSInteger i){
        self.result += i;
        return self;
    };
}
-(Calculate *(^)(NSInteger))sub{
    return ^(NSInteger i){
        self.result -= i;
        return self;
    };
}
-(Calculate *(^)(NSInteger))by{
    return ^(NSInteger i){
        self.result *=i;
        return self;
    };
}
+(void)markCalculate:(void (^)(Calculate *make))block
{
    //创建管理计算者
    Calculate *cal = [[Calculate alloc]init];
    //给参数赋值
    block(cal);
//    return cal.result;
}

@end
