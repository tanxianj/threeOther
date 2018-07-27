//
//  UIView+XJLoadingView.h
//  第三方相关
//
//  Created by 谭显敬 on 2018/7/6.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface XJLoadingView : UIView
//_Nullable

@property (nonatomic,copy)void (^ _Nullable refreshingBlock)(void); //
@property (nonatomic,strong)UIImageView * _Nullable tostImage;
@property (nonatomic,strong)UILabel * _Nullable tostLable;
@property (nonatomic,strong)UIActivityIndicatorView * _Nullable ActivityIndicatorView;
+ (nonnull instancetype)loadingWithrefreshingBlock:(nullable void(^)(void))refreshingBlock;
- (void)beginRefreshing;
- (void)endRefreshing;

- (void)endRefreshingWithNoDataString:(nullable NSString *)noDataString;
- (void)endRefreshingWithErrorString:(nullable NSString *)errorString;


- (void)endRefreshingWithString:(nullable NSString *)string image:(nullable UIImage *)image;
@end
@interface UIView (XJLoadingView)
@property (nonatomic,strong)XJLoadingView * _Nullable xj_loadingView;
@end

