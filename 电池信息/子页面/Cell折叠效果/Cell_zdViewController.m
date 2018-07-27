//
//  Cell_zdViewController.m
//  
//
//  Created by MAc on 2017/12/4.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Cell_zdViewController.h"
#define Screenwidth [UIScreen mainScreen].bounds.size.width
#define ScreennHeight [UIScreen mainScreen].bounds.size.height
@interface Cell_zdViewController (){
    BOOL CellList[30];
}
@end

@implementation Cell_zdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //这个的目的是为了使得启动app时，单元格是收缩的
    for (int i=0; i<30; i++) {
        CellList[i] = YES;
    }
    _tab_view.tableFooterView = [UIView new];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (CellList[section]) {
        return 0;
    }
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组 第%ld行",indexPath.section,indexPath.row];
    
    return cell;
    
}
//组头高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 50;
}
//创建组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIControl *view = [[UIControl alloc] initWithFrame:CGRectMake(0, 0, Screenwidth, 50)];
    view.tag =section;
    view.backgroundColor = [UIColor colorWithRed:0.849 green:0.195 blue:0.258 alpha:0.7];;
    [view addTarget:self action:@selector(sectionClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 4, 70, 30)];
    label.textColor = [UIColor colorWithRed:1.000 green:0.985 blue:0.996 alpha:1.000];
    label.font = [UIFont systemFontOfSize:14];
    label.text = [NSString stringWithFormat:@"第%ld组",section];
    [view addSubview:label];
    
    
    return view;
    
}
/**
 *  cell收缩/展开 刷新
 *
 *  @param view <#view description#>a
 */
-(void)sectionClick:(UIControl *)view{
   
    //获取点击的组
    NSInteger i = view.tag;
    //全部重置折叠
    /*
    for (int y=0; y<30; y++) {
//        CellList[y] = y==i?NO:YES;
        
        if (y==i) {
//             CellList[y] = NO;
        }else{
            CellList[y] = YES;
        }
       
        [_tab_view reloadData];
    }
     */
    //取反
    CellList[i] = !CellList[i];
    //刷新列表
    NSIndexSet * index = [NSIndexSet indexSetWithIndex:i];
    [_tab_view reloadSections:index withRowAnimation:UITableViewRowAnimationAutomatic];
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
