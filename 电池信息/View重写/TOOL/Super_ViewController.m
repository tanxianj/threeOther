//
//  ViewController.m
//  ViewController_model
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "Super_ViewController.h"

@interface Super_ViewController ()

@end

@implementation Super_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.topLine = [UIView new];
    self.topLine.backgroundColor = [UIColor redColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.view addSubview:_topLine];
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.offset(1);
    }];
    
    [self SetNavOther];
    [self.navigationController setNavigationBarHidden:[self HiddenNavView] animated:YES];
}

-(void)SetNavOther{
    
}
-(BOOL)HiddenNavView{
    
    return NO;
}
-(void)AddBackBtn{
    self.navigationItem.leftBarButtonItem = [self setupNavigationItemWithLeft:Nav_Left_Item imageName:@"return" title:nil callBack:nil];
}
- (UIBarButtonItem *)setupNavigationItemWithLeft:(LeftOrRihgt) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                        callBack:(ButtnBlock)buttonBlock{
    return [self setupNavigationItemWithLeft:leftOrRight imageName:imageName title:title titleColor:[UIColor blackColor] callBack:buttonBlock];
}

- (UIBarButtonItem *)setupNavigationItemWithLeft:(LeftOrRihgt) leftOrRight
                                       imageName:(NSString *)imageName
                                           title:(NSString *)title
                                      titleColor:(UIColor *)titleColor
                                        callBack:(ButtnBlock)buttonBlock {
    
    if ([imageName isEqualToString:@"return"]) {
        imageName = @"icon_nav_back";
    }
    
    
    Button *button = [Button buttonWithType:UIButtonTypeCustom];
    
    button.frame = CGRectMake(0, 0, 64, 44);
    if (title && [title isKindOfClass:[NSString class]]) {
        [button setTitle:title
                forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        [button setTitleColor:titleColor
                     forState:UIControlStateNormal];
        if (Nav_Right_Item) {
            //            button.frame = CGRectMake(0, 0, 60, 44);
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
            }
        }
        else {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
                
            }
        }
    }
    if (imageName && [imageName isKindOfClass:[NSString class]]) {
        [button setImage:[UIImage imageNamed:imageName]
                forState:UIControlStateNormal];
        if (leftOrRight) {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -4);
            }
        }
        else {
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            if (@available(iOS 11.0, *)){
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
            }else{
                button.contentEdgeInsets = UIEdgeInsetsMake(0, -4, 0, 0);
            }
        }
    }
    if (buttonBlock) {
        button.buttonblock = buttonBlock;
    }
    [button addTarget:self
               action:@selector(barButtonItemAction:)
     forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return item;
}
- (void) barButtonItemAction:(Button *)button{
    if (button.buttonblock) {
        button.buttonblock();
    }
    else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
