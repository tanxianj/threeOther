//
//  HomeTwoViewController.m
//  
//
//  Created by bang on 2018/3/21.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "HomeTwoViewController.h"
#import "Super_ViewController.h"

@interface HomeTwoViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,copy)NSArray *arrayTitle;
/*
 iOS常用的一些类库
 
 iOS笔记  2016-07-25
 都是在网上收集到的，希望对大家有帮助。
 
 一、第三方插件
 
 1：基于响应式编程思想的oc
 地址：https://github.com/ReactiveCocoa/ReactiveCocoa
 2：hud提示框
 地址：https://github.com/jdg/MBProgressHUD
 3：XML/HTML解析
 地址：https://github.com/topfunky/hpple
 4：有文字输入时，能根据键盘是否弹出来调整自身显示内容的位置
 地址：https://github.com/michaeltyson/TPKeyboardAvoiding
 5：状态栏提示框
 地址：https://github.com/jaydee3/JDStatusBarNotification
 6：block工具包。将很多需要用delegate实现的方法整合成了block的形式
 地址：https://github.com/zwaldowski/BlocksKit
 7：图片加载
 地址：https://github.com/rs/SDWebImage
 8：正则表达式
 地址：https://github.com/wezm/RegexKitLite
 9：Masonry代码布局
 地址：https://github.com/SnapKit/Masonry
 10：弹出窗
 地址：https://github.com/sberrevoets/SDCAlertView
 11：Button的样式
 地址：https://github.com/mattlawer/BButton
 12：验证网络连接状态
 地址：https://github.com/tonymillion/Reachability
 13：自动计算表格行高
 地址：https://github.com/forkingdog/UITableView-FDTemplateLayoutCell
 14：动画效果的启动页
 地址：https://github.com/IFTTT/JazzHands
 15：iOS快速简单集成国内三大平台分享
 地址：https://github.com/xumeng/XMShareModule
 16：五项能力值展示的五边形
 地址：https://github.com/dsxNiubility/SXFiveScoreShow
 17：自动识别网址号码邮箱和表情的label
 地址：https://github.com/molon/MLEmojiLabel
 18：IM对话功能的封装
 地址：https://github.com/ZhipingYang/UUChatTableView
 19：字典转模型框架
 地址：https://github.com/CoderMJLee/MJExtension
 20：下拉上拉刷数据
 地址：https://github.com/CoderMJLee/MJRefresh
 21：表格行左右划动菜单
 地址：https://github.com/MortimerGoro/MGSwipeTableCell
 22：图文混搭
 地址:https://github.com/zhouande/TLAttributedLabel
 23：可以简单展示在UINavigationBar下方，类似Music app的播放列表视图，弹出菜单视图
 地址：https://github.com/DrummerB/BFNavigationBarDrawer
 24：比如筛选、模糊、优化、蒙版、调整大小、旋转以及保存等等。同时还提供了一个UIImageView子类从URL异步加载图片，并在下载完毕时展示图片。
 地址：https://github.com/Nyx0uf/NYXImagesKit
 25：底部TabBar
 地址：https://github.com/robbdimitrov/RDVTabBarController
 26：表情面版
 地址：https://github.com/ayushgoel/AGEmojiKeyboard
 27：记录框架
 地址：https://github.com/CocoaLumberjack/CocoaLumberjack
 28：IOS与javascript交互
 地址：https://github.com/marcuswestin/WebViewJavascriptBridge
 29：图表统计展示
 地址：https://github.com/kevinzhow/PNChart
 30：appStore评分
 地址：https://github.com/arashpayan/appirater
 31：iOS-Categories 扩展类大全
 地址：https://github.com/shaojiankui/IOS-Categories
 32：扫描二维码，仿微信效果，带有扫描条
 地址：https://github.com/JxbSir/JxbScanQR
 33：动效弹出视图(弹出窗里面为文字，可以定义弹出的方向，及显示的时间)--AMPopTip
 地址：https://github.com/andreamazz/AMPopTip
 34：基于Masonry自动计算行高扩展
 地址：https://github.com/632840804/HYBMasonryAutoCellHeight
 35：模仿新浪微博弹出菜单
 地址：https://github.com/wwdc14/HyPopMenuView
 36：搜索历史标签
 地址：https://github.com/zhiwupei/SearchHistory
 37：快速集成新手引导的类库
 地址：https://github.com/StrongX/XSportLight
 38：设置页面的封装
 地址：https://github.com/renzifeng/ZFSetting
 39：带箭头的弹出视图插件
 地址：https://github.com/xiekw2010/DXPopover
 40：下拉菜单插件
 地址：https://github.com/dopcn/DOPDropDownMenu/
 41：表格空白提示插件
 地址：https://github.com/dzenbot/DZNEmptyDataSet
 42：给任意UIView视图四条边框加上阴影，可以自定义阴影的颜色、粗细程度、透明程度以及位置（上下左右边框）
 地址：https://github.com/Seitk/UIView-Shadow-Maker
 43：不错的日期时间插件
 地址：https://github.com/CoderXL/UUDatePicker
 44：底部弹出选择
 地址：https://github.com/skywinder/ActionSheetPicker-3.0
 45：比较不错的引导页面插件
 地址：https://github.com/ealeksandrov/EAIntroView
 46：两个APP跳转的插件
 地址：https://github.com/usebutton/DeepLinkKit
 47：本地存取NSUserDefaults插件
 地址：https://github.com/gangverk/GVUserDefaults
 48：NSArray 和 NSDictionary关于LINQ的操作方式，封装一些常用的操作
 地址：https://github.com/ColinEberhardt/LinqToObjectiveC
 49：可以监控网络请求的内容
 地址：https://github.com/coderyi/NetworkEye
 50：时间帮助插件，可以快速获取时间，比较，增加等操作
 地址：https://github.com/MatthewYork/DateTools
 51：不错的链式动作
 地址：https://github.com/jhurray/JHChainableAnimations
 52：弹出层视图，背景效果（可以自定义视图的内容）
 地址：https://github.com/HJaycee/JCAlertView
 53：圆形进度条的显示，中间可显示值
 地址：https://github.com/mdinacci/MDRadialProgress
 54：很帅的数据加载动画（可以用于数据列表加载的展现）
 地址：https://github.com/NghiaTranUIT/FeSpinner
 55：一个开源的AFnetworking上层的封装（猿题库等运用）
 地址：https://github.com/yuantiku/YTKNetwork
 56：CBStoreHouseRefreshControl：一个效果很酷炫的下拉刷新控件
 地址：https://github.com/coolbeet/CBStoreHouseRefreshControl
 57：AFNetworking-RACExtensions:针对ReactiveCocoa的AF封装
 地址：https://github.com/CodaFi/AFNetworking-RACExtensions
 58：模糊效果（毛玻璃）
 地址：https://github.com/nicklockwood/FXBlurView
 
 二、源代码实例
 
 1：Coding.net客户端
 地址：https://coding.net/u/coding/p/Coding-iOS/git
 2：高仿美团iOS版
 地址：https://github.com/lookingstars/meituan
 3：模仿网易新闻做的精仿网易新闻
 地址：https://github.com/dsxNiubility/SXNews
 4：支付宝高仿版
 地址：https://github.com/gsdios/GSD_ZHIFUBAO
 5：高仿百度传课iOS版
 地址：https://github.com/lookingstars/chuanke
 6：模仿一元云购
 地址：https://github.com/JxbSir/YiYuanYunGou
 7：wordpress源代码
 地址：https://github.com/wordpress-mobile/WordPress-iOS
 8：v2ex源代码（文章类型，若报SVProgressHUD错，则把Podfile中的SVProgressHUD移除）
 地址：https://github.com/singro/v2ex
 9：PHPHub客户端(IOS8.0以上)
 地址：https://github.com/Aufree/phphub-ios
 10：快速搭建项目源代码
 地址：https://github.com/wujunyang/MobileProject
 
 三、辅助软件
 
 1：XCODE文档注解插件VVDocumenter
 地址：https://github.com/onevcat/VVDocumenter-Xcode
 2：将JSON格式化输出为模型的属性
 地址：https://github.com/EnjoySR/ESJsonFormat-Xcode
 3：图片提示插件
 地址：https://github.com/ksuther/KSImageNamed-Xcode
 4：图片转换插件
 地址：https://github.com/rickytan/RTImageAssets
*/
@end

