//
//  UIView+XJLoadingView.m
//  第三方相关
//
//  Created by 谭显敬 on 2018/7/6.
//  Copyright © 2018年 MAc. All rights reserved.
//

#import "UIView+XJLoadingView.h"
#import <objc/runtime.h>
#define kScreenWidth                    [UIScreen mainScreen].bounds.size.width
#define kScreenHeight                   [UIScreen mainScreen].bounds.size.height
CGFloat const space = 24;
@interface XJLoadingView ()
@property (nonatomic, assign) BOOL needShow;
@end

@implementation XJLoadingView
+ (nonnull instancetype)loadingWithrefreshingBlock:(nullable void(^)(void))refreshingBlock{
    XJLoadingView *view = [[XJLoadingView alloc]init];
    view.backgroundColor = UIColor.whiteColor;
    view.refreshingBlock = refreshingBlock;
    return view;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
        _needShow = YES;
    }
    return self;
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
}

/**
 开始加载指示器
 */
-(void)beginRefreshing{
    if (_needShow == NO) return;
    self.hidden = NO;
    [self.superview bringSubviewToFront:self];
    [self.ActivityIndicatorView startAnimating];
    [self HidderOther];
     self.userInteractionEnabled = YES;
}

/**
 结束
 */
-(void)endRefreshing{
    
    self.hidden = YES;
    self.needShow = NO;
    [self.ActivityIndicatorView stopAnimating];
}

/**
 结束刷新 没有数据

 @param noDataString 提示内容
 */
- (void)endRefreshingWithNoDataString:(nullable NSString *)noDataString{
    [self endRefreshingWithString:noDataString?:@"您暂时没有相关数据" image:self.tostImage.image?:[UIImage imageNamed:@"page_reminding_chucuo"]];
}

/**
 结束刷新 出错

 @param errorString 提示内容
 */
- (void)endRefreshingWithErrorString:(nullable NSString *)errorString{
    [self endRefreshingWithString:errorString?:@"网络好像出错啦" image:self.tostImage.image?:[UIImage imageNamed:@"page_reminding_chucuo"]];
}
- (void)endRefreshingWithString:(nullable NSString *)string image:(nullable UIImage *)imag{
    if (_needShow == NO) return;
    self.hidden = NO;
    [self.superview bringSubviewToFront:self];
    _needShow = YES;
    [self.ActivityIndicatorView stopAnimating];
    self.tostLable.text = string;
    self.tostImage.image = imag;
    [self ShowOther];
    [self setNeedsLayout];
    [self layoutIfNeeded];
    /**/
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.userInteractionEnabled = YES;
    });
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    self.frame = self.superview.bounds;
    [self SetOther];
}

/**
 设置缺省图及文字的 大小、位置
 */
-(void)SetOther{
    self.ActivityIndicatorView.frame = self.superview.bounds;
    
    CGSize imageViewSize = self.tostImage.image.size;
    CGSize labelSize = [self.tostLable sizeThatFits:CGSizeMake(kScreenWidth - 40, MAXFLOAT)];
    
    CGFloat startY = (self.mj_h - imageViewSize.height - space - labelSize.height)/2.f;
    
    self.tostImage.frame = CGRectMake((self.mj_w - imageViewSize.width)/2.f,
                                      startY,
                                      imageViewSize.width,
                                      imageViewSize.height);
    
    self.tostLable.frame = CGRectMake((self.mj_w - labelSize.width)/2.f,
                                  startY + imageViewSize.height + space,
                                  labelSize.width,
                                  labelSize.height);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if ([touches.anyObject.view isEqual:self.tostImage] ||[touches.anyObject.view isEqual:self.tostLable]) {
        if (self.refreshingBlock) {
            self.refreshingBlock();
            self.refreshingBlock = nil;
        }
    }
}
/**
 隐藏缺省图片及文字
 */
-(void)HidderOther{
    self.tostImage.hidden = YES;
    self.tostLable.hidden = YES;
}

/**
  显示缺省图片及文字
 */
-(void)ShowOther{
    self.tostImage.hidden = NO;
    self.tostLable.hidden = NO;
}

/**
 懒加载活动指示器

 @return 活动指示器
 */
-(UIActivityIndicatorView *)ActivityIndicatorView{
    if (!_ActivityIndicatorView) {
        _ActivityIndicatorView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _ActivityIndicatorView.hidesWhenStopped = YES;
        [self addSubview:_ActivityIndicatorView];
    }
    return _ActivityIndicatorView;
}

/**
 懒加载提示文字

 @return 提示文字
 */
-(UILabel *)tostLable{
    if (!_tostLable) {
        _tostLable = [UILabel new];
        _tostLable.font = [UIFont systemFontOfSize:15];
        _tostLable.textColor = [UIColor colorWithRed:102/255.0 green:103/255.0 blue:105/255.0 alpha:1.0/1.0];
        _tostLable.textAlignment = NSTextAlignmentCenter;
        _tostLable.userInteractionEnabled = YES;
        _tostLable.numberOfLines = 0;
        _tostLable.preferredMaxLayoutWidth = kScreenWidth - 40;
        [self addSubview:_tostLable];
    }
    return _tostLable;
}

/**
 懒加载提示图片

 @return 提示图片
 */
- (UIImageView *)tostImage{
    if (!_tostImage) {
        
        _tostImage = [[UIImageView alloc]init];
        _tostImage.contentMode = UIViewContentModeScaleAspectFit;
        _tostImage.userInteractionEnabled = YES;
        [self addSubview:_tostImage];
    }
    return _tostImage;
}
@end
const void* kXJLoadingViewKey = "XJLoadingViewKey";
@implementation UIView (XJLoadingView)
-(void)setXj_loadingView:(XJLoadingView *)xj_loadingView{
    if (xj_loadingView != self.xj_loadingView) {
        [self.xj_loadingView removeFromSuperview];
        [self addSubview:xj_loadingView];
        objc_setAssociatedObject(self, kXJLoadingViewKey, xj_loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
}
-(XJLoadingView *)xj_loadingView{
     return objc_getAssociatedObject(self, kXJLoadingViewKey);
}
@end
