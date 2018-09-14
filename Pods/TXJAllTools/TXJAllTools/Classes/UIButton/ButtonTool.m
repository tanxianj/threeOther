//
//  ButtonTool.m
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "ButtonTool.h"

@implementation ButtonTool
+(CAGradientLayer *)colorArray:(NSArray <UIColor*> *)colorArray directionType:(TXJDirectionType) directionType locations:(NSArray <NSNumber *> *)locations buttonSize:(CGSize )buttonsize{
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colorArray;
    gradientLayer.locations = locations;
    CGRect bounds = {CGPointZero,buttonsize};
    gradientLayer.frame = bounds;
    switch (directionType) {
        case TXJDirectionTypeLeft2Right:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1, 0);
            break;
        case TXJDirectionTypeTop2Bottom:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(0, 1);
            break;
            
        default:
            break;
    }
    return gradientLayer;
}

+(UIImage*) buttonImageFromColors:(NSArray*)colors buttonCGSize:(CGSize )buttoncgsize ByGradientType:(TXJDirectionType)gradientType{
    NSMutableArray *ar = [NSMutableArray array];
    for(UIColor *c in colors) {
        [ar addObject:(id)c.CGColor];
    }
    UIGraphicsBeginImageContextWithOptions(buttoncgsize, YES, 1);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    CGColorSpaceRef colorSpace = CGColorGetColorSpace([[colors lastObject] CGColor]);
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)ar, NULL);
    CGPoint start;
    CGPoint end;
    switch (gradientType) {
            
        case TXJDirectionTypeLeft2Right:{
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(buttoncgsize.width, 0.0);
        }
            break;
        case TXJDirectionTypeTop2Bottom:{
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(0.0, buttoncgsize.height);
        }
            break;
        default:
            start = CGPointMake(0.0, 0.0);
            end = CGPointMake(buttoncgsize.width, 0.0);
            break;
            
            
    }
    CGContextDrawLinearGradient(context, gradient, start, end, kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    CGGradientRelease(gradient);
    CGContextRestoreGState(context);
    CGColorSpaceRelease(colorSpace);
    UIGraphicsEndImageContext();
    return image;
}

@end
