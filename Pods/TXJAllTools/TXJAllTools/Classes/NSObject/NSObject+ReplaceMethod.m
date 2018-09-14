//
//  NSObject+ReplaceMethod.m
//  Template_IOS
//
//  Created by 罗建 on 2017/6/12.
//  Copyright © 2017年 Personal Project. All rights reserved.
//

#import "NSObject+ReplaceMethod.h"

#import <objc/runtime.h>


@implementation NSObject (ReplaceMethod)


+ (BOOL)replaceMethodWithOldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    Method oldMethod = class_getInstanceMethod(self, oldSelector); // 获取实例方法
    Method newMethod = nil;
    if (oldMethod) {
        newMethod = class_getInstanceMethod(self, newSelector);
    }
    else{
        oldMethod = class_getClassMethod(self, oldSelector); // 获取类方法
        if (oldMethod) {
            newMethod = class_getClassMethod(self, newSelector);
        }
    }

    if (oldMethod && newMethod) {
        if (class_addMethod(self, oldSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))) {
            class_replaceMethod(self, newSelector, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        }
        else {
            method_exchangeImplementations(oldMethod, newMethod);
        }
        NSString *string = [NSString stringWithFormat:@"交换方法成功：Class = %@，oldSelector = %@，newSelector = %@", NSStringFromClass([self class]), NSStringFromSelector(oldSelector), NSStringFromSelector(newSelector)];
        NSLog(@"%@", string);
        return YES;
    }
    else {
        NSString *string = [NSString stringWithFormat:@"交换方法失败：Class = %@，oldSelector = %@，newSelector = %@", NSStringFromClass([self class]), NSStringFromSelector(oldSelector), NSStringFromSelector(newSelector)];
        NSLog(@"%@", string);
        return NO;
    }
}

/**
 *  类方法的交换
 *
 *  @param class       哪个类
 *  @param oldSelector 方法1
 *  @param newSelector 方法2
 */
+ (void)replaceClassMethod:(Class)class oldSelector:(SEL)oldSelector newSelector:(SEL)newSelector {
    Method method1 = class_getClassMethod(class, oldSelector);
    Method method2 = class_getClassMethod(class, newSelector);
    method_exchangeImplementations(method1, method2);
}


/**
 *  对象方法的交换
 *
 *  @param anClass    哪个类
 *  @param method1Sel 方法1(原本的方法)
 *  @param method2Sel 方法2(要替换成的方法)
 */
+ (void)exchangeInstanceMethod:(Class)anClass method1Sel:(SEL)method1Sel method2Sel:(SEL)method2Sel {
    
    
    Method originalMethod = class_getInstanceMethod(anClass, method1Sel);
    Method swizzledMethod = class_getInstanceMethod(anClass, method2Sel);
    
    BOOL didAddMethod =
    class_addMethod(anClass,
                    method1Sel,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(anClass,
                            method2Sel,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    }
    
    else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
    
}


@end
