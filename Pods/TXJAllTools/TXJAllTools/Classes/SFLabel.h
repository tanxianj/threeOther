//
//  SFLabel.h
//  test
//
//  Created by Mac on 2018/1/31.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFLabel : UILabel
// 用来决定上下左右内边距，可以提供一个接口供外部修改
@property (assign, nonatomic) UIEdgeInsets edgeInsets;
@end
