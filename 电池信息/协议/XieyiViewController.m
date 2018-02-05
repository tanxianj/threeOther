//
//  XieyiViewController.m
//  第三方相关
//
//  Created by bang on 2018/1/17.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "XieyiViewController.h"
#import "Xieyi2ViewController.h"
@interface XieyiViewController ()<Xieyi2ViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *lab_lab;

@end

@implementation XieyiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];

}
- (IBAction)GotoXyyi2:(id)sender {
    Xieyi2ViewController *xieyi = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"xiyi2"];
    xieyi.delegate = self;
    [self.navigationController pushViewController:xieyi animated:YES];
}
//协议传值（逆传）
#pragma mark -XieYiTwoDelegate
-(void)ChangeViewController:(Xieyi2ViewController *)viewController changeText:(NSString *)text
{
    self.lab_lab.text = text;
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
