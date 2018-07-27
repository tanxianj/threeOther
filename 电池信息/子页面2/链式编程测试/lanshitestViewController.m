//
//  lanshitestViewController.m
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "lanshitestViewController.h"
#import "Calculate.h"
#import "UIviewLs.h"
#import "TXJView.h"
#import "UIView+XJLoadingView.h"
@interface lanshitestViewController ()

@end

@implementation lanshitestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    Calculate *cal = [[Calculate alloc]init];
//    cal.add(2).add(5).printResult.by(3).printResult;
    /*
    [Calculate markCalculate:^(Calculate *make) {
        make
        .add(5)
        .add(5)
        .printResult
        .by(2)
        .printResult;
    }];
   
    TXJLog(@"");
    UIView *view = [TXJView markCalculate:^(TXJView *make) {
        make
        .setFrame(0,10,__kWidth,100)
        .bgcolor([UIColor redColor]);
        
    }];
    UIView *view2 = [TXJView markCalculate:^(TXJView *make) {
        make
        .setFrame(0,20+view.bounds.size.height,__kWidth,100)
        .bgcolor([UIColor blueColor]);
        
    }];
    UIView *view3 = [TXJView markCalculate:^(TXJView *make) {
        make
        .setFrame(0,10+view2.frame.origin.y+view2.bounds.size.height,__kWidth,100)
        .bgcolor([UIColor greenColor]);
        
    }];
    [self.view addSubview:view];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
//    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.width.offset(__kWidth);
//        make.height.offset(100);
//        make.left.right.equalTo(self.view);
//        make.top.equalTo(self.view).offset(10);
//    }];
     */
    __weak typeof(self) weakSelf = self;
    self.view.xj_loadingView = [XJLoadingView loadingWithrefreshingBlock:^{
        DeBuGLog(@"显示了我的指示器");
        [weakSelf XJ_LoadIngtest];
    }];
     [self XJ_LoadIngtest];
    [self.view.xj_loadingView beginRefreshing];
    
    
}
-(void)XJ_LoadIngtest{
    [self.view.xj_loadingView beginRefreshing];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSInteger number = arc4random() % 100;
        DeBuGLog(@"number is %li",(long)number);
        if (number < 40) {
            [self.view.xj_loadingView endRefreshing];
        }else if (number >40 && number< 80){
            [self.view.xj_loadingView endRefreshingWithErrorString:@"大于40 小于80"];
        }else{
            [self.view.xj_loadingView endRefreshingWithNoDataString:@"大于80"];
        }
        
    });
}
-(void)SetNavOther{
    self.title = @"链式测试";
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
