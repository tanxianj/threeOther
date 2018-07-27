//
//  YYModelViewController.m
//  
//
//  Created by bang on 2018/3/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "YYModelViewController.h"
#import "HTTPSessionManager.h"
#define HTTP @"https://smart.xiaohuibang.cn/home/home"
#import "YYModel.h"
@interface YYModelViewController ()

@end

@implementation YYModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDictionary *json = [self getJsonWithJsonName:@"File"];
    YYModel *model = [YYModel yy_modelWithDictionary:json];
    
//    NSDictionary *data = [model valueForKey:@"data"];
//    NSArray *array = [data valueForKey:@"locationDetail"];
//    NSString *location_count =[dic valueForKey:@"location_count"];
    
    XJLog(@"root is %@",model.code);
   
}
#pragma mark - custom Method
//读取本地json,获取json数据
- (NSDictionary *) getJsonWithJsonName:(NSString *)jsonName {
    //从本地读取json数据（这一步你从网络里面请求）
    NSString *path = [[NSBundle mainBundle]pathForResource:jsonName ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}
-(void)SetNavOther{
    self.title = @"YYmodel";
    [self AddBackBtn];
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
