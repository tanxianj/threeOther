//
//  goodsTableViewCell.h
//  
//
//  Created by bang on 2018/1/25.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface goodsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headerimg;
@property (weak, nonatomic) IBOutlet UILabel *other;
@property (weak, nonatomic) IBOutlet UIView *goodsimg;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)NSDictionary *model;
+(goodsTableViewCell *)setCell;
@end
@interface goodsCollectionCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end
