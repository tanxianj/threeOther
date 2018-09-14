//
//  UITableViewCell+ReuseIdentifier.h
//  消汇邦
//
//  Created by 1244 on 2017/7/18.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (ReuseIdentifier)

+ (NSString *)reuseIdentifier;

@end

@interface UICollectionViewCell (ReuseIdentifier)

+ (NSString *)reuseIdentifier;

@end
