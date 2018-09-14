//
//  UIView+Shadow.m
//  消汇邦
//
//  Created by 谭显敬 on 2018/4/26.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import "UIView+Shadow.h"

@implementation UIView (Shadow)
+ (UIView *)backShadowView{
    UIView *view =[UIView  new];
    view.backgroundColor = [UIColor whiteColor];
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    view.layer.shadowOpacity = 0.05f;
    view.layer.shadowRadius = 4.f;
    view.layer.shadowOffset = CGSizeMake(0,0);
    return view;
}
-(void)setShadow{
    self.backgroundColor = UIColor.whiteColor;
    self.layer.shadowColor = UIColor.blackColor.CGColor;
    self.layer.shadowOpacity = 0.1f;
    self.layer.shadowRadius = 4.f;
    self.layer.shadowOffset = CGSizeMake(0,0);
    self.layer.cornerRadius = 2;
//    self.layer.masksToBounds = YES;
//    return view;
}

- (BOOL)isShowingOnKeyWindow {
    
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    // 把这个view在它的父控件中的frame(即默认的frame)转换成在window的frame
    CGRect convertFrame = [self.superview convertRect:self.frame toView: keyWindow];
    CGRect windowBounds = keyWindow.bounds;
    // 判断这个控件是否在主窗口上（即该控件和keyWindow有没有交叉）
    BOOL isOnWindow = CGRectIntersectsRect(convertFrame, windowBounds);
    // 再判断这个控件是否真正显示在窗口范围内（是否在窗口上，是否为隐藏，是否透明）
    BOOL isShowingOnWindow = (self.window == keyWindow) && !self.isHidden && (self.alpha > 0.01) && isOnWindow;
    return isShowingOnWindow;
}


@end
