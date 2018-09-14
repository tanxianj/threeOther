//
//  NSString+hright.h
//  FLEX
//
//  Created by 谭显敬 on 2018/9/14.
//

#import <Foundation/Foundation.h>

@interface NSString (hright)

/**
 返回当前文字所需要的宽度跟高度

 @param text 需要计算的文字
 @param awidth 希望加上的额外宽度
 @param aHegiht 希望加上的额外高度
 @param font 文字大小
 @param maxSize 文字大概宽度或高度  可传CGSizeMake(MAXFLOAT, MAXFLOAT);
 @return 当前文字所需要的宽度跟高度
 */
+(CGSize)sizeWithText:(NSString *)text additionalWidth:(CGFloat)awidth additionalHeight:(CGFloat)aHegiht font:(UIFont *)font maxSize:(CGSize)maxSize;
@end
