//
//  tab_qk_TableViewCell.h
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tab_qk_TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (strong, nonatomic) IBOutlet UITextField *text_view;
+(tab_qk_TableViewCell *)SetCell;
@property(nonatomic,strong)void (^GetString)(NSString *str);
@end
