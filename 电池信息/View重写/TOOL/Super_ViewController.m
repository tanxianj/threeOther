//
//  ViewController.m
//  ViewController_model
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "Super_ViewController.h"
#import "AppDelegate.h"
@interface Super_ViewController ()
@property (nonatomic,strong)UILabel *lab;
@end

@implementation Super_ViewController
//在页面出现的时候就将黑线隐藏起来
-(void)viewWillAppear:(BOOL)animated
{
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController.navigationBar setTranslucent:NO];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.fd_interactivePopDisabled = NO;//是否禁用全屏返回pop
    self.fd_prefersNavigationBarHidden = NO;//是否禁用全屏返回模态
    [self SetNavOther];
    [self addView];
    [self initconstraint];
    
//    [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.view.window);
//        make.height.offset(20);
//        make.left.equalTo(self.view.window.mas_left).offset(100);
//    }];
    [self.navigationController setNavigationBarHidden:[self HiddenNavView] animated:YES];
    AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    delegate.BackNetWorking = ^(NSInteger status){
        NSString *str ;
        switch (status) {
            case 0:
                str = @"没有网络";
                break;
            case 1:
                str = @"4G网络";
                break;
            case 2:
                str = @"Wifi网络";
                break;
            default:
                
                break;
        }
        self.lab.text = str;
        [self.view.window addSubview:self.lab];
        
    };
}

-(UILabel *)lab{
    if (!_lab) {
        _lab=[UILabel LableInitWith:@"" LabFontSize:12.0 textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter];
        _lab.frame = CGRectMake(80, 0, 100, 20);
//        _lab.backgroundColor = [UIColor blueColor];
    }
    return _lab;
}
-(void)ShowTopLine{
    self.topLine = [UIView new];
    self.view.backgroundColor = [UIColor whiteColor];
    self.topLine.backgroundColor = [UIColor greenColor];
    [self.navigationController.navigationBar setTranslucent:NO];
    [self.navigationController.navigationBar addSubview:_topLine];
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.navigationController.navigationBar);
        make.height.offset(1);
        make.top.equalTo(self.navigationController.navigationBar.mas_bottom).offset(-1);
    }];
//    self.topLine.hidden = YES;
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
        if (leftOrRight == Nav_Right_Item) {
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
        if (leftOrRight == Nav_Right_Item) {
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
                button.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
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


-(void)initconstraint{
    
}
-(void)addView{
    
}
@end
