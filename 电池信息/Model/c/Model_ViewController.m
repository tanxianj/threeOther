//
//  Model_ViewController.m
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Model_ViewController.h"
#define HTTP @"http://www.le173.com/v2/goods/list"
#import "HTTPSessionManager.h"
@interface Model_ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tab_view;
@property (nonatomic,strong)NSMutableArray *arry;
@end

@implementation Model_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self Get_Data];
    _tab_view.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_tab_view reloadData];
        
        if ([_tab_view.mj_header isRefreshing]) {
            [_tab_view.mj_header endRefreshing];
        }
        
        
    }];
    _tab_view.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [_tab_view reloadData];
        if ([_tab_view.mj_footer isRefreshing]) {
            [_tab_view.mj_footer endRefreshing];
        }
        
        
    }];
    
}
-(void)Get_Data{
    //菊花加载
    [HTTPSessionManager getWithURLString:HTTP parameters:@{@"mem_id":@"20"} success:^(NSDictionary *data) {
        
    } failure:^(NSError *error) {
        
    }];
    [[AFNetwork shareManager] GET:HTTP parameters:@{@"mem_id":@"2"}  progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        _arry = [XJModel mj_objectArrayWithKeyValuesArray:responseObject[@"data"][@"list"]];
        [self.tab_view reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arry.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    Model_TableViewCell *cell = [Model_TableViewCell Setcell];
    
    cell.model = self.arry[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
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
