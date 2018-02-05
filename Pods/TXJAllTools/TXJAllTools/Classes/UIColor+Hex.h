//
//  UIColor+Hex.h
//  消汇邦
//
//  Created by 罗建 on 2017/3/17.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithRGBHex:(UInt32)hex;


/**
 HEX

 @param stringToConvert 0x000000
 @return UIColor 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;


/**
 传入#AABBCC

 @param stringToConvert 0xFFFFFF
 @param alpha 0-1
 @return UIColor 颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert andAlpha:(CGFloat)alpha;





@end
