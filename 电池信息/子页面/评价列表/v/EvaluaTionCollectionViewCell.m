//
//  EvaluaTionCollectionViewCell.m
//  
//
//  Created by bang on 2018/1/29.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "EvaluaTionCollectionViewCell.h"

@implementation EvaluaTionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.imgView.contentMode = UIViewContentModeScaleAspectFill;
    self.imgView.layer.masksToBounds = YES;
}

@end
