//
//  RacOneViewController.m
//  
//
//  Created by 谭显敬 on 2018/7/2.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "RacOneViewController.h"
#import "RacTwoViewController.h"

@interface RacOneViewController ()
@property (weak, nonatomic) IBOutlet UILabel *RACLabele;
@property (weak, nonatomic) IBOutlet UIButton *pushBtn;
@property (nonatomic,strong)RacTwoViewController * TwoView;
@end

@implementation RacOneViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[self.pushBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        [self pushTwo];
    }];
    
}
-(void)pushTwo{
    [self.TwoView.btnClickSignal subscribeNext:^(id  _Nullable x) {
        self.RACLabele.text = x;
    }];
    [self.navigationController pushViewController:self.TwoView animated:YES];
}
//- (IBAction)pushtoTwo:(id)sender {
//
//    [self.TwoView.btnClickSignal subscribeNext:^(id  _Nullable x) {
//        self.RACLabele.text = x;
//    }];
//    [self.navigationController pushViewController:self.TwoView animated:YES];
//}
-(RacTwoViewController *)TwoView{
    if (!_TwoView) {
        _TwoView = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"RacTwoViewController"];
    }
    return _TwoView;
}
-(void)SetNavOther{
    self.title = @"RAC 页面一";
    [self AddBackBtn];
}
-(void)dealloc{
    DeBuGLog(@"RAC 页面一dealloc");
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
