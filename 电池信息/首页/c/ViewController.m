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
#import "UpimageArrayViewController.h"
#import "BUttonViewContorller.h"
#import "UItableViewinsets.h"
#import "MusicViewController.h"
#import "lianshiViewController.h"
#import "TXJPromptViewController.h"




@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tab_view;
@property (nonatomic,strong)NSArray *arry_title;
@property (nonatomic, strong) NSTimer       *timer;
@property (nonatomic, assign) CGFloat        time;
@end

@implementation ViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //        dispatch_group_t group = dispatch_group_create();
    //        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //
    //        dispatch_group_async(group, queue, ^{
    //            dispatch_group_enter(group);
    //
    //            dispatch_group_leave(group);
    //
    //        });
    //        dispatch_group_notify(group, queue, ^{
    //            dispatch_async(dispatch_get_main_queue(), ^{
    //
    //            });
    //        });
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{
        dispatch_group_enter(group);//开始
        XJLog(@"哈哈1");
        dispatch_group_leave(group);//结束
    });
    
    dispatch_group_notify(group, queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            
        });
    });
    dispatch_wait(group, DISPATCH_TIME_FOREVER); // 阻塞线程  DISPATCH_TIME_FOREVER group 函数不结束就不会执行后面的所有东西
    XJLog(@"哈哈2");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"第三方相关";
    self.tab_view.tableFooterView = [UIView new];
    [self updateTimer];
    /* 延迟方式二
        [[NSRunLoop currentRunLoop] cancelPerformSelector:@selector(Timedelay) target:self argument:nil];
        [self.timer invalidate];
        self.timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:5.0]
                                                     interval:0 target:self selector:@selector(Timedelay) userInfo:nil repeats:NO];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
     */
}
- (void)updateTimer {
    self.time = 4.f;
    [self.timer invalidate];
    self.timer = nil;
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
#pragma mark - getter

- (NSTimer *)timer {
    if (!_timer) {
        __weak typeof(self) weakSelf = self;
        _timer = [NSTimer timerWithTimeInterval:0.1 target:weakSelf selector:@selector(changeNumberToServer) userInfo:nil repeats:YES];
    }
    return _timer;
}

- (void)changeNumberToServer {
    self.time -= 0.1;
    if (self.time < 0.009 && self.time > -0.009) {
       XJLog(@"ZPFlexible 4 is  %.2f",ZPFlexible(20));
    }
}
/* 延迟方式二
-(void)Timedelay{
    XJLog(@"ZPFlexible 5 is  %.2f",ZPFlexible(20));
}
 */
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
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0:{
            
            ViewController_boolk *vim_boolk=[TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"boolk_v"];
            vim_boolk.Get_lab=^(NSString *str){
//                self.title = str.length>0?str:@"第三方相关";
            };
            vim_boolk.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vim_boolk animated:YES];
            
            }
            break;
    
        case 1:{
            
            Model_ViewController *model_v = [TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"model_v"];
            model_v.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:model_v animated:YES];
            }
            break;
        case 2:{
            
            Tab_qk_ViewController *tab_qk = [TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"qk_v"];
            tab_qk.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:tab_qk animated:YES];
            }
            break;
        case 3:{
            
            SDCycleScrollViewController *sdc = [TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"sdc_v"];
            sdc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:sdc animated:YES];
        }
            break;
        case 4:{
            GoBack_ViewController *goback = [TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"goback"];
            goback.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:goback animated:YES];
            
        }
            break;
        case 5:{
            Storyboard_cz_ViewController *strcz = [TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"stcz"];
            strcz.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:strcz animated:YES];
        }
            break;
        case 6:{
            UITableView_hegiht_ViewController *tab_height = [TXJUIStoryboard  instantiateViewControllerWithIdentifier:@"tab_height"];
            tab_height.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:tab_height animated:YES];
            
        }
            break;
        case 7:{
            Cell_zdViewController *cell_open = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"cell_zd"];
            cell_open.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cell_open animated:YES];
        }
            break;
        case 8:{
            Cell_showAllViewController *cellshow = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"cell_show"];
            cellshow.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cellshow animated:YES];
        }
            break;
        case 9:{
            YJProgressHUD_ViewController * yjhud =[TXJUIStoryboard instantiateViewControllerWithIdentifier:@"yjhud"];
            yjhud.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:yjhud animated:YES];
        }
            break;
        case 10:{
            FirstViewController *mbjd = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"mbjd"];
            mbjd.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:mbjd animated:YES];
        }
            break;
        case 11:{
            Pubuliu_ViewController *pubuliu = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"pubuliu"];
            pubuliu.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pubuliu animated:YES];
        }
            break;
        case 12:{
            ViewController *fwb = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"fwb"];
            fwb.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:fwb animated:YES];
        }
            break;
        case 13:{
            XieyiViewController *xieyi = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"xiyi1"];
            xieyi.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:xieyi animated:YES];
        }
            break;
        case 14:{
            WebLoadingViewController *xieyi = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"web"];
            xieyi.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:xieyi animated:YES];
        }
            break;
        case 15:{
            View_tool_ViewController *view_tool = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"view_tool"];
            view_tool.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:view_tool animated:YES];
        }
            break;
        case 16:{
           Super_ViewController* name = [(Super_ViewController *)[NSClassFromString(@"View_wg_test_Viewcontroller") alloc] init];
            name.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:name animated:YES];
        }
            break;
        case 17:{
            CALayerViewController* name = [[CALayerViewController alloc] init];
            name.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:name animated:YES];
        }
            break;
        case 18:{
            NavCollectionView* nav = [[NavCollectionView alloc] init];
            nav.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:nav animated:YES];
        }
            break;
