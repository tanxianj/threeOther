//
//  Main_TableViewCell.h
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Main_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
+(Main_TableViewCell *)SetCell;
@end
