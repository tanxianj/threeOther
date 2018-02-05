//
//  View_tool.h
//  第三方相关
//
//  Created by bang on 2018/1/22.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
@interface View_tool : NSObject

@end
*/
@protocol Initialization <NSObject>
@required

// 初始化子视图
- (void)initializeSubViews;

// 添加子视图
- (void)addSubViews;

// 设置约束
- (void)setupSubViewMargins;


@optional

// 设置导航栏
- (void)setupNavigationItems;

// 数据初始化
- (void)initializeData;

// 添加事件
- (void)addTargerts;

// 添加观察者
- (void)addObservers;

// 移除观察者
- (void)removeObservers;

@end





@protocol FunctionViewDelegate <NSObject>


@required

- (void)tapWithFlag:(NSInteger)flag;

@end





@protocol ReloadData <NSObject>


@required

- (void)loadData;

@end
