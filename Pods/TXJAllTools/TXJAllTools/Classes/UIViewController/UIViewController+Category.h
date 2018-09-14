//
//  UIViewController+Category.h
//  消汇邦
//
//  Created by 罗建 on 2017/2/24.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Category)

/**
 获取当前屏幕显示的viewcontroller

 @return 当前屏幕显示的viewcontroller
 */
+ (UIViewController *)getCurrentVC;
+ (UIViewController *)old_getCurrentVC;

@end
