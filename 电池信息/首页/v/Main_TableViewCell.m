//
//  Main_TableViewCell.m
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Main_TableViewCell.h"

@implementation Main_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
+(Main_TableViewCell *)SetCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"Main_TableViewCell" owner:nil options:nil] lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
