//
//  GoodsViewController.m
//  
//
//  Created by bang on 2018/2/5.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "GoodsViewController.h"
#import "googsTableViewCell.h"

@interface GoodsViewController ()<UITableViewDelegate,UITableViewDataSource,googsTableViewCellDelegate>
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UILabel *lab;
@property(nonatomic,assign)NSInteger sum;
@end

@implementation GoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    
}
-(void)SetNavOther{
    self.title = @"商品增删";
    [self AddBackBtn];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellid = @"goods";
    googsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellid];
    if (!cell) {
        cell =[[[NSBundle mainBundle]loadNibNamed:@"googsTableViewCell" owner:self options:nil]lastObject];
    }
    cell.delegate = self;
    self.sum += [cell.number.text integerValue];
    self.lab.text = [NSString stringWithFormat:@"合计:%li",self.sum];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)changenaddumber:(NSString *)number Cell:(googsTableViewCell *)cell{
    XJLog(@"增加number is %@",number);
    self.sum ++;
    self.lab.text = [NSString stringWithFormat:@"合计:%li",self.sum];
}
-(void)changendeleteumber:(NSString *)number Cell:(googsTableViewCell *)cell{
    XJLog(@"删除number is %@",number);
    self.sum --;
    self.lab.text = [NSString stringWithFormat:@"合计:%li",self.sum];
}
-(void)Jisuan{
    XJLog(@"self.sum..  is %li",self.sum);
    self.lab.text = [NSString stringWithFormat:@"合计:%li",self.sum];
}
-(void)jsuannumber:(NSInteger)sum{
    XJLog(@"sum is %li",sum);
}
-(void)addView{
    [self.view addSubview:self.tabView];
    [self.view addSubview:self.btn];
    [self.view addSubview:self.lab];
}
-(void)initconstraint{
    [_tabView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.bottom.equalTo(self.view).offset(-44);
    }];
    [_btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.view);
        make.height.offset(44);
        make.width.offset(100);
    }];
    [_lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_btn.mas_right);
        make.height.equalTo(_btn);
        make.right.equalTo(self.view.mas_right);
        make.top.equalTo(_btn.mas_top);
    }];
}
-(UIButton *)btn{
    if (!_btn) {
        _btn = [UIButton buttonWithTitle:@"计算" buttonTitleFontSize:14.0 buttonTitleColor:[UIColor whiteColor] buttonBgColor:[UIColor redColor] buttonTextAlignment:NSTextAlignmentCenter];
        [_btn addTarget:self action:@selector(Jisuan) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}
-(UILabel *)lab{
    if (!_lab) {
        _lab = [UILabel LableInitWith:@"合计 " LabFontSize:14.0 textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter];
    }
    return _lab;
}
-(UITableView *)tabView{
    if (!_tabView) {
        _tabView = [[UITableView alloc]init];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        _tabView.tableFooterView = [UIView new];
        _tabView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return _tabView;
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
