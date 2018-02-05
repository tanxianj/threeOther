//
//  ViewController.m
//  电池信息
//
//  Created by MAc on 2017/11/28.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "ViewController.h"
#import "Storyboard_cz_ViewController.h"
#import "XieyiViewController.h"
#import "WebLoadingViewController.h"
#import "View_tool_ViewController.h"
#import "NavCollectionView.h"
#import "goodsEvaluationViewController.h"
#import "EvaluationListViewController.h"
#import "RadioViewController.h"
//#import "FZPXViewController.h"
#import "RemoveListViewController.h"
#import "GoodsViewController.h"



@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tab_view;
@property (nonatomic,strong)NSArray *arry_title;
@property (nonatomic, strong) NSTimer       *timer;
@property (nonatomic, assign) CGFloat        time;
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"第三方相关";
    self.tab_view.tableFooterView = [UIView new];
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
    [self updateTimer];
    /**/
//        [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(Timedelay) target:self argument:nil];
//        [self.timer invalidate];
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:5.0]
                                                     interval:0 target:self selector:@selector(Timedelay) userInfo:nil repeats:NO];
//        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    
}
- (void)updateTimer {
    self.time = 4.f;
    [self.timer invalidate];
    self.timer = nil;
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)changeNumberToServer {
    self.time -= 0.1;
    if (self.time < 0.009 && self.time > -0.009) {
       XJLog(@"ZPFlexible 4 is  %.2f",ZPFlexible(20));
    }
}
-(void)Timedelay{
    XJLog(@"ZPFlexible 5 is  %.2f",ZPFlexible(20));
}
/*
-(void)SetNavOther{
    self.title = @"第三方相关";
    [self AddBackBtn];
}
 */
-(void)SetView{
    self.tab_view.backgroundColor = [UIColor redColor];
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
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
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
//                self.title = str.length>0?str:@"第三方相关";
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
        case 9:{
            YJProgressHUD_ViewController * yjhud =[[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"yjhud"];
            [self.navigationController pushViewController:yjhud animated:YES];
        }
            break;
        case 10:{
            FirstViewController *mbjd = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"mbjd"];
            [self.navigationController pushViewController:mbjd animated:YES];
        }
            break;
        case 11:{
            Pubuliu_ViewController *pubuliu = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"pubuliu"];
            [self.navigationController pushViewController:pubuliu animated:YES];
        }
            break;
        case 12:{
            ViewController *fwb = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"fwb"];
            [self.navigationController pushViewController:fwb animated:YES];
        }
            break;
        case 13:{
            XieyiViewController *xieyi = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"xiyi1"];
            [self.navigationController pushViewController:xieyi animated:YES];
        }
            break;
        case 14:{
            WebLoadingViewController *xieyi = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"web"];
            [self.navigationController pushViewController:xieyi animated:YES];
        }
            break;
        case 15:{
            View_tool_ViewController *view_tool = [[UIStoryboard storyboardWithName:@"Main" bundle:nil]instantiateViewControllerWithIdentifier:@"view_tool"];
            [self.navigationController pushViewController:view_tool animated:YES];
        }
            break;
        case 16:{
           Super_ViewController* name = [(Super_ViewController *)[NSClassFromString(@"View_wg_test_Viewcontroller") alloc] init];
            [self.navigationController pushViewController:name animated:YES];
        }
            break;
        case 17:{
            CALayerViewController* name = [[CALayerViewController alloc] init];
            [self.navigationController pushViewController:name animated:YES];
        }
            break;
        case 18:{
            NavCollectionView* nav = [[NavCollectionView alloc] init];
            [self.navigationController pushViewController:nav animated:YES];
        }
            break;
//
        case 19:{
            goodsEvaluationViewController* nav = [[goodsEvaluationViewController alloc] init];
            [self.navigationController pushViewController:nav animated:YES];
        }
            break;
        case 20:
        {
            EvaluationListViewController *EvaluationList = [[EvaluationListViewController alloc]init];
            [self.navigationController pushViewController:EvaluationList animated:YES];
        }
            break;
        case 21:{
            RadioViewController *redio = [[RadioViewController alloc]init];
            [self.navigationController pushViewController:redio animated:YES];
        }
            break;
        case 22:{
//            FZPXViewController *fzpx = [[FZPXViewController alloc]init];
//            [self.navigationController pushViewController:fzpx animated:YES];
        }
            break;
        case 23:{
            RemoveListViewController *removelist = [[RemoveListViewController alloc]init];
            [self.navigationController pushViewController:removelist animated:YES];
        }
            break;
        case 24:{
            GoodsViewController *goods = [[GoodsViewController alloc]init];
            [self.navigationController pushViewController:goods animated:YES];
        }
            break;
        default:
            break;
    }
}

-(NSArray *)arry_title{
    if (!_arry_title) {
        _arry_title = @[@"Block回调",@"Model-Table",@"表格滑动被清空",@"SDCycleScrollView",@"自定义返回-保留系统返回手势",@"Storyboard传值",@"UITableView自适应高度",@"cell折叠",@"cell点击展示更多",@"YJProgressHUD",@"MBProgressHUD+JDragon",@"瀑布流",@"富文本",@"协议回传==Block",@"网页加载进度",@"ViewController工具类",@"网格",@"CALayer_Test",@"NavCollectionView",@"商品评价",@"评价列表",@"部分圆角",@"分组排序",@"列表删除",@"商品增删"];
    }
    return _arry_title;
}
#pragma mark - getter

- (NSTimer *)timer {
    if (!_timer) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer timerWithTimeInterval:0.1 target:weakSelf selector:@selector(changeNumberToServer) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
