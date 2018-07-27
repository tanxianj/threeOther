//
//  MusicViewController.m
//  
//
//  Created by bang on 2018/2/8.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "MusicViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface MusicViewController ()<AVAudioPlayerDelegate>
@property (weak, nonatomic) IBOutlet UISlider *pregressSlider;

@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btn;
@property (nonatomic,strong)AVAudioPlayer *avAudioPlayer;
@property (nonatomic,assign)NSUInteger second;
@end

@implementation MusicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
}
- (IBAction)second1:(id)sender {
}
- (IBAction)second:(id)sender {
}
- (IBAction)star:(UIButton *)sender {
    switch (sender.tag) {
        case 1:{
            XJLog(@"开始 %li",self.avAudioPlayer.numberOfChannels);
            [self.avAudioPlayer play];
            
        }
            break;
        case 2:{
            
            if ([self.avAudioPlayer isPlaying]) {
                [self.avAudioPlayer pause];
                XJLog(@"暂停");
                [sender setTitle:@"继续" forState:UIControlStateNormal];
            }else{
                [self.avAudioPlayer play];
                XJLog(@"继续");
                [sender setTitle:@"暂停" forState:UIControlStateNormal];
            }
            
        }
            break;
        case 3:{
            XJLog(@"结束");
            [self.avAudioPlayer stop];
            _avAudioPlayer = nil;
        }
            break;
        default:
            break;
    }
}
-(void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event{
    [super motionBegan:motion withEvent:event];
    XJLog(@"摇动");
}
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    
}
- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError * __nullable)error{
    
}
-(void)SetNavOther{
    self.title = @"本地音乐播放";
    [self AddBackBtn];
}
-(AVAudioPlayer *)avAudioPlayer{
    if (!_avAudioPlayer) {
        [_avAudioPlayer stop];
        _avAudioPlayer = nil;
        // 2.播放本地音频文件
        // (1)从boudle路径下读取音频文件 陈小春 - 独家记忆文件名，mp3文件格式
        NSString *path = [[NSBundle mainBundle] pathForResource:@"Thinking Out Loud" ofType:@"mp3"];
        // (2)把音频文件转化成url格式
        NSURL *url = [NSURL fileURLWithPath:path];
        NSError *error;
          NSDictionary *opts = [NSDictionary dictionaryWithObject:@(NO) forKey:AVURLAssetPreferPreciseDurationAndTimingKey];
        AVURLAsset *urlAsset = [AVURLAsset URLAssetWithURL:url options:opts]; // 初始化视频媒体文件
        
        _second = urlAsset.duration.value / urlAsset.duration.timescale; // 获取视频总时长,单位秒
        XJLog(@"second is %li",_second);
        // (3)初始化音频类 并且添加播放文件
        _avAudioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
        if (error) {
            XJLog(@"error is %@",[error description]);
        }
        // (4) 设置代理
        _avAudioPlayer.delegate = self;
        // (5) 设置初始音量大小 默认1，取值范围 0~1
        _avAudioPlayer.volume = 0.5;
        // (6)设置音乐播放次数 负数为一直循环，直到stop，0为一次，1为2次，以此类推
        _avAudioPlayer.numberOfLoops = 0;
        // (5)准备播放
        [_avAudioPlayer prepareToPlay];
    }
    return _avAudioPlayer;
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
