//
//  Cell_showAllViewController.m
//  
//
//  Created by MAc on 2017/12/5.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Cell_showAllViewController.h"

@interface Cell_showAllViewController (){
    BOOL Close[30];
}
@property (weak, nonatomic) IBOutlet UITableView *tab_view;

@end

@implementation Cell_showAllViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Cell点击展开所有";
    _tab_view.tableFooterView = [UIView new];
    _tab_view.rowHeight = -1;
//    NSLog(@"_tab_view.rowHeight is %.2f",_tab_view.rowHeight);
    for (int i=0; i<30; i++) {
        Close[i] = NO;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    cell_showAllTableViewCell *cell = [cell_showAllTableViewCell Set_Cell];
    cell.lab_lab.text = @"这是第一次发表自己的博客，一直不知道该写点什么东西，恰巧今天写了个App中比较常见的使用场景，列表页面列表每行显示的数据有限，不能完整的显示所有内容，通过点击UITableViewCell将不能完全展示的内容展示完全，再次点击会继续隐藏部分内容。Demo见：CellShowAllText，效果如图";
    cell.open =Close[indexPath.row];
   
    [self Get_NSstring:cell.lab_lab.text FoneSize:16.0];
    
    return cell;
}
-(NSInteger)Get_NSstring:(NSString *)str FoneSize:(CGFloat)size{
    CGRect rect = [str boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    CGSize textSize = [str sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:size]}];
    NSUInteger textRow = (NSUInteger)(rect.size.height / textSize.height);
    NSLog(@"行数-->%li",textRow);//行数
    return textRow;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        Close[indexPath.row] = !Close[indexPath.row];
    //一个cell刷新
    [_tab_view reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    //一个section刷新
//    [self.tab_view reloadSections:[[NSIndexSet alloc]initWithIndex:0] withRowAnimation:UITableViewRowAnimationFade];
}
-(void)Set_tabcell:(BOOL)open IndexPath:(NSInteger)index{
    
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
