//
//  EvaluationListViewController.m
//  第三方相关
//
//  Created by bang on 2018/1/29.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "EvaluationListViewController.h"
#import "EvaluationListTableViewCell.h"
#define  cellid @"Evaluation"
@interface EvaluationListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *EvaluationTable;
@end

@implementation EvaluationListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.EvaluationTable];
}
-(void)SetNavOther{
    self.title = @"评价列表";
    [self AddBackBtn];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    EvaluationListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"EvaluationListTableViewCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 264;
}
-(UITableView *)EvaluationTable{
    if (!_EvaluationTable) {
        _EvaluationTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight) style:UITableViewStylePlain];
        
        _EvaluationTable.delegate = self;
        _EvaluationTable.dataSource = self;
        _EvaluationTable.frame = CGRectMake(0, 0, __kWidth, __kHeight-64);
    }
    return _EvaluationTable;
}
-(void)scrollViewDidScroll:(UIScrollView*)scrollView{
    XJLog(@"%f",scrollView.contentOffset.y);
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
