//
//  NSString+hright.m
//  FLEX
//
//  Created by 谭显敬 on 2018/9/14.
//

#import "NSString+hright.h"

@implementation NSString (hright)
+(CGSize)sizeWithText:(NSString *)text additionalWidth:(CGFloat)awidth additionalHeight:(CGFloat)aHegiht font:(UIFont *)font maxSize:(CGSize)maxSize{
    NSDictionary *attrs = @{NSFontAttributeName : font};
    CGSize size =[text boundingRectWithSize:CGSizeMake(maxSize.width, maxSize.height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
    return CGSizeMake(size.width + awidth, size.height + aHegiht);
    
}
@end
