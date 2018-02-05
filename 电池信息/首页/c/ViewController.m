//
//  ViewController.m
//  电池信息
//
//  Created by MAc on 2017/11/28.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "ViewController.h"
#import "Storyboard_cz_ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tab_view;
@property (nonatomic,strong)NSArray *arry_title;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"第三方相关";
    self.tab_view.tableFooterView = [UIView new];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.arry_title.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Main_TableViewCell *cell = [Main_TableViewCell SetCell];
    cell.title_lab.text = _arry_title[indexPath.row];
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            
            ViewController_boolk *vim_boolk=[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"boolk_v"];
            vim_boolk.Get_lab=^(NSString *str){
                self.title = str.length>0?str:@"第三方相关";
            };
            [self.navigationController pushViewController:vim_boolk animated:YES];
            }
            break;
    
        case 1:{
            
            Model_ViewController *model_v = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"model_v"];
            [self.navigationController pushViewController:model_v animated:YES];
            }
            break;
        case 2:{
            
            Tab_qk_ViewController *tab_qk = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"qk_v"];
            [self.navigationController pushViewController:tab_qk animated:YES];
            }
            break;
        case 3:{
            
            SDCycleScrollViewController *sdc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"sdc_v"];
            [self.navigationController pushViewController:sdc animated:YES];
        }
            break;
        case 4:{
            GoBack_ViewController *goback = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"goback"];
            [self.navigationController pushViewController:goback animated:YES];
            
        }
            break;
        case 5:{
            Storyboard_cz_ViewController *strcz = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"stcz"];
            [self.navigationController pushViewController:strcz animated:YES];
        }
            break;
        case 6:{
            UITableView_hegiht_ViewController *tab_height = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"tab_height"];
            [self.navigationController pushViewController:tab_height animated:YES];
            
        }
            break;
        case 7:{
            Cell_zdViewController *cell_open = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"cell_zd"];
            [self.navigationController pushViewController:cell_open animated:YES];
        }
            break;
        case 8:{
            Cell_showAllViewController *cellshow = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"cell_show"];
            [self.navigationController pushViewController:cellshow animated:YES];
        }
            break;
        default:
            break;
    }
}

-(NSArray *)arry_title{
    if (!_arry_title) {
        _arry_title = @[@"Bollk回调",@"Model-Table",@"表格滑动被清空",@"SDCycleScrollView",@"自定义返回-保留系统返回手势",@"Storyboard传值",@"UITableView自适应高度",@"cell折叠",@"cell点击展示更多"];
    }
    return _arry_title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
