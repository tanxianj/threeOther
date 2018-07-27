//
//  RadioViewController.m
//  
//
//  Created by bang on 2018/1/30.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "RadioViewController.h"

#import <TXJAllTools/AllTools.h>
#import "UIColor+APPcolor.h"
@interface RadioViewController ()<UITableViewDataSource,UITableViewDelegate>{
    UIButton *openset,*btnbackgroungcolor;
}

@end

@implementation RadioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *viewnew =[UIView new];
    viewnew.frame = CGRectMake(10, 70, 60, 60);
    viewnew.backgroundColor = [UIColor redColor];
    /*
    CGRect rect = viewnew.bounds;
    CGSize radio = CGSizeMake(30, 30);//圆角尺寸
    UIRectCorner corner = UIRectCornerTopLeft|UIRectCornerTopRight;//这只圆角位置
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radio];
    CAShapeLayer *masklayer = [[CAShapeLayer alloc]init];//创建shapelayer
    masklayer.frame = viewnew.bounds;
    masklayer.path = path.CGPath;//设置路径
    viewnew.layer.mask = masklayer;
     */
    //
    
//    [ViewRadioTool ViewRadioWith:viewnew radio:30.0 RectCornerType:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight];
    
//    [ViewRadioTool ViewRadioWith:viewnew RadioViewWithBouns:viewnew.bounds radio:30.0 RectCornerType:UIRectCornerTopLeft];
    [self.view addSubview:viewnew];
    openset = [UIButton buttonWithTitle:@"前往系统设置" buttonTitleFontSize:14.0 buttonTitleColor:[UIColor whiteColor] buttonBgColor:[UIColor redColor] buttonTextAlignment:NSTextAlignmentCenter];
    openset.frame = CGRectMake(10, 150, __kWidth-20, 44);
//    [openset buttonGradient:@[[UIColor colorWithHexString:@"FED101"],[UIColor colorWithHexString:@"FCAD00"]] buttonCGSize:CGSizeMake(__kWidth-20 ,44 ) ByGradientType:TXJDirectionTypeLeft2Right cornerRadius:YES];
//    [ViewRadioTool ViewRadioWith:openset  radio:30.0 RectCornerType:UIRectCornerTopRight|UIRectCornerTopLeft];
    
    
    [openset addTarget:self action:@selector(GotoSet) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:openset];
    UITableView *tabview = [[UITableView alloc]initWithFrame:CGRectMake(10, 200, __kWidth-20, 100)];
    tabview.backgroundColor = [UIColor redColor];
//    tabview.delegate = self;
//    tabview.dataSource = self;
//    [ViewRadioTool ViewRadioWith:tabview  radio:30.0 RectCornerType:UIRectCornerTopRight|UIRectCornerTopLeft];
    [self.view addSubview:tabview];
    ///
    btnbackgroungcolor = [UIButton buttonWithTitle:@"长安改变颜色" buttonTitleFontSize:14.0 buttonTitleColor:nil buttonBgColor:nil buttonTextAlignment:NSTextAlignmentCenter];
   [btnbackgroungcolor buttonGradient:@[[UIColor blackColor],[UIColor redColor]] buttonCGSize:CGSizeMake(self.view.bounds.size.width-20, 44) ByGradientType:TXJDirectionTypeLeft2Right cornerRadius:YES];
    UILongPressGestureRecognizer *longpgr = [[UILongPressGestureRecognizer alloc]init];
    
    [longpgr addTarget:self action:@selector(bagcolor:)];
    longpgr.minimumPressDuration = 0.5;
    [btnbackgroungcolor addGestureRecognizer:longpgr];
    [self.view addSubview:btnbackgroungcolor];
    [btnbackgroungcolor mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(tabview.mas_bottom).offset(20);
        make.centerX.equalTo(tabview);
        make.width.offset(__kWidth-20);
        make.height.offset(44);
    }];
    UILabel *lab = [UILabel LableInitWith:@"" LabFontSize:15.0 textColor:[UIColor redColor] textAlignment:NSTextAlignmentCenter];
    lab.backgroundColor = [UIColor blueColor];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnbackgroungcolor.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.height.offset(50);
    }];;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSDictionary *attributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    
    NSLog(@"容量%.2fG",[attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3)));
    NSLog(@"可用%.2fG",[attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3));
    lab.text = [NSString stringWithFormat:@"容量%.2fG/可用%.2fG",[attributes[NSFileSystemSize] doubleValue] / (powf(1024, 3)),[attributes[NSFileSystemFreeSize] doubleValue] / powf(1024, 3)];
    
}
-(void)SetNavOther{
    self.title = @"部分圆角";
    [self AddBackBtn];
    self.topLine.hidden = YES;
}
-(void)bagcolor:(UILongPressGestureRecognizer *)sender{
    UIColor *color = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    UIColor *color2 = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1.0];
    if (sender.state == UIGestureRecognizerStateBegan) {
        [btnbackgroungcolor buttonGradient:@[color ,color2] buttonCGSize:CGSizeMake(__kWidth-20, 44) ByGradientType:TXJDirectionTypeLeft2Right cornerRadius:YES];
    }
}
-(void)GotoSet{
    //iOS8之后
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    
    
    //如果App没有添加权限，显示的是设定界面。如果App有添加权限（例如通知），显示的是App的设定界面。
    /*
     //iOS8之前
     //先添加一个url type如下图，在代码中调用如下代码,即可跳转到设置页面的对应项
     [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
     
     可选值如下：
     About — prefs:root=General&path=About
     Accessibility — prefs:root=General&path=ACCESSIBILITY
     Airplane Mode On — prefs:root=AIRPLANE_MODE
     Auto-Lock — prefs:root=General&path=AUTOLOCK
     Brightness — prefs:root=Brightness
     Bluetooth — prefs:root=General&path=Bluetooth
     Date & Time — prefs:root=General&path=DATE_AND_TIME
     FaceTime — prefs:root=FACETIME
     General — prefs:root=General
     Keyboard — prefs:root=General&path=Keyboard
     iCloud — prefs:root=CASTLE
     iCloud Storage & Backup — prefs:root=CASTLE&path=STORAGE_AND_BACKUP
     International — prefs:root=General&path=INTERNATIONAL
     Location Services — prefs:root=LOCATION_SERVICES
     Music — prefs:root=MUSIC
     Music Equalizer — prefs:root=MUSIC&path=EQ
     Music Volume Limit — prefs:root=MUSIC&path=VolumeLimit
     Network — prefs:root=General&path=Network
     Nike + iPod — prefs:root=NIKE_PLUS_IPOD
     Notes — prefs:root=NOTES
     Notification — prefs:root=NOTIFICATI*****_ID
     Phone — prefs:root=Phone
     Photos — prefs:root=Photos
     Profile — prefs:root=General&path=ManagedConfigurationList
     Reset — prefs:root=General&path=Reset
     Safari — prefs:root=Safari
     Siri — prefs:root=General&path=Assistant
     Sounds — prefs:root=Sounds
     Software Update — prefs:root=General&path=SOFTWARE_UPDATE_LINK
     Store — prefs:root=STORE
     Twitter — prefs:root=TWITTER
     Usage — prefs:root=General&path=USAGE
     VPN — prefs:root=General&path=Network/VPN
     Wallpaper — prefs:root=Wallpaper
     Wi-Fi — prefs:root=WIFI
     
     作者：iOS_小松哥
     链接：https://www.jianshu.com/p/4523eafb4cd4
     來源：简书
     著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
        
    }
    cell.textLabel.text =@"11";
    return cell;
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
