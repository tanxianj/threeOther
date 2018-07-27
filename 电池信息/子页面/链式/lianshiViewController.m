//
//  lianshiViewController.m
//  
//
//  Created by bang on 2018/3/19.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "lianshiViewController.h"

@interface lianshiViewController ()
@property (nonatomic, strong) UIView *myView;
@property (nonatomic, weak) UIButton *pauseButton;
@property (nonatomic, strong) JHChainableAnimator *animator;
@end

@implementation lianshiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myView= [[UIView alloc] initWithFrame:CGRectMake(100, 50, 50, 50)];
    self.myView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.myView];
    self.myView.spring.centerXBy(50).animate();
    self.myView.spring.sizeBy(CGSizeMake(__kWidth-100,100)).animate();
//    easeOut
    self.myView.spring.centerYBy(100).animate();
    self.myView.spring.cornerRadiusBy(20).animate();
    self.myView.spring.rotateZBy(-95).animate();
    
    
//     self.myView.chainAnimator.basic.target(self).complete(@selector(complete:)).property(@"position").toValue([NSValue valueWithCGPoint:CGPointMake(100, self.view.center.y)]).easeInBack.duration(0.5).combineSpring.target(self).complete(@selector(complete:)).property(@"bounds").toValue([NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)]).duration(0.5).repeatCount(5).autoreverses.combineSpring.target(self).complete(@selector(complete:)).property(@"transform.rotation").toValue(@(M_PI_4)).duration(0.5).repeatCount(3).beginTime(1.0).autoreverses.nextToBasic.property(@"position").toValue([NSValue valueWithCGPoint:self.view.center]).duration(0.5).combineSpring.property(@"bounds").toValue([NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)]).duration(0.8).nextToBasic.property(@"transform.rotation").toValue(@(M_PI_4)).duration(1.0).completeWithBlock(nil).animate();

}


-(void)SetNavOther{
    self.title = @"链式";
    [self AddBackBtn];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
