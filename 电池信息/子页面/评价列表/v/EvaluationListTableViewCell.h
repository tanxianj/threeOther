//
//  EvaluationListTableViewCell.h
//  
//
//  Created by bang on 2018/1/29.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EvaluationListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *title_lab;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

