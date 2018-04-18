//
//  UIviewLs.m
//  第三方相关
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UIviewLs.h"

@implementation UIviewLs
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self alloc];
    }
    return self;
}
-(UIviewLs *(^)(CGFloat))width{
    __weak typeof(self) weakself = self;
    return ^(CGFloat fl){
        weakself.widths = fl;
        return self;
    };
}
-(UIviewLs *(^)(CGFloat))height{
    __weak typeof(self) weakself = self;
    return ^(CGFloat fl){
        weakself.heights = fl;
        return self;
    };
}
-(UIviewLs *(^)(UIColor *))color{
    __weak typeof(self) weakself = self;
    return ^(UIColor *color){
        weakself.colors = color;
        return self;
    };
}
-(UIviewLs *)alloc{
    self.view = [UIView new];
    self.view.frame = CGRectMake(0, 0, self.widths, self.heights);
    self.view.backgroundColor = self.colors;
    return self.view;
}
+(NSInteger)markCalculate:(void (^)(UIviewLs * make))block{
    UIviewLs *view = [[UIviewLs alloc]init];
    block(view);
    return view.alloc;
}
@end
