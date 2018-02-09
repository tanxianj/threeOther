//
//  TableViewCell.h
//  富文本测试
//
//  Created by bang on 2018/1/8.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCellfwb : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lab_lab;
@property (weak, nonatomic) IBOutlet UILabel *lab_2_lab;
@property (weak, nonatomic) IBOutlet UILabel *xinxin;
+(TableViewCellfwb *)Setcell;
@end
