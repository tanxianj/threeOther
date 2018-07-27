//
//  pubuliuLayout.h
//  
//
//  Created by MAc on 2017/12/6.
//  Copyright © 2017年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef  CGFloat(^itemHeightBlock)(NSIndexPath* index);
@interface pubuliuLayout : UICollectionViewLayout
@property(nonatomic,strong )itemHeightBlock heightBlock ;
@property(nonatomic,assign)NSUInteger colMargin;
-(instancetype)initWithItemsHeightBlock:(itemHeightBlock)block;
@end