//
        case 19:{
            goodsEvaluationViewController* nav = [[goodsEvaluationViewController alloc] init];
            nav.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:nav animated:YES];
        }
            break;
        case 20:
        {
            EvaluationListViewController *EvaluationList = [[EvaluationListViewController alloc]init];
            EvaluationList.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:EvaluationList animated:YES];
        }
            break;
        case 21:{
            RadioViewController *redio = [[RadioViewController alloc]init];
            redio.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:redio animated:YES];
        }
            break;
        case 22:{
            
        }
            break;
        case 23:{
            RemoveListViewController *removelist = [[RemoveListViewController alloc]init];
            removelist.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:removelist animated:YES];
        }
            break;
        case 24:{
            GoodsViewController *goods = [[GoodsViewController alloc]init];
            goods.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:goods animated:YES];
        }
            break;
            case 25:{
                UpimageArrayViewController *upimg = [[UpimageArrayViewController alloc]init];
                upimg.hidesBottomBarWhenPushed = YES;
                [self.navigationController pushViewController:upimg animated:YES];
        }
            break;
        case 26:{
            BUttonViewContorller *button = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"buttonsect"];
            button.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:button animated:YES];
        }
            
            break;
        case 27:{
            UItableViewinsets *tab = [[UItableViewinsets alloc]init];
            tab.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:tab animated:YES];
        }
            break;
            case 28:
        {
             MusicViewController *music = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"music"];
            music.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:music animated:YES];
        }
            break;
        case 29:
        {
            lianshiViewController *lianshi = [[lianshiViewController alloc]init];
            lianshi.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:lianshi animated:YES];
        }
            break;
        case 30:{
            TXJPromptViewController *vc = [TXJUIStoryboard instantiateViewControllerWithIdentifier:@"TXJPromptViewController"];
            vc.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

-(NSArray *)arry_title{
    if (!_arry_title) {
        _arry_title = @[@"Block回调",@"Model-Table",@"表格滑动被清空",@"SDCycleScrollView",@"自定义返回-保留系统返回手势",@"Storyboard传值",@"UITableView自适应高度",@"cell折叠",@"cell点击展示更多",@"YJProgressHUD",@"MBProgressHUD+JDragon",@"瀑布流",@"富文本",@"协议回传==Block",@"网页加载进度",@"ViewController工具类",@"网格",@"CALayer_Test",@"NavCollectionView",@"商品评价",@"评价列表",@"部分圆角",@"空",@"列表删除",@"商品增删",@"多图上传测试",@"按钮状态",@"表格偏移",@"本地音乐播放",@"链式",@"自定义提示框Block按钮点击事件"];
    }
    return _arry_title;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
