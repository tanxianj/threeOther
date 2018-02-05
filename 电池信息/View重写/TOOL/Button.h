//
//  UIButton.h
//  第三方相关
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ButtnBlock) (void);
@interface Button : UIButton
@property(nonatomic,copy) ButtnBlock buttonblock;
@end
