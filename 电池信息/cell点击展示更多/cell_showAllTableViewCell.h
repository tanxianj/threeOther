//
//  cell_showAllTableViewCell.h
//  第三方相关
//
//  Created by MAc on 2017/12/5.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface cell_showAllTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lab_lab;
@property (assign,nonatomic)BOOL open;
+(cell_showAllTableViewCell *)Set_Cell;

@end
