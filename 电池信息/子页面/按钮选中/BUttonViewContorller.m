//
//  BUttonViewContorller.m
//  
//
//  Created by bang on 2018/2/7.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "BUttonViewContorller.h"

@interface BUttonViewContorller ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btn_array;


@end

@implementation BUttonViewContorller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    XJLog(@"btn_array is %@",self.btn_array);
}

- (IBAction)btnsectAction:(UIButton *)sender {
    if (sender.selected) {
        sender.selected = NO;
        XJLog(@"取消选中 --- %li",sender.tag);
    }else{
        for (UIButton *btn in self.btn_array) {
            
                btn.selected = (btn==sender);
            
            if (btn.selected) {
                XJLog(@"选中 --- %li",btn.tag);
            }
            
        }
    }
}
-(void)SetNavOther{
    self.title = @"按钮单选";
    [self AddBackBtn];
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
