//
//  UNLIFEHomeViewController.m
//  第三方相关
//
//  Created by 谭显敬 on 2018/8/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UNLIFEHomeViewController.h"
#import "UNLIFEHeaderView.h"
#import "FenDuanViewController.h"
#import <Masonry/Masonry.h>
@interface UNLIFEHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView * tableView;
@property (nonatomic,strong)UNLIFEHeaderView *header;
@end

@implementation UNLIFEHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addSubViews];
    [self setupSubViewMargins];
}
-(void)SetNavOther{
    self.title = @"UNLIFE测试";
    [self AddBackBtn];
}
#pragma mark - Table view data source
//需要显示几个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
//每组需要显示的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

//cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Identifier" forIndexPath:indexPath];
    UILabel *lab = [UILabel new];
    lab.text = [NSString stringWithFormat:@"第%li行",indexPath.row];
    lab.font = [UIFont systemFontOfSize:15];
    [cell.contentView addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    // Configure the cell...
    return cell;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)sectiona{
//    UIView *view = [[[NSBundle mainBundle] loadNibNamed:@"UNLIFEsectionHeader" owner:self options:nil] lastObject];
    UIView *view = [FenDuanViewController alloc].view;
    
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 580;
    
}

// 添加子视图
- (void)addSubViews{
    [self.view addSubview:self.tableView];
}
// 设置约束
- (void)setupSubViewMargins{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorColor = [UIColor clearColor];
                UIView *view = [UIView new];
        view.frame = CGRectMake(0, 0,__kWidth , 256);
        [view addSubview:self.header];
        [self.header mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(view);
        }];
                _tableView.tableHeaderView = view;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Identifier"];
    }
    return _tableView;
}
-(UNLIFEHeaderView *)header{
    if (!_header) {
        _header = [[[NSBundle mainBundle] loadNibNamed:@"UNLIFEHeaderView" owner:self options:nil] lastObject];
    }
    return _header;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
