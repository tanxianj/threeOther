//
//  tab_qk_TableViewCell.m
//  电池信息
//
//  Created by MAc on 2017/12/1.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "tab_qk_TableViewCell.h"

@interface tab_qk_TableViewCell ()<UITextFieldDelegate>
@end
@implementation tab_qk_TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
     self.text_view.delegate = self;
    
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if(_GetString){
        _GetString(textField.text);
    }
}
+(tab_qk_TableViewCell *)SetCell{
    return [[[NSBundle mainBundle] loadNibNamed:@"tab_qk_TableViewCell" owner:nil options:nil] lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
