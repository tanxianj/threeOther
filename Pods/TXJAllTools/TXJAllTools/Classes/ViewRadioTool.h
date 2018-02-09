//
//  RadioTool.h
//  第三方相关
//
//  Created by bang on 2018/1/31.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ViewRadioTool : UIView

/**
 设置某个视图的部分圆角

 @param viewmodel 要设置的视图
 @param radiosize 圆角大小
 @param UIRectCornerTopLeft 需要设置圆角的角
 */
+(void)ViewRadioWith:(UIView *)viewmodel radio:(CGFloat)radiosize RectCornerType:(UIRectCorner)UIRectCornerTopLeft;
+(void)ViewRadioWith:(UIView *)viewmodel addRoundedCorners:(UIRectCorner)corners
           withRadii:(CGFloat)radii;
@end
