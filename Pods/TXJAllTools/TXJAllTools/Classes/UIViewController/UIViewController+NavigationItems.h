//
//  UIViewController+NavigationItems.h
//  消汇邦
//
//  Created by 罗建 on 2017/1/4.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Button.h"

@interface UIViewController (NavigationItems)

- (void) barButtonItemAction:(Button *)button;

- (UIBarButtonItem *)setupNavigationItemWithLeft:(BOOL) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                        callBack:(ButtonBlock)buttonBlock;

- (UIBarButtonItem *)setupNavigationItemWithLeft:(BOOL) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                      titleColor:(UIColor *)titleColor
                                        callBack:(ButtonBlock)buttonBlock;
@end
