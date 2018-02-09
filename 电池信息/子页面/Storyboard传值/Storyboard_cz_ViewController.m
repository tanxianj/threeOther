//
//  Storyboard_cz_ViewController.m
//  第三方相关
//
//  Created by MAc on 2017/12/4.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Storyboard_cz_ViewController.h"
#import "Storyboard_cz2_ViewController.h"
@interface Storyboard_cz_ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *name_tfd;
@property (weak, nonatomic) IBOutlet UITextField *age_tfd;

@end

@implementation Storyboard_cz_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"传值页面一";
}
- (IBAction)cz:(id)sender {
//    [self performSegueWithIdentifier:@"Storyboard_cz" sender:self];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"Storyboard_cz"]) {
        Storyboard_cz2_ViewController *strcz2 = segue.destinationViewController;
        strcz2.name = _name_tfd.text;
        strcz2.age = _age_tfd.text;
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
