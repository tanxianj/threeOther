//
//  UItableViewinsets.m
//  第三方相关
//
//  Created by bang on 2018/2/7.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UItableViewinsets.h"
#import <TXJAllTools/ViewRadioTool.h>

@interface UItableViewinsets ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *tableView;
@end

@implementation UItableViewinsets

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBar.translucent = NO;
   
    [self.view addSubview:self.tableView];;
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);

    }];
    UIView *viewbgv = [[UIView alloc]initWithFrame:self.tableView.bounds];
    viewbgv.backgroundColor = [UIColor clearColor];
    [self.tableView setBackgroundView:viewbgv];
    UIButton *btn = [UIButton buttonWithTitle:@"这是个按钮" buttonTitleFontSize:14.0 buttonTitleColor:[UIColor whiteColor] buttonBgColor:[UIColor clearColor] buttonTextAlignment:NSTextAlignmentCenter];
    [btn addTarget:self action:@selector(BtnAction) forControlEvents:UIControlEventTouchUpInside];
    [viewbgv addSubview:btn];
    btn.frame = CGRectMake(10, 10,__kWidth-20, 44);
    [btn buttonGradient:@[[UIColor redColor],[UIColor blueColor]] buttonCGSize:CGSizeMake(__kWidth-20, 44) ByGradientType:TXJDirectionTypeLeft2Right cornerRadius:YES];
}

-(void)BtnAction{
    XJLog(@"点击事件");
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%li行",indexPath.row];
    return cell;
}
-(void)SetNavOther{
    self.title = @"表格偏移";
    [self AddBackBtn];
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
        UIView *headerView = [UIView new];
        headerView.frame = CGRectMake(0, 0, __kWidth, 50);
        headerView.backgroundColor = [UIColor blueColor];
        [ViewRadioTool ViewRadioWith:headerView RadioViewWithBouns:headerView.frame radio:30 RectCornerType:UIRectCornerTopLeft|UIRectCornerTopRight];
        _tableView.tableHeaderView =headerView;
        _tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
        [_tableView setContentOffset:CGPointMake(0, -200)];
//        [_tableView setContentSize:CGSizeMake(__kWidth, __kHeight)];
    }
    return _tableView;
}

#pragma mark - UIScrollView
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
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
