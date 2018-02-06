//
//  UIImage+Category.h
//  消汇邦
//
//  Created by 1244 on 2017/8/22.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, GradientType) {
    GradientFromTopToBottom = 1,            //从上到下
    GradientFromLeftToRight,                //从做到右
    GradientFromLeftTopToRightBottom,       //从上到下
    GradientFromLeftBottomToRightTop        //从上到下
};

@interface UIImage (Category)

/**
 生成二维码
 
 @param content 字符串
 @param width 正方形，只需要传长或宽
 @param padding 内边距
 @param red 0~255
 @param green 0~255
 @param blue 0~255
 @return Qrcode Image
 */
+ (UIImage *)qrCodeImageWithContent:(NSString *)content
                              width:(CGFloat)width
                            padding:(CGFloat)padding
                                red:(CGFloat)red
                              green:(CGFloat)green
                               blue:(CGFloat)blue;


/**
 *  根据给定的颜色，生成渐变色的图片
 *  @param imageSize        要生成的图片的大小
 *  @param colorArr         渐变颜色的数组
 *  @param percents          渐变颜色的占比数组
 *  @param gradientType     渐变色的类型
 */
+ (UIImage *)createImageWithSize:(CGSize)imageSize
                  gradientColors:(NSArray *)colorArr
                      percentage:(NSArray *)percents
                    gradientType:(GradientType)gradientType;


/**
 转化成服务要求的base64字符串

 @param compressionQuality 压缩比率0～1
 @return 字符串
 */
- (NSString *)convertToBase64StringWithCompressionQuality:(CGFloat)compressionQuality;


/**
 Resize

 @param newSize 新大小
 @return 图片
 */
- (UIImage *)scaledToSize:(CGSize)newSize;

@end
