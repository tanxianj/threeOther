//
//  UITableView_hegiht_ViewController.m
//  第三方相关
//
//  Created by MAc on 2017/12/4.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "UITableView_hegiht_ViewController.h"

@interface UITableView_hegiht_ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tab_view;
@property (nonatomic,strong)NSMutableDictionary *height_tab;//存储cell高度---感觉没用
@end

@implementation UITableView_hegiht_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"UITableView的自适应高度";
    _tab_view.rowHeight = UITableViewAutomaticDimension;
    UIBarButtonItem *rightBarItem = [[UIBarButtonItem alloc] initWithTitle:@"刷新" style:UIBarButtonItemStylePlain target:self action:@selector(onClickedOKbtn)];
    self.navigationItem.rightBarButtonItem = rightBarItem;
    _height_tab = [[NSMutableDictionary alloc]initWithCapacity:10];
}
-(void)onClickedOKbtn{
    [_tab_view reloadData];
/*
    for (NSString * key in [_height_tab allKeys] ) {
        NSLog(@"height_tab is---%@",_height_tab[key]);
    }
 */
    NSString *strr = [NSString stringWithFormat:@"%@",_height_tab];
    NSLog(@"str is %@",strr);

/*
    [_height_tab enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%@:%@",key,obj);
    }];
*/
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITable_height_TableViewCell *cell = [UITable_height_TableViewCell Set_cell];
    
    
    cell.lab_lab.text = [self Get_num:indexPath.row];
    
//    这段代码其实可以写在viewController的基类里面，这样写一遍就可以每个地方都能缓存cell的高度了。详见demo。这样就完美了！
    return cell;
}
//读取使用cell高度
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = [self.height_tab objectForKey:@(indexPath.row)];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 100;
    }
}
//存储cell高度
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = @(cell.frame.size.height);
    
    [self.height_tab setObject:height forKey:@(indexPath.row)];
    
}
-(NSString *)Get_num:(NSInteger )num{
    NSString *str_mu = nil;
    str_mu = [NSMutableString stringWithFormat:@"这段代码其实可以写在viewController的基类里面，这样写一遍就可以每个地方都能缓存cell的高度了。详见demo。这样就完美了！"];
    NSString *str = [NSString stringWithFormat:@"这段代码其实可以写在viewController的基类里面，这样写一遍就可以每个地方都能缓存cell的高度了。详见demo。这样就完美了！"];
    for (int i = 0; i<num; i++) {
        
            str_mu = [str_mu stringByAppendingFormat:str];
        
        
    }
    return str_mu;
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
