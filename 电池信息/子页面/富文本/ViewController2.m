//
//  ViewController.m
//  富文本测试
//
//  Created by bang on 2018/1/8.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (weak, nonatomic) IBOutlet UITableView *tabview;

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tabview.tableFooterView = [UIView new];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCellfwb *cell= [TableViewCellfwb Setcell];
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"第%li行这是个富文本测试这是个富文本测试这是个富文本测试这是个富文本测试\n",indexPath.row]];
    // 创建图片图片附件
    NSTextAttachment *attach = [[NSTextAttachment alloc] init];
    attach.image = [UIImage imageNamed:@"CYLoLi.png"];
    attach.bounds = CGRectMake(0, 0, cell.lab_lab.bounds.size.width/3-5 , cell.lab_lab.bounds.size.width/3-5);
    for (int i= 0; i<indexPath.row+1; i++) {
        if (indexPath.row%2==0) {
            NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
            [string appendAttributedString:attachString];
            [string appendAttributedString:[[NSAttributedString alloc] initWithString:@" "]];
        }
        
        
    }

    cell.lab_lab.attributedText = string;
    cell.lab_2_lab.text =@"iOS 6之前：CoreText,纯C语言,极其蛋疼";
    _tabview.separatorStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
/*
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
