//
//  View_wg_test_Viewcontroller.m
//  第三方相关
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "View_wg_test_Viewcontroller.h"

@interface View_wg_test_Viewcontroller ()

@end

@implementation View_wg_test_Viewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self Setwg];
    
}
-(void)SetNavOther{
    self.title = @"网格";
    [self AddBackBtn];
    self.topLine.hidden = YES;
}
/**/
-(void)Setwg{
    for (int i = 0; i<__kWidth; i+=5) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(i);
            make.top.bottom.equalTo(self.view);
            make.width.offset(1);
        }];
    }
    for (int i = 0; i<__kHeight; i+=5) {
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(i);
            make.left.right.equalTo(self.view);
            make.height.offset(1);
        }];
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
