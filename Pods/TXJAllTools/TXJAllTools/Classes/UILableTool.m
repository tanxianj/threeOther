//
//  UILable_Tool.m
//  TXJAllTools
//
//  Created by bang on 2018/1/26.
//

#import "UILableTool.h"

@implementation UILableTool
+(CGFloat )NSstringis:(NSString *)str labFontSize:(CGFloat)fontsize LabBouns:(CGSize )widthAndHeight{
    
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontsize]};
    CGSize maxSize = CGSizeMake(widthAndHeight.width, MAXFLOAT);
    
    // 计算文字占据的高度
    CGSize size = [str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    
    
    return size.height;
}
@end
