//
//  UIButton+button.m
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UIButton+button.h"

@implementation UIButton (button)
+(UIButton *)buttonWithTitle:(NSString *)buttontitle buttonTitleFontSize:(CGFloat)buttonfontsize buttonTitleColor:(UIColor *)buttontitlecolor buttonBgColor:(UIColor *)buttonBgColor buttonTextAlignment:(NSTextAlignment )buttontextAlignment{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:buttontitle forState:UIControlStateNormal];
    [btn setBackgroundColor:buttonBgColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:buttonfontsize];
    [btn setTitleColor:buttontitlecolor forState:UIControlStateNormal];
    return btn;
}
-(void)buttonGradient:(NSArray *)colors buttonCGSize:(CGSize)buttonsize ByGradientType:(TXJDirectionType)gradientType cornerRadius:(BOOL)cornerRadius{
    
    [self setBackgroundImage:[ButtonTool buttonImageFromColors:colors buttonCGSize:buttonsize ByGradientType:gradientType] forState:UIControlStateNormal];
    self.layer.cornerRadius = buttonsize.height/2;
    self.layer.masksToBounds = cornerRadius;
}
@end
