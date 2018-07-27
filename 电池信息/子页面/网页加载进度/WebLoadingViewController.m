//
//  WebLoadingViewController.m
//  
//
//  Created by bang on 2018/1/17.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "WebLoadingViewController.h"
#import <WebKit/WebKit.h>
@interface WebLoadingViewController ()
@property (weak, nonatomic) IBOutlet WKWebView *web;
@property (weak, nonatomic) IBOutlet UIProgressView *loding;


@end

@implementation WebLoadingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _url = _url!=nil ? _url :@"https://www.baidu.com";
    XJLog(@"url is %@",_url);
    [_web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
//    [self.web valueForKey:@"estimatedProgress"];
    [self.web addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
//    self.loding.trackTintColor = [UIColor redColor];
    /*
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    //    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"返回"] forState:UIControlStateNormal];
    //    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    */
}
-(void)SetNavOther{
    self.topLine.hidden = YES;
    [self AddBackBtn];
}
- (void)back:(UIButton *)button {
    if ([self.web canGoBack]) {
        [self.web goBack];
    }else{
            [self.navigationController popViewControllerAnimated:YES];
    }
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"estimatedProgress"]) {
        NSLog(@"change is %@",change);
        _loding.progress = [change[@"new"] floatValue];
        if ([change[@"new"] floatValue]<1) {
            _loding.hidden = NO;
        }
        else{
            _loding.hidden = YES;
            self.title = _web.title;
            NSLog(@"title  is %@",_web.title);
        }
    }
}
-(void)dealloc{
    
    [self.web removeObserver:self forKeyPath:@"estimatedProgress"];
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
