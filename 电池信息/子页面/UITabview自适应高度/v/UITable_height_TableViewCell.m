//
//  UITable_height_TableViewCell.m
//  
//
//  Created by MAc on 2017/12/4.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "UITable_height_TableViewCell.h"

@implementation UITable_height_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(UITable_height_TableViewCell *)Set_cell{
    return [[[NSBundle mainBundle] loadNibNamed:@"UITable_height_TableViewCell" owner:nil options:nil] lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
