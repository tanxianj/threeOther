//
//  Xieyi2ViewController.h
//  第三方相关
//
//  Created by bang on 2018/1/17.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Xieyi2ViewController;
@protocol Xieyi2ViewControllerDelegate <NSObject>
-(void)ChangeViewController:(Xieyi2ViewController *)viewController  changeText:(NSString *)text;
@end
@interface Xieyi2ViewController : UIViewController
@property (nonatomic,weak) id <Xieyi2ViewControllerDelegate> delegate;
@end
