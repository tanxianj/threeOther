//
//  FirstViewController.m
//  第三方相关
//
//  Created by MAc on 2017/12/5.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@property(nonatomic,strong) NSArray  *titleArray;


@end

@implementation FirstViewController
-(NSArray*)titleArray
{
    return @[@"window加载弹窗",@"view加载弹窗",@"window展示信息",@"view展示信息",@"成功展示弹窗",@"警告展示弹窗",@"错误展示弹窗",@"信息展示弹窗"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MBProgressHUD+JDragon";
    _tab.tableFooterView = [UIView new];
    
    /*
    UIBarButtonItem  *item = [[UIBarButtonItem  alloc]initWithTitle:@"aa" style:UIBarButtonItemStylePlain target:self action:@selector(didClickAction)];
    
    self.navigationItem.leftBarButtonItem = item;
    
    */
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)didClickAction
{
    NSLog(@"dawwad");
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 8;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:@"cellone"];
    if (!cell) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellone"];
    }
    cell.textLabel.text =self.titleArray[indexPath.row];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [MBProgressHUD showActivityMessageInWindow:@"啊哈哈哈哈" timer:10];
            break;
        case 1:
            [MBProgressHUD showActivityMessageInView:nil];
            
            break;
        case 2:
            [MBProgressHUD showTipMessageInWindow:@"在window"];
            break;
        case 3:
            [MBProgressHUD showTipMessageInView:@"在View"];
            
            break;
        case 4:
            [MBProgressHUD showSuccessMessage:@"加载成功"];
            break;
        case 5:
            [MBProgressHUD showWarnMessage:@"显示警告"];
            break;
        case 6:
            [MBProgressHUD showErrorMessage:@"显示错误"];
            break;
        case 7:
            [MBProgressHUD showInfoMessage:@"显示信息"];
            break;
            
        default:
            break;
    }
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:2];
}
-(void)dismiss
{
    
    [MBProgressHUD hideHUD];
    
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
