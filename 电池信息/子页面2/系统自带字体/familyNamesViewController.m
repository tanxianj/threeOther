//
//  familyNamesViewController.m
//  第三方相关
//
//  Created by 谭显敬 on 2018/7/31.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "familyNamesViewController.h"

@interface familyNamesViewController ()
@property (nonatomic,strong)NSArray * TypefaceArray;
@end

@implementation familyNamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)SetNavOther{
    [self AddBackBtn];
    self.title = @"系统自带字体";
    self.navigationItem.leftBarButtonItem = [self setupNavigationItemWithLeft:NO imageName:nil title:@"返回" callBack:^{
        
    }];
}
#pragma mark - Table view data source
//需要显示几个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
//每组需要显示的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.TypefaceArray.count;
}

//cell样式
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    familyNamesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"familyNamesCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.fastLab.text = [NSString stringWithFormat:@"样式 123 abc ABC %@",self.TypefaceArray[indexPath.row]];
    
    cell.fastLab.font = [UIFont fontWithName:self.TypefaceArray[indexPath.row] size:18];
    cell.lastLab.text = [NSString stringWithFormat:@"%@",self.TypefaceArray[indexPath.row]];
    return cell;
}
//cell点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
-(NSArray *)TypefaceArray{
    if (!_TypefaceArray) {
        _TypefaceArray = [UIFont familyNames];
        for (NSString *str in _TypefaceArray) {
            DeBuGLog(@"字体 is %@",str);
        }
    }
    return _TypefaceArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
@interface familyNamesCell ()

@end

@implementation familyNamesCell
-(void)awakeFromNib{
    [super awakeFromNib];
}

@end
