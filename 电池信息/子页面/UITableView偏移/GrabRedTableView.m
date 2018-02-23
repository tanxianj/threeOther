//
//  GrabRedTableView.m
//  第三方相关
//
//  Created by bang on 2018/2/9.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "GrabRedTableView.h"
#import "UIView+LSCore.h"

@implementation GrabRedTableView

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

- (void)layoutSubviews{
    [super layoutSubviews];
    
    //解决顶部圆角问题
    [self addRoundedCorners:UIRectCornerTopLeft|UIRectCornerTopRight withRadii:CGSizeMake(30, 30) viewRect:self.bounds];
    
}

@end
