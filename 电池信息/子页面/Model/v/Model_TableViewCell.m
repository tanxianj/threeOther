//
//  Model_TableViewCell.m
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Model_TableViewCell.h"

@implementation Model_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}
-(void)setModel:(XJModel *)model{
    _model =model;
    [_gd_img sd_setImageWithURL:[NSURL URLWithString:_model.gd_img] placeholderImage:nil];
    _gd_name.text = _model.gd_name;
//    self.gd_img.layer.cornerRadius = 10;
//    _gd_img.layer.masksToBounds=YES;
    _gd_price.text = [NSString stringWithFormat:@"金币%@个",_model.gd_price];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(Model_TableViewCell *)Setcell{
    return [[[NSBundle mainBundle] loadNibNamed:@"Model_TableViewCell" owner:nil options:nil] lastObject];
}
@end
