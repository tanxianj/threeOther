//
//  View_tool_ViewController.m
//  第三方相关
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "View_tool_ViewController.h"

@interface View_tool_ViewController ()

@end

@implementation View_tool_ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.topSeparatorLine.hidden = YES;
//    self.view.backgroundColor = [UIColor blackColor];
}

-(void)SetNavOther{
    self.title = @"测试";
    [self AddBackBtn];
    
    self.navigationItem.rightBarButtonItem = [self setupNavigationItemWithLeft:YES imageName:nil title:@"记录" callBack:^{
        XJLog(@"点击记录");
        
    }];
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
