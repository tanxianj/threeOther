//
//  Model_TableViewCell.h
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Model_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *gd_img;
@property (weak, nonatomic) IBOutlet UILabel *gd_name;
@property (weak, nonatomic) IBOutlet UILabel *gd_price;
@property (nonatomic,strong)XJModel *model;
+(Model_TableViewCell *)Setcell;
@end
