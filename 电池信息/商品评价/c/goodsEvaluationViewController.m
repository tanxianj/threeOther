//
//  goodsEvaluationViewController.m
//  第三方相关
//
//  Created by bang on 2018/1/25.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "goodsEvaluationViewController.h"
#import "goodsTableViewCell.h"
#import "ButtonTool.h"

@interface goodsEvaluationViewController ()<UITableViewDelegate,UITableViewDataSource>
//@property (weak, nonatomic) IBOutlet UITableView *tabView;
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)NSArray *dataArray;
@property (nonatomic,assign)CGFloat tableHeight;
@end

@implementation goodsEvaluationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initView];
    
    
}
-(void)SetNavOther{
    self.title = @"商品评价";
    [self AddBackBtn];
    
}
-(void)initView{
    [self.view addSubview:self.tabView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    goodsTableViewCell *cell = [goodsTableViewCell setCell];
//    static NSString *cellid = @"cellid";
    goodsTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //解决xib复用数据混乱问题
    if (!cell) {
        
        cell= (goodsTableViewCell *)[[[NSBundle  mainBundle]  loadNibNamed:@"goodsTableViewCell" owner:self options:nil]  lastObject];
        
    }
    cell.model = self.dataArray[indexPath.row];
    _tableHeight = [UILableTool NSstringis:cell.other.text labFontSize:17.0 LabBouns:CGSizeMake(__kWidth-20, MAXFLOAT)] +30;
    XJLog(@"_tableHeight is %f %f",_tableHeight,(ceilf(indexPath.row/3.0)*(__kWidth-100)/3)+(__kWidth-100)/3);
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return _tableHeight+ (ceilf((indexPath.row+1)/3.0)*(__kWidth-100)/3);
}
-(UITableView *)tabView{
    if(!_tabView){
        _tabView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tabView.delegate = self;
        _tabView.dataSource = self;
    }
    return _tabView;
}
-(void)singleTapAction{
    
}
-(NSArray *)dataArray{
    if (!_dataArray) {
        _dataArray = @[@{@"title":@"商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价",@"img":@"1"},
                       @{@"title":@"商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价",@"img":@"2"},
                       @{@"title":@"商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价",@"img":@"3"},
                       @{@"title":@"商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价",@"img":@"4"},
                       @{@"title":@"商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价商品评价",@"img":@"5"},];
    }
    return _dataArray;
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
