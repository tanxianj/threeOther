//
//  RacTwoViewController.m
//  
//
//  Created by 谭显敬 on 2018/7/2.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "RacTwoViewController.h"

@interface RacTwoViewController ()

@end

@implementation RacTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_btnClickSignal  sendNext:self.TextFiled.text.length ? self.TextFiled.text :@"什么都没写"];
}
-(void)SetNavOther{
    self.title = @"RAC 页面二";
    [self AddBackBtn];
}
-(RACSubject *)btnClickSignal{
    if (!_btnClickSignal) {
        _btnClickSignal = [RACSubject subject];
    }
    return _btnClickSignal;
}
- (IBAction)back:(id)sender {
    [_btnClickSignal  sendNext:self.TextFiled.text.length ? self.TextFiled.text :@"什么都没写"];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
