//
//  Lookimage.m
//  
//
//  Created by bang on 2018/1/30.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "Lookimage.h"

@implementation Lookimage
+(instancetype)ShareLookImg{
    static Lookimage *lookimg = nil;
    static dispatch_once_t OneToken;
    dispatch_once(&OneToken, ^{
        lookimg = [[Lookimage alloc]init];
    });
    return lookimg;
}
@end
