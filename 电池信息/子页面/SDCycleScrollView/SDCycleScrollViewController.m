
//
//  SDCycleScrollViewController.m
//  
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "SDCycleScrollViewController.h"

@interface SDCycleScrollViewController ()<SDCycleScrollViewDelegate>
@property (strong,nonatomic)NSArray *netImages;  //网络图片
@property (strong,nonatomic)SDCycleScrollView *cycleScrollView;//轮播器
@property (weak, nonatomic) IBOutlet UILabel *Gdlab;
@property (weak, nonatomic) IBOutlet UILabel *Djlab;


@end

@implementation SDCycleScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"SDCycleScrollView";
    self.edgesForExtendedLayout = 0;
    //创建一个UIButton
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    //设置UIButton的图像
    [backButton setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    //给UIButton绑定一个方法，在这个方法中进行popViewControllerAnimated
    [backButton addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    //然后通过系统给的自定义BarButtonItem的方法创建BarButtonItem
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    //覆盖返回按键
    self.navigationItem.leftBarButtonItem = backItem;
    /*
    作者：dalianer
    链接：http://www.jianshu.com/p/c229dc1aa325
    來源：简书
    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    [self ScrollNetWorkImages];
}
-(void)backItemClick{
    [self.navigationController popViewControllerAnimated:YES];
}
/**
 *  轮播网络图片
 */

-(void)ScrollNetWorkImages{
    
    /** 测试本地图片数据*/
    CGRect rect = CGRectMake(0,0, self.view.bounds.size.width, 150);
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:rect delegate:self placeholderImage:[UIImage imageNamed:@"PlacehoderImage.png"]];
    
    //设置网络图片数组
    self.cycleScrollView.imageURLStringsGroup = self.netImages;
    
    //设置图片视图显示类型
    self.cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    
    //设置轮播视图的分页控件的显示
    self.cycleScrollView.showPageControl = YES;
    
    /** 自动滚动间隔时间,默认2s */
    self.cycleScrollView.autoScrollTimeInterval = 3;
    
    //设置轮播视图分也控件的位置
    self.cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    
    //当前分页控件小圆标图片
//    self.cycleScrollView.pageDotImage = [UIImage imageNamed:@"pageCon.png"];
    
    //其他分页控件小圆标图片
//    self.cycleScrollView.currentPageDotImage = [UIImage imageNamed:@"pageConSel.png"];
    
    
    [self.view addSubview:self.cycleScrollView];
}
#pragma mark - 代理方法
/** 点击图片回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    NSLog(@"%ld",index);
    _Djlab.text = [NSString stringWithFormat:@"图片点击第%li张",index+1];
}

/** 图片滚动回调 */
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
    NSLog(@"%ld",index);
    _Gdlab.text = [NSString stringWithFormat:@"图片滚动到第%li张",index+1];
}
-(NSArray *)netImages{
    if (!_netImages) {
        _netImages = @[
                       @"https://img11.360buyimg.com/da/jfs/t12844/223/1392879138/192138/6b98e666/5a1f686cNfe9ad223.jpg",
                       @"https://img1.360buyimg.com/da/jfs/t13747/28/1020241677/122281/1dc8803b/5a17f1f1Ned39359a.jpg",
                       @"https://img13.360buyimg.com/da/jfs/t13411/296/1256862837/92958/eae91a20/5a1d17b8N6c40de85.jpg",
                       @"https://img12.360buyimg.com/babel/jfs/t13414/163/1268157905/160783/d2dd1d29/5a1e25e3Na797d3ce.jpg",
                       @"https://img14.360buyimg.com/babel/jfs/t12967/60/1280610066/79223/82004b30/5a1e1d3bN90c8159a.jpg",
                       @"https://img10.360buyimg.com/babel/jfs/t13495/258/1336261421/149161/73e0bfe0/5a1e9a55N5640a526.jpg",
                       @"https://img11.360buyimg.com/babel/jfs/t12274/206/1338416577/91497/74f58a14/5a1e4f9fN6fd538cb.jpg"
                       ];
        
    }
    return _netImages;
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
