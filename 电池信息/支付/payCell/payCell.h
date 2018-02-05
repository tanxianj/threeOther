//
//  payCell.h
//  第三方相关
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface payCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_logo;
@property (weak, nonatomic) IBOutlet UILabel *name_lab;
@property (weak, nonatomic) IBOutlet UIButton *click_btn;
@property (nonatomic,assign)BOOL isSelect;
@property (nonatomic,strong)NSDictionary *model;
@property (weak, nonatomic) IBOutlet UIButton *sy;
+(payCell *)SetCell;

@end
