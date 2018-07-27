
//
//  FenDuanViewController.m
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "FenDuanViewController.h"

@interface FenDuanViewController ()
@property (nonatomic,strong)LLSegmentBarVC *segmentVC;
@end

@implementation FenDuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 1 设置segmentBar的frame
    self.segmentVC = [[LLSegmentBarVC alloc]init];
    self.segmentVC.segmentBar.frame = CGRectMake(0, 0, __kWidth, 45);
    self.segmentVC.segmentBar.backgroundColor = [UIColor redColor];
    
//    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的V
    self.segmentVC.view.frame = self.view.bounds;
    [self.view addSubview:self.segmentVC.view];
    // 3 添加控制器数组和标题数组
    NSArray *items = @[@"页面一", @"页面二", @"页面三"];
    UIViewController *vc1 = [UIViewController new];
    vc1.view.backgroundColor = [UIColor redColor];
    UIViewController *vc2 = [UIViewController new];
    vc2.view.backgroundColor = [UIColor greenColor];
    UIViewController *vc3 = [UIViewController new];
    vc3.view.backgroundColor = [UIColor yellowColor];
    [self.segmentVC setUpWithItems:items childVCs:@[vc1,vc2,vc3]];
    
    // 5  配置基本设置  采用链式编程模式进行设置
    [self.segmentVC.segmentBar updateWithConfig:^(LLSegmentBarConfig *config) {
        config.itemNormalColor([UIColor blackColor]).itemSelectColor([UIColor redColor]).indicatorColor([UIColor redColor]).indicatorHeight(2);
    }];
   
}
-(void)SetNavOther{
    self.title = @"分段控制";
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
