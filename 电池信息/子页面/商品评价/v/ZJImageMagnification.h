//
//  ZJImageMagnification.h
//  
//
//  Created by bang on 2018/1/25.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZJImageMagnification : NSObject

/**
 *  浏览大图
 *
 *  @param currentImageview 当前图片
 *  @param alpha            背景透明度
 */
+(void)scanBigImageWithImageView:(UIImageView *)currentImageview alpha:(CGFloat)alpha;

+(void)scanBigImageWithImageViewArray:(NSArray *)imgArray indexImage:(NSInteger )integer alpha:(CGFloat)alpha;
@end
