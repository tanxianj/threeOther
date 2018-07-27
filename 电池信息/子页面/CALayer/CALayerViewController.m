//
//  CALayerViewController.m
//  
//
//  Created by bang on 2018/1/23.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "CALayerViewController.h"
#import "QRView.h"
#import "UIImage+ImageSize.h"
#import <AVFoundation/AVFoundation.h>
#import "WebLoadingViewController.h"
@interface CALayerViewController () <AVCaptureMetadataOutputObjectsDelegate, AVCaptureVideoDataOutputSampleBufferDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>{
    UIImagePickerController *_imagePickerController;
}
@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *videoPreviewLayer;
@property (nonatomic,strong) UIView *layerView1;
@property (nonatomic, strong) UIViewController *currentVC;
@property (nonatomic, strong)UIButton *open_or_down;
@property (nonatomic,strong) QRView *QrView;
@property (nonatomic,assign) BOOL openOrDown;
/** 是否开启 log 打印，默认为 YES */
@property (nonatomic, assign) BOOL isOpenLog;
@property (nonatomic, strong) NSString *detectorString;
@end

@implementation CALayerViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.session startRunning];
}
-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:AVCaptureSessionDidStartRunningNotification object:nil];
    [self.session stopRunning];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self SetCALayer];
    [self QrCode];
}
-(void)SetNavOther{
    self.title = @"扫一扫";
    [self AddBackBtn];
    self.topLine.hidden = YES;
    
    self.navigationItem.rightBarButtonItem = [self setupNavigationItemWithLeft:Nav_Right_Item imageName:nil title:@"相册" callBack:^{
        //NSLog(@"相册");
        TZImagePickerController *vc = [[TZImagePickerController alloc] initWithMaxImagesCount:1 delegate:nil];
        vc.allowPickingVideo  =NO;
        [vc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
            if (photos.count) {
                UIImage *image = photos[0];
                [self scanQRCodeWithImage:image];
            }
        }];
        [self.navigationController presentViewController:vc animated:YES completion:nil];
    }];
}
//相册

