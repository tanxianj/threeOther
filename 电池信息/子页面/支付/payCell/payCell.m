//
//  payCell.m
//  
//
//  Created by bang on 2018/1/24.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "payCell.h"

@implementation payCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    _isSelect = NO;
    [_click_btn setImage:[UIImage imageNamed:@"shopping_tab_icon_choose2"] forState:UIControlStateSelected];
    [_click_btn setImage:[UIImage imageNamed:@"shopping_tab_icon_choose"] forState:UIControlStateNormal];


}
-(void)setModel:(NSDictionary *)model{
    _img_logo.image = [UIImage imageNamed:model[@"imageName"]];
    _name_lab.text = [NSString stringWithFormat:@"%@",model[@"title"]];
    
}
- (IBAction)Select:(UIButton *)sender {
//    _isSelect = !_isSelect;
//    if (_isSelect) {
//        [_click_btn setImage:[UIImage imageNamed:@"shopping_tab_icon_choose2"] forState:UIControlStateNormal];
//    }else{
//        [_click_btn setImage:[UIImage imageNamed:@"shopping_tab_icon_choose"] forState:UIControlStateNormal];
//    }
//
    XJLog(@"使用");
}
+(payCell *)SetCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"payCell" owner:nil options:nil] lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
