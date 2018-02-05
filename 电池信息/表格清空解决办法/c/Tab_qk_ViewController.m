//
//  Tab_qk_ViewController.m
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Tab_qk_ViewController.h"

@interface Tab_qk_ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tab_view;
@property (nonatomic,strong)NSMutableArray *str_arry;
@property (nonatomic,strong)NSMutableArray *arry_index;
@end

@implementation Tab_qk_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"表格被清空问题";
    _tab_view.tableFooterView =[UIView new];
    // Do any additional setup after loading the view.
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    tab_qk_TableViewCell *cell = [tab_qk_TableViewCell SetCell];
    cell.title.text = [NSString stringWithFormat:@"第%li行",indexPath.row];
     cell.text_view.text = _arry_index[indexPath.row][@"content"];
    cell.GetString=^(NSString *str){
            NSMutableDictionary *dic =(NSMutableDictionary *)self.arry_index[indexPath.row];
            [dic setObject:str forKey:@"content"];
            _arry_index[indexPath.row] =dic;
            [self.tab_view reloadData];
    };
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
- (NSMutableArray *)arry_index{
    if (!_arry_index){
        _arry_index = [[NSMutableArray alloc] init];
        for (int i = 0; i < 20; i++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            [dic setObject:@"" forKey:@"content"];
            [_arry_index addObject:dic];
        }
    }
    
    return _arry_index;
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
