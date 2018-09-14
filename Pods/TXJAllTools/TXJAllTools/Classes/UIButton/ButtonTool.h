//
//  ButtonTool.h
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, TXJDirectionType) {
    TXJDirectionTypeLeft2Right,
    TXJDirectionTypeTop2Bottom
};
@interface ButtonTool : NSObject

+(CAGradientLayer *)colorArray:(NSArray <UIColor*> *)colorArray directionType:(TXJDirectionType) directionType locations:(NSArray <NSNumber *> *)locations buttonSize:(CGSize )buttonsize;

/**
 设置背景颜色
 colors 颜色数组
 buttoncgsize UIButton的大小
 gradientType 渐变方向
 返回绘制好的img
 @param colors 颜色数组
 @param buttoncgsize UIButton的大小
 @param gradientType 渐变方向
 @return 返回绘制好的img
 */
+(UIImage*) buttonImageFromColors:(NSArray*)colors buttonCGSize:(CGSize )buttoncgsize ByGradientType:(TXJDirectionType)gradientType;


@end
