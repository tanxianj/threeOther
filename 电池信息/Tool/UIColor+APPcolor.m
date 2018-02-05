//
//  UIColor+APPcolor.m
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UIColor+APPcolor.h"

@implementation UIColor (APPcolor)
+(UIColor *)AppGrayColor{
    return [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
}
+ (UIColor *)appBlackSubColor{
    return [UIColor colorWithRed:102/255.0 green:103/255.0 blue:105/255.0 alpha:1.0/1.0];
}
+ (UIColor *)appBlackColor{
    return [UIColor colorWithRed: 43/255.0 green: 44/255.0 blue: 46/255.0 alpha:1.0/1.0];
}
+ (UIColor *)appLineColor{
    return [UIColor colorWithRed:238/255.0 green:239/255.0 blue:241/255.0 alpha:1.0/1.0];
}
@end
