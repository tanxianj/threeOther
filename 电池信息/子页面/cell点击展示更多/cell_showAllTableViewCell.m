//
//  cell_showAllTableViewCell.m
//  第三方相关
//
//  Created by MAc on 2017/12/5.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "cell_showAllTableViewCell.h"

@implementation cell_showAllTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setOpen:(BOOL)open{
    self.lab_lab.numberOfLines=open?0:1;
}
+(cell_showAllTableViewCell *)Set_Cell{
    return [[[NSBundle mainBundle] loadNibNamed:@"cell_showAllTableViewCell" owner:nil options:nil] lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
