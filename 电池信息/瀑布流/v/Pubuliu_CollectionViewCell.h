//
//  Pubuliu_CollectionViewCell.h
//  第三方相关
//
//  Created by MAc on 2017/12/6.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Pubuliu_CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img_view;
@property (weak, nonatomic) IBOutlet UILabel *lab_lab;
@property (weak, nonatomic) IBOutlet UILabel *lab_lab2;
@property (nonatomic,strong)XJModel *model;
@end
