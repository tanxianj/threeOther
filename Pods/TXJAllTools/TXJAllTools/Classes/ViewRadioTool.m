//
//  RadioTool.m
//  第三方相关
//
//  Created by bang on 2018/1/31.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "ViewRadioTool.h"

@implementation ViewRadioTool
+(void)ViewRadioWith:(UIView *)viewmodel radio:(CGFloat)radiosize RectCornerType:(UIRectCorner)UIRectCornerTopLeft{
    /*
    UIRectCorner corner = UIRectCornerTopLeft;//这只圆角位置
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:viewmodel.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radiosize, radiosize)];
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
//    masklayer.frame = viewmodel.bounds;
    masklayer.path = path.CGPath;//设置路径
    viewmodel.layer.mask = masklayer;
     */
    
}
+(void)ViewRadioWith:(UIView *)viewmodel addRoundedCorners:(UIRectCorner)corners
                withRadii:(CGFloat)radii {
    
    UIBezierPath* rounded = [UIBezierPath bezierPathWithRoundedRect:viewmodel.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer* shape = [[CAShapeLayer alloc] init];
    [shape setPath:rounded.CGPath];
    
    viewmodel.layer.mask = shape;
}
@end
