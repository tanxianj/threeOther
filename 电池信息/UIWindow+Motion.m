//
//  UIWindow+Motion.m
//  FLEXTEST
//
//  Created by bang on 2018/1/16.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "UIWindow+Motion.h"

#ifdef DEBUG
#import <FLEXManager.h>
#endif

@implementation UIWindow (Motion)

#ifdef DEBUG
//- (BOOL)canBecomeFirstResponder{
//    return YES;
//}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [super motionEnded:motion withEvent:event];
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] setNetworkDebuggingEnabled:YES];
        [[FLEXManager sharedManager] showExplorer];
    }
}



#endif
@end
