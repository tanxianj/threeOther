//
//  ViewController.h
//  ViewController_model
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Button.h"
#import "Initialization.h"
typedef NS_ENUM(NSUInteger,LeftOrRihgt) {
    Nav_Left_Item,
    Nav_Right_Item
};
@interface Super_ViewController : UIViewController<Initialization>

@property(nonatomic,strong)UIView *topLine;

-(BOOL)HiddenNavView;
-(void)AddBackBtn;
-(void)SetNavOther;
/*
- (UIBarButtonItem *)setupNavigationItemWithLeft:(LeftOrRihgt) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                        callBack:(ButtnBlock)buttonBlock;
 */
@end

