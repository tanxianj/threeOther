//
//  UIviewLs.h
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIviewLs : UIView
@property(nonatomic,strong)UIView *view;
@property(nonatomic,assign)CGFloat widths;
@property(nonatomic,assign)CGFloat heights;
@property(nonatomic,assign)UIColor *colors;
+(NSInteger)markCalculate:(void (^)(UIviewLs * make))block;
-(UIviewLs *)alloc;
-(UIviewLs *(^)(CGFloat))width;
-(UIviewLs *(^)(CGFloat))height;
-(UIviewLs *(^)(UIColor *))color;
@end
