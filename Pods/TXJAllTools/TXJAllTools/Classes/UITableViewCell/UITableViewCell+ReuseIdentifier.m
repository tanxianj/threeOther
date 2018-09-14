//
//  UITableViewCell+ReuseIdentifier.m
//  消汇邦
//
//  Created by 1244 on 2017/7/18.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "UITableViewCell+ReuseIdentifier.h"

@implementation UITableViewCell (ReuseIdentifier)

+ (NSString *)reuseIdentifier{
    return NSStringFromClass(self);
}

@end

@implementation UICollectionViewCell (ReuseIdentifier)

+ (NSString *)reuseIdentifier{
    return NSStringFromClass(self);
}

@end
