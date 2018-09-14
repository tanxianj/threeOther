//
//  NSString+FirstWord.m
//  消汇邦
//
//  Created by 罗建 on 2017/5/9.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "NSString+FirstWord.h"

@implementation NSString (FirstWord)

- (NSString *)firstWord {
    if (!self.length) {
        return @"";
    }
    NSMutableString *string = [NSMutableString stringWithString:self];
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformMandarinLatin,   NO);
    CFStringTransform((CFMutableStringRef)string, NULL, kCFStringTransformStripDiacritics, NO);
    NSString        *pinYin = [string capitalizedString];
    return [pinYin substringToIndex:1];
}

@end
