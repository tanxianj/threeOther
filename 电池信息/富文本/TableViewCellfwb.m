//
//  TableViewCell.m
//  富文本测试
//
//  Created by bang on 2018/1/8.
//  Copyright © 2018年 XiaoHuiBang. All rights reserved.
//

#import "TableViewCellfwb.h"

@implementation TableViewCellfwb

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@""];
    for (int i=0; i<arc4random()%5+1; i++) {
        
        // 创建图片图片附件
        NSTextAttachment *attach = [[NSTextAttachment alloc] init];
        attach.image = [UIImage imageNamed:@"xx.png"];
        attach.bounds = CGRectMake(0, 0, 10, 10);
        NSAttributedString *attachString = [NSAttributedString attributedStringWithAttachment:attach];
        [string appendAttributedString:attachString];
    }
    
   
    _xinxin.attributedText = string;
    
}
+(TableViewCellfwb *)Setcell{
    return [[[NSBundle mainBundle] loadNibNamed:@"TableViewCellfwb" owner:nil options:nil] lastObject];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
