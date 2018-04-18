//
//  HomeTwoViewController.m
//  第三方相关
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "HomeTwoViewController.h"

@interface HomeTwoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSArray *arrayTitle;

@end

@implementation HomeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayTitle.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Main_TableViewCell *cell = [Main_TableViewCell SetCell];
    cell.title_lab.text = self.arrayTitle[indexPath.row][@"title"];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIViewController *view = (UIViewController *)[[NSClassFromString(self.arrayTitle[indexPath.row][@"Controller"]) alloc]init];
    view.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:view animated:YES];
}
-(NSArray *)arrayTitle{
    if (!_arrayTitle) {
        
        _arrayTitle = @[
                        @{@"title":@"分段控制",@"Controller":@"FenDuanViewController"},
                        @{@"title":@"链式编程测试",@"Controller":@"lanshitestViewController"},
                        @{@"title":@"YYModel",@"Controller":@"YYModelViewController"},
//                        @{@"title":@"",@"Controller":@""},
//                        @{@"title":@"",@"Controller":@""},
                        ];
    }
    return _arrayTitle;
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
