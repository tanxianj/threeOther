//
//  RadioTool.m
//  第三方相关
//
//  Created by bang on 2018/1/31.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "ViewRadioTool.h"

@implementation ViewRadioTool
+(void)ViewRadioWith:(UIView *)viewmodel RadioViewWithBouns:(CGRect)rect radio:(CGFloat)radiosize RectCornerType:(UIRectCorner)UIRectCornerTopLeft{
    UIRectCorner corner = UIRectCornerTopLeft;//这只圆角位置
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:CGSizeMake(radiosize, radiosize)];
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
    masklayer.frame = rect;
    masklayer.path = path.CGPath;//设置路径
    viewmodel.layer.mask = masklayer;
}

@end