- (void)scanQRCodeWithImage:(UIImage *)image{
    //2.初始化一个监测器
    CIDetector *detector = [CIDetector detectorOfType:CIDetectorTypeQRCode context:nil options:@{ CIDetectorAccuracy : CIDetectorAccuracyHigh }];
    //监测到的结果数组
    NSArray *features = [detector featuresInImage:[CIImage imageWithCGImage:image.CGImage]];
    if (features.count >=1) {
        //成功
        CIQRCodeFeature *feature = [features objectAtIndex:0];
        NSString *scannedResult = feature.messageString;
        XJLog(@"scannedResult is %@",scannedResult);
        [MBProgressHUD showInfoMessage:[NSString stringWithFormat:@"扫描结果：%@",scannedResult]];
    }else{
        //失败失败
    }
    
}
//相机
-(void)SetCALayer{
    self.view.backgroundColor = [UIColor whiteColor];
    
    _QrView = [[QRView alloc]initWithFrame:CGRectMake(0, 0, __kWidth, __kHeight-64)];
    _QrView.backgroundColor  = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    _QrView.transparentArea = CGSizeMake(__kWidth -120, __kWidth -120);
    [self.view addSubview:_QrView];
     _open_or_down= [UIButton buttonWithType:UIButtonTypeCustom];
    [_open_or_down setImage:[UIImage imageNamed:@"scan_flashlight_guan"] forState:UIControlStateNormal];
    [_open_or_down addTarget:self action:@selector(ClickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_open_or_down];
    [_open_or_down mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.offset(40);
        
        make.centerX.equalTo(self.view.mas_centerX);
        NSUInteger bottom =( __kHeight -64 )/2 + _QrView.transparentArea.width/2 - 50;
        make.top.equalTo(self.view).offset(bottom);
    }];
    UILabel *lab = [UILabel new];
    lab.text = @"将二维码放入框内即可扫描";
    lab.textAlignment = NSTextAlignmentCenter;
    [lab setTextColor:[UIColor whiteColor]];
    [lab setFont:[UIFont systemFontOfSize:15.0]];
    [self.view addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        NSUInteger bottom =( __kHeight -64 )/2 + _QrView.transparentArea.width/2;
        make.top.offset(bottom);
        make.left.equalTo(self.view.mas_left).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-10);
        make.height.offset(45);
    }];
    
    
}
-(void)QrCode{
    // 1、 获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    dispatch_sync(dispatch_get_main_queue(), ^{
                        NSArray *arr = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
                        [self setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:arr currentController:self];
                    });
                    // 用户第一次同意了访问相机权限
                    NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    
                } else {
                    // 用户第一次拒绝了访问相机权限
                    NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                }
            }];
        } else if (status == AVAuthorizationStatusAuthorized) { // 用户允许当前应用访问相机
            NSArray *arr = @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code, AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code];
            // AVCaptureSessionPreset1920x1080 推荐使用，对于小型的二维码读取率较高
            [self setupSessionPreset:AVCaptureSessionPreset1920x1080 metadataObjectTypes:arr currentController:self];
        } else if (status == AVAuthorizationStatusDenied) { // 用户拒绝当前应用访问相机
            NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
            NSString *str =[NSString stringWithFormat:@"请去-> [设置 - 隐私 - 相机 - %@] 打开访问开关",[infoDictionary objectForKey:@"CFBundleDisplayName"]];
            UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:str preferredStyle:(UIAlertControllerStyleAlert)];
            UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [alertC addAction:alertA];
            [self presentViewController:alertC animated:YES completion:nil];
            
        } else if (status == AVAuthorizationStatusRestricted) {
            NSLog(@"因为系统原因, 无法访问相册");
        }
    } else {
        UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
        UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        
        [alertC addAction:alertA];
        [self presentViewController:alertC animated:YES completion:nil];
    }
    
}
- (void)setupSessionPreset:(NSString *)sessionPreset metadataObjectTypes:(NSArray *)metadataObjectTypes currentController:(UIViewController *)currentController {

    // 1、获取摄像设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // 2、创建设备输入流
    AVCaptureDeviceInput *deviceInput = [AVCaptureDeviceInput deviceInputWithDevice:device error:nil];
    
    // 3、创建数据输出流
    AVCaptureMetadataOutput *metadataOutput = [[AVCaptureMetadataOutput alloc] init];
    [metadataOutput setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // 3(1)、创建设备输出流
    self.videoDataOutput = [[AVCaptureVideoDataOutput alloc] init];
    [_videoDataOutput setSampleBufferDelegate:self queue:dispatch_get_main_queue()];
    
    // 设置扫描范围（每一个取值0～1，以屏幕右上角为坐标原点）
    // 注：微信二维码的扫描范围是整个屏幕，这里并没有做处理（可不用设置）; 如需限制扫描范围，打开下一句注释代码并进行相应调试
    //    metadataOutput.rectOfInterest = CGRectMake(0.05, 0.2, 0.7, 0.6);
    
    // 4、创建会话对象
    _session = [[AVCaptureSession alloc] init];
    // 会话采集率: AVCaptureSessionPresetHigh
    _session.sessionPreset = sessionPreset;
    
    // 5、添加设备输出流到会话对象
    [_session addOutput:metadataOutput];
    // 5(1)添加设备输出流到会话对象；与 3(1) 构成识别光线强弱
    [_session addOutput:_videoDataOutput];
    
    // 6、添加设备输入流到会话对象
    [_session addInput:deviceInput];
    
    // 7、设置数据输出类型，需要将数据输出添加到会话后，才能指定元数据类型，否则会报错
    // 设置扫码支持的编码格式(如下设置条形码和二维码兼容)
    // @[AVMetadataObjectTypeQRCode, AVMetadataObjectTypeEAN13Code,  AVMetadataObjectTypeEAN8Code, AVMetadataObjectTypeCode128Code]
    metadataOutput.metadataObjectTypes = metadataObjectTypes;
    
    // 8、实例化预览图层, 传递_session是为了告诉图层将来显示什么内容
    _videoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_session];
    // 保持纵横比；填充层边界
    _videoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    CGFloat h = [UIScreen mainScreen].bounds.size.height;
    _videoPreviewLayer.frame = CGRectMake(x, y, w, h);
    [currentController.view.layer insertSublayer:_videoPreviewLayer atIndex:0];
    
    // 9、启动会话
    [_session startRunning];
}
/**
 扫描结果处理
 
 @param captureOutput 输出数据源
 @param metadataObjects 扫描结果数组
 @param connection 用于协调输入与输出之间的数据流
 */
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection{
    
    // 1.判断扫描结果的数据是否存在
    if ([metadataObjects count] > 0) {
        // 2.如果存在数据，则停止会话
        [self.session stopRunning];
        [self.session startRunning];
        // 3.删除预览图层
//        [self.videoPreviewLayer removeFromSuperlayer];
        
        AVMetadataMachineReadableCodeObject *metadataObject = metadataObjects[0];
        
        // AVMetadataMachineReadableCodeObject 是AVMetadataObject的具体子类定义的特性检测一维或二维条形码。
        // AVMetadataMachineReadableCodeObject代表一个单一的照片中发现机器可读的代码。这是一个不可变对象描述条码的特性和载荷。
        // 在支持的平台上,AVCaptureMetadataOutput输出检测机器可读的代码对象的数组
        
        NSString *stringValue = metadataObject.stringValue;
        
        if ([stringValue containsString:@"http"]) {
            
            // 如果是字符串，则打开连接
            /*
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringValue] options:[NSDictionary dictionary] completionHandler:^(BOOL success) {
                
                if (success) {
                    NSLog(@"成功");
                }
            }];
             */
            WebLoadingViewController *web = [[UIStoryboard  storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"web"];
            web.url =stringValue;
            [self.navigationController pushViewController:web animated:YES];
            [MBProgressHUD showInfoMessage:[NSString stringWithFormat:@"扫描结果：%@",stringValue]];
        }else{
            NSLog(@"扫描结果：%@",stringValue);     // 可以将字符串放到需要用到的地方（比如label）
            [MBProgressHUD showInfoMessage:[NSString stringWithFormat:@"扫描结果：%@",stringValue]];
        }
    }
}
// 打开/关闭、手电筒
-(void)ClickAction{
    
    if (_openOrDown) {
        [_open_or_down setImage:[UIImage imageNamed:@"scan_flashlight_guan"] forState:UIControlStateNormal];
        
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        if ([device hasTorch]) {
            [device lockForConfiguration:nil];
            [device setTorchMode: AVCaptureTorchModeOff];
            [device unlockForConfiguration];
        }
    }else{
        [_open_or_down setImage:[UIImage imageNamed:@"scan_flashlight_open"] forState:UIControlStateNormal];
        AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        NSError *error = nil;
        if ([captureDevice hasTorch]) {
            BOOL locked = [captureDevice lockForConfiguration:&error];
            if (locked) {
                captureDevice.torchMode = AVCaptureTorchModeOn;
                [captureDevice unlockForConfiguration];
            }
        }
    }
    _openOrDown = !_openOrDown;
    
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
