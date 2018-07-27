//
//  TXJView.m
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "TXJView.h"

@implementation TXJView
- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(TXJView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))setFrame{
    return ^(CGFloat x, CGFloat y, CGFloat w, CGFloat h){
        self.frame = CGRectMake(x, y, w, h);//block执行一些功能
        return self;//block执行完毕的返回值
    };
}
-(TXJView *(^)(UIColor *))bgcolor{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}
+(TXJView *)markCalculate:(void (^)(TXJView * make))block{
    TXJView *view = [[TXJView alloc]init];
    block(view);
    return view;
}
@end
