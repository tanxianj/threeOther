//
//  UIView+Shadow.h
//  消汇邦
//
//  Created by 谭显敬 on 2018/4/26.
//  Copyright © 2018年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shadow)

/**
 返回一个带阴影的View

 @return UIView
 */
+ (UIView *)backShadowView;

/**
 给视图设置阴影
 */
-(void)setShadow;

//判断一个view是否显示在根窗口上
- (BOOL)isShowingOnKeyWindow;

@end
