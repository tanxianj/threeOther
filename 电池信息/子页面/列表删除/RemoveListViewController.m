//
//  RemoveListViewController.m
//  第三方相关
//
//  Created by bang on 2018/1/31.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "RemoveListViewController.h"

@interface RemoveListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *removetable;
@property(nonatomic,strong)NSMutableArray *titleArray;
@end

@implementation RemoveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.removetable];
    
    [self.removetable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.offset(1);
    }];
    
   
    
    _titleArray = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i<100; i++) {
        NSString *str = [NSString stringWithFormat:@"当前是第%i行",i];
        [_titleArray addObject:str];
//        [_titleArray setObject:str atIndexedSubscript:i];
    }
    
}
-(void)SetNavOther{
    self.title = @"列表删除";
    [self AddBackBtn];
    
   
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"cellid";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
        
    }
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    [_titleArray removeObjectAtIndex:indexPath.row]; 
    [self.removetable deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationTop];
//    [self.removetable reloadData];
    
}
-(UITableView *)removetable{
    if (!_removetable) {
        _removetable = [[UITableView alloc]init];
        _removetable.delegate = self;
        _removetable.dataSource = self;
    }
    return _removetable;
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
