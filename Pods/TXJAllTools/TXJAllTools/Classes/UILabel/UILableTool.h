//
//  UILable_Tool.h
//  TXJAllTools
//
//  Created by bang on 2018/1/26.
//

#import <Foundation/Foundation.h>

@interface UILableTool : NSObject
/**
 传入字符串返回高度
 
 @param str 字符串
 @param fontsize 字体大小
 @param widthAndHeight 宽度高度
 @return 高度
 */
+(CGFloat )NSstringis:(NSString *)str labFontSize:(CGFloat)fontsize LabBouns:(CGSize )widthAndHeight;
@end
