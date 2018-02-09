//
//  ZMJProgressHUD.h
//  YXLM
//
//  Created by zhengminjie on 16/5/4.
//  Copyright © 2016年 zhengminjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJProgressHUD : UIView

+ (void)showAlertWithString:(NSString *)string;

- (void)startActive;
- (void)stopActive;


@end
