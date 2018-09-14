//
//  NSString+XCJson.h
//  消汇邦
//
//  Created by 1244 on 2017/9/12.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XCJson)

/**
 字典转字符

 @param dictionary 字典
 @return 字符串
 */
+ (NSString *)stringWithDictionary:(NSDictionary *)dictionary;

/**
 字符串转字典

 @param jsonString Json字符串
 @return 字典
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

@end
