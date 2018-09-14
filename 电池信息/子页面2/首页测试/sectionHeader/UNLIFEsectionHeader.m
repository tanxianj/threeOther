//
//  UNLIFEsectionHeader.m
//  第三方相关
//
//  Created by 谭显敬 on 2018/8/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UNLIFEsectionHeader.h"
@implementation UNLIFEsectionHeader

-(void)awakeFromNib{
    [super awakeFromNib];
    // 1 设置segmentBar的frame
    self.segmentVC = [[LLSegmentBarVC alloc]init];
    self.segmentVC.segmentBar.frame = CGRectMake(0, 0, __kWidth, 80);
    self.segmentVC.segmentBar.backgroundColor = [UIColor redColor];
    
    //    self.navigationItem.titleView = self.segmentVC.segmentBar;
    // 2 添加控制器的V
    self.segmentVC.view.frame = CGRectMake(0, 0, __kWidth, 300);
    [self addSubview:self.segmentVC.view];
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
        config.itemNormalColor([UIColor blackColor]).itemSelectColor([UIColor blueColor]).indicatorColor([UIColor blueColor]).indicatorHeight(2);
    }];
}

@end