@implementation HomeTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView.tableFooterView = [UIView new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrayTitle.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Main_TableViewCell *cell = [Main_TableViewCell SetCell];
    cell.title_lab.text = self.arrayTitle[indexPath.row][@"title"];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * isStoryboard = self.arrayTitle[indexPath.row][@"isStoryboard"];
    if ([isStoryboard isEqualToString:@"NO"]) {
        UIViewController *view = (UIViewController *)[[NSClassFromString(self.arrayTitle[indexPath.row][@"Controller"]) alloc]init];
        view.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:view animated:YES];
    }else{
        [self storyboardPush_storyboardName:self.arrayTitle[indexPath.row][@"StoryboardName"]?self.arrayTitle[indexPath.row][@"StoryboardName"]:@"MainTwo" sbIdentifier:self.arrayTitle[indexPath.row][@"Controller"]];
    }
    
}
-(NSArray *)arrayTitle{
    if (!_arrayTitle) {
        
        _arrayTitle = @[
                        //非Storyboard 页面
                        @{@"title":@"分段控制",@"Controller":@"FenDuanViewController",@"isStoryboard":@"NO"},
                        @{@"title":@"链式编程测试",@"Controller":@"lanshitestViewController",@"isStoryboard":@"NO"},
                        @{@"title":@"YYModel",@"Controller":@"YYModelViewController",@"isStoryboard":@"NO"},
                        
                        @{@"title":@"UNLIFE首页测试",@"Controller":@"UNLIFEHomeViewController",@"isStoryboard":@"NO"},
//                        @{@"title":@"",@"Controller":@"",@"isStoryboard":@"NO"},
                        
                        //Storyboard 页面
                        
//                        @{@"title":@"",@"Controller":@"",@"isStoryboard":@"YES",@"StoryboardName":@"MainTwo"},
  @{@"title":@"运行时测试",@"Controller":@"RunTimeTestViewController",@"isStoryboard":@"YES",@"StoryboardName":@"MainTwo"},
  @{@"title":@"系统自带字体",@"Controller":@"familyNamesViewController",@"isStoryboard":@"YES",@"StoryboardName":@"MainTwo"},
                        ];
    }
    return _arrayTitle;
}
-(void)storyboardPush_storyboardName:(NSString *)sbName sbIdentifier:(NSString *)identifier{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:sbName bundle:[NSBundle mainBundle]];
   Super_ViewController  *vc = [sb instantiateViewControllerWithIdentifier:identifier];
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
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
