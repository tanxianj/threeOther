//
//  UILabel+NewLab.m
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UILabel+NewLab.h"

@implementation UILabel (NewLab)
+(UILabel *)LableInitWith:(NSString *)titlestr LabFontSize:(CGFloat)size textColor:(UIColor*) textcolor textAlignment:(NSTextAlignment)textAlignment{
    UILabel *lab = [UILabel new];
    lab.text = titlestr;
    lab.textColor = textcolor;
    lab.font = [UIFont systemFontOfSize:size];
    lab.textAlignment = textAlignment;
    return lab;
}

@end
