//
//  RunTimeTestViewController.m
//  第三方相关
//
//  Created by 谭显敬 on 2018/7/6.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "RunTimeTestViewController.h"
const void*RunTimeKey = @"THISISTEST";
@interface RunTimeTestViewController ()
typedef void (^BlockRunTime)(NSString *str);
@property (weak, nonatomic) IBOutlet UIButton *runTimeBtn;
@property (weak, nonatomic) IBOutlet UIView *viewtest;
@property (weak, nonatomic) IBOutlet UIImageView *vimgV;
@property (nonatomic,copy)BlockRunTime block;
@end

@implementation RunTimeTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_viewtest addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(viewTest)]];

}
-(void)SetNavOther{
    self.title = @"测试";//运行时
    [self AddBackBtn];
}
-(void)viewTest{
    UIViewAnimationOptions option = UIViewAnimationOptionTransitionFlipFromLeft;
    
    [UIView transitionWithView:self.viewtest  duration:1.5f options:option animations:^{

        
        if ([self.vimgV.image isEqual:[UIImage imageNamed:@"2.jpeg"]]) {
            self.vimgV.image = [UIImage imageNamed:@"1.jpeg"];
        }else{
            self.vimgV.image = [UIImage imageNamed:@"2.jpeg"];
        }
    } completion:nil];
}
- (IBAction)RunTimeBtnAction:(UIButton *)btn {
    [self.runTimeBtn setTitle:[NSString stringWithFormat:@"%u",arc4random()%100] forState:UIControlStateNormal];
    BlockRunTime blockOne = objc_getAssociatedObject(btn, RunTimeKey);
    blockOne = ^(NSString *str) {
        DeBuGLog(@"Str is %@",str);
    };
}
-(void)setBlock:(BlockRunTime)block{
    objc_setAssociatedObject(self, RunTimeKey, self.runTimeBtn.titleLabel.text, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(BlockRunTime)block{
    return objc_getAssociatedObject(self, RunTimeKey);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
