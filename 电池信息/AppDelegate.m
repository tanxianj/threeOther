//
//  AppDelegate.m
//  电池信息
//
//  Created by MAc on 2017/11/28.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//   https://www.jianshu.com/p/05846b691aac
//   http://www.cmpbook.com/stackroom.php?id=36907
//   http://xclient.info/?_=8f85269aac98930ebb4f0a9a41b5aa85 //MAc 软件
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [UIButton appearance].adjustsImageWhenDisabled = NO;
    [UIButton appearance].adjustsImageWhenHighlighted = NO;
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    IQKeyboardManager *manager          = [IQKeyboardManager sharedManager];
    manager.enable                      = YES;
    manager.shouldResignOnTouchOutside  = YES;
    manager.enableAutoToolbar           = NO;
    [manager registerTextFieldViewClass:[YYTextView class] didBeginEditingNotificationName:YYTextViewTextDidBeginEditingNotification didEndEditingNotificationName:YYTextViewTextDidEndEditingNotification];
    //nav 手势处理 ,
    /*
     MLTransitionGestureRecognizerTypeScreenEdgePan //屏幕边缘
     MLTransitionGestureRecognizerTypePan //屏幕内
     */
    
    [self  changeNetWoking];
//     [MLTransition validatePanBackWithMLTransitionGestureRecognizerType:MLTransitionGestureRecognizerTypePan];
#if defined(DEBUG)||defined(_DEBUG)
    [[JPFPSStatus sharedInstance] close];
    [[JPFPSStatus sharedInstance] open];
    [JPFPSStatus sharedInstance].fpsLabel.textColor = [UIColor blueColor];
#endif
    return YES;
}

-(void)changeNetWoking{
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        if (self.BackNetWorking) {
            self.BackNetWorking(status);
//        }
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                XJLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                XJLog(@"WIFI网络");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                XJLog(@"4G网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                XJLog(@"没有网络");
                break;
            default:
                break;
        }
    }];
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
