//
//  googsTableViewCell.h
//  第三方相关
//
//  Created by bang on 2018/2/5.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class googsTableViewCell;
@protocol googsTableViewCellDelegate<NSObject>

@optional
-(void)changenaddumber:(NSString *)number Cell:(googsTableViewCell*)cell;
-(void)changendeleteumber:(NSString *)number Cell:(googsTableViewCell*)cell;
-(void)jsuannumber:(NSInteger)sum;
@end

@interface googsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UIButton *deletle;
@property (strong, nonatomic) IBOutlet UILabel *number;
@property (weak, nonatomic) IBOutlet UIButton *add;
@property (nonatomic,weak)id <googsTableViewCellDelegate> delegate;

@end
