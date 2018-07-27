//
//  TXJPromptViewController.m
//  
//
//  Created by 谭显敬 on 2018/6/29.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "TXJPromptViewController.h"
#import "TXJPromptView.h"

@interface TXJPromptViewController ()

@end

@implementation TXJPromptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)SetNavOther{
    self.title = @"自定义提示框Block按钮点击事件";
    [self AddBackBtn];
}
- (IBAction)ShowBtnAction:(id)sender {
    [TXJPromptView ShowPromptView:@"这是提示的Title" leftBtnAction:^{
        DeBuGLog(@"取消");
    } rightBtnAction:^{
        DeBuGLog(@"确定");
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
