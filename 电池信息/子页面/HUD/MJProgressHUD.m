//
//  ZMJProgressHUD.m
//  YXLM
//
//  Created by zhengminjie on 16/5/4.
//  Copyright © 2016年 zhengminjie. All rights reserved.
//

#import "MJProgressHUD.h"


@interface MJProgressHUD ()<UIGestureRecognizerDelegate>


@property (nonatomic ,strong) UILabel *label;
@property (nonatomic ,strong) UIView *zdview;
@property (nonatomic ,strong) UIActivityIndicatorView *indicator;

@property (strong, nonatomic) UIView *transformView;
@property (strong, nonatomic) UIImageView *imageview;

@end

@implementation MJProgressHUD


- (void)startActive{
    
    UIWindow *wd=[UIApplication sharedApplication].keyWindow;
    
    self.zdview = [[UIView alloc] initWithFrame:wd.frame];
    self.zdview.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.3];
    [wd addSubview:self.zdview];
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    self.indicator.center = self.zdview.center;
    [wd addSubview:self.indicator];
    
    [self.indicator startAnimating];
}
- (void)stopActive{
    
    [UIView animateWithDuration:0.5 animations:^{
        
        [self.indicator stopAnimating];
        [self.zdview setAlpha:0];
        [self.indicator setAlpha:0];
        
    } completion:^(BOOL finished) {
        [self.zdview removeFromSuperview];
        [self.indicator removeFromSuperview];
    }];
    
}

            
+ (void)showAlertWithString:(NSString *)string{

    [[self alloc] showAlert:string];
}
- (void)showAlert:(NSString *)string{

    self.label = [[UILabel alloc] init];
    self.label.text = string;
    self.label.backgroundColor = [UIColor darkGrayColor];
    self.label.font = [UIFont systemFontOfSize:15];
    self.label.textColor = [UIColor whiteColor];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.alpha = 0;
    self.label.layer.masksToBounds = YES;
    self.label.layer.cornerRadius = 4;
    
    CGRect textframe = [self.label textRectForBounds:CGRectMake(0, 0, __kWidth, 999) limitedToNumberOfLines:0];
    CGRect labelframe = CGRectZero;
    labelframe.size.width = textframe.size.width+20;
    labelframe.size.height = textframe.size.height+10;
    labelframe.origin.x = __kWidth/2-labelframe.size.width/2;
    labelframe.origin.y = __kHeight-labelframe.size.height;
    self.label.frame = labelframe;
    
    UIWindow *wd=[UIApplication sharedApplication].keyWindow;
    [wd addSubview:self.label];
    
    [self showing];
}

- (void)showing{

    [UIView animateWithDuration:1 animations:^{
        self.label.alpha = 1;
        self.label.transform = CGAffineTransformMakeTranslation(0, -100);
        
    } completion:^(BOOL finished) {
        
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(removeView) userInfo:nil repeats:NO];
        
    }];
}
- (void)removeView{
    
    [self.label removeFromSuperview];
}




@end
