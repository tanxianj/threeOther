//
//  NSObject+ReplaceMethod.h
//  Template_IOS
//
//  Created by 罗建 on 2017/6/12.
//  Copyright © 2017年 Personal Project. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSObject (ReplaceMethod)


+ (BOOL)replaceMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector;


@end
