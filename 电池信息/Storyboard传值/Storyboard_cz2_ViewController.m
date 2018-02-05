//
//  Storyboard_cz2_ViewController.m
//  第三方相关
//
//  Created by MAc on 2017/12/4.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Storyboard_cz2_ViewController.h"

@interface Storyboard_cz2_ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *name_lab;
@property (weak, nonatomic) IBOutlet UILabel *age_lab;

@end

@implementation Storyboard_cz2_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"得到传值页面二";
    _name_lab.text = [NSString stringWithFormat:@"name---%@",_name];
    _age_lab.text = [NSString stringWithFormat:@"age---%@",_age];
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
