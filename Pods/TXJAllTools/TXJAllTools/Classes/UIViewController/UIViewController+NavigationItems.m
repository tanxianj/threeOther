//
//  UIViewController+NavigationItems.m
//  消汇邦
//
//  Created by 罗建 on 2017/1/4.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "UIViewController+NavigationItems.h"
//#import "ReactiveObjC.h"

@implementation UIViewController (NavigationItems)

- (UIBarButtonItem *)setupNavigationItemWithLeft:(BOOL)leftOrRight imageName:(NSString *)imageName title:(NSString *)title callBack:(ButtonBlock)buttonBlock{
    return [self setupNavigationItemWithLeft:leftOrRight imageName:imageName title:title titleColor:[UIColor blackColor] callBack:buttonBlock];
}

- (UIBarButtonItem *)setupNavigationItemWithLeft:(BOOL) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                      titleColor:(UIColor *)titleColor
                                        callBack:(ButtonBlock)buttonBlock {
    
    if ([imageName isEqualToString:@"return"]) {
        imageName = @"icon_nav_back";
    }
    

    Button *button = [Button buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 64, 44);
    if (title && [title isKindOfClass:[NSString class]]) {
        [button setTitle:title
                forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:titleColor
                     forState:UIControlStateNormal];
        if (leftOrRight) {
//            button.frame = CGRectMake(0, 0, 60, 44);
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
            }
        }
        else {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);

            }
        }
    }
    if (imageName && [imageName isKindOfClass:[NSString class]]) {
        [button setImage:[UIImage imageNamed:imageName]
                forState:UIControlStateNormal];
        if (leftOrRight) {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
            }
        }
        else {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
            }
        }
    }
    if (buttonBlock) {
        button.buttonBlock = buttonBlock;
    }
    [button addTarget:self
               action:@selector(barButtonItemAction:)
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];

    return item;
}

- (void) barButtonItemAction:(Button *)button {
    if (button.buttonBlock) {
        button.buttonBlock();
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
