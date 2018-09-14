//
//  CAShapeLayer+ViewDottedLine.m
//  消汇邦
//
//  Created by 谭显敬  on 2018/4/9.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import "CAShapeLayer+ViewDottedLine.h"

@implementation CAShapeLayer (ViewDottedLine)
+(CAShapeLayer *)CAShapeLayerWithCGRect:(CGRect)rect lineDashPattern:(NSArray *)lineDashPattern lineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor{
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.bounds = rect;
    borderLayer.path = [UIBezierPath bezierPathWithRect:borderLayer.bounds].CGPath;
    borderLayer.frame = rect;
    borderLayer.lineWidth = lineWidth;
    //虚线边框
    borderLayer.lineDashPattern = lineDashPattern;
    //实线边框
    //    borderLayer.lineDashPattern = nil;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    borderLayer.strokeColor = strokeColor.CGColor;
    return borderLayer;
}
@end
