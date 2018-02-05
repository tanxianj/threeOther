//
//  ViewController_boolk.m
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "ViewController_boolk.h"

@interface ViewController_boolk ()
@property (weak, nonatomic) IBOutlet UITextField *text_view;

@end

@implementation ViewController_boolk

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)SetNavOther{
    self.title = @"Block回调";
    [self AddBackBtn];
}
- (IBAction)boolk_btn:(id)sender {
    [self boolk];
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self boolk];
}
- (void)boolk{
    if (_Get_lab) {
        self.Get_lab(_text_view.text);
    }
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
