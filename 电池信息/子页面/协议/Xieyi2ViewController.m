//
//  Xieyi2ViewController.m
//  
//
//  Created by bang on 2018/1/17.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "Xieyi2ViewController.h"

@interface Xieyi2ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *telePhonefield;

@end

@implementation Xieyi2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)BtnClick:(id)sender {
//    if ([self.delegate respondsToSelector:@selector(ChangeViewController:changeText:)]) {
        
        [self.delegate ChangeViewController:self changeText:self.telePhonefield.text];
        
//    }
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
