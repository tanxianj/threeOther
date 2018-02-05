//
//  Pubuliu_CollectionViewCell.m
//  第三方相关
//
//  Created by MAc on 2017/12/6.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import "Pubuliu_CollectionViewCell.h"

@implementation Pubuliu_CollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
/*
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor=[self randomColor];
    }
    return self;
}
-(UIColor *) randomColor
{
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.5; // 0.5 to 1.0,away from white
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.5; //0.5 to 1.0,away from black
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
}
*/
-(void)setModel:(XJModel *)model{
    _model = model;
    [_img_view sd_setImageWithURL:[NSURL URLWithString:_model.gd_img] placeholderImage:[UIImage imageNamed:@"tp.png"]];
    _lab_lab.text = _model.gd_name;
    _lab_lab2.text = [NSString stringWithFormat:@"金币%@个",_model.gd_price];
    self.contentView.backgroundColor = [UIColor whiteColor];
}

@end
