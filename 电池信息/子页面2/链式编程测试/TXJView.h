//
//  TXJView.h
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TXJView : UIView
- (TXJView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))setFrame;
- (TXJView *(^)(UIColor *))bgcolor;
+(TXJView *)markCalculate:(void (^)(TXJView * make))block;
@end
