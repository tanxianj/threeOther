//
//  CAShapeLayer+ViewDottedLine.h
//  消汇邦
//
//  Created by 谭显敬 on 2018/4/9.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CAShapeLayer (ViewDottedLine)

/**
 视图虚线边框

 @param rect 视图的大小
 @param lineDashPattern 虚线间隔
 @param lineWidth 虚线的宽度
 @param strokeColor 虚线的颜色
 @return 虚线
 */
+(CAShapeLayer *)CAShapeLayerWithCGRect:(CGRect)rect lineDashPattern:(NSArray *)lineDashPattern lineWidth:(CGFloat)lineWidth strokeColor:(UIColor *)strokeColor;
@end
