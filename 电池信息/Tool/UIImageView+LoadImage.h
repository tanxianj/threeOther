//
//  UIImageView+LoadImage.h
//  消汇邦
//
//  Created by 罗建 on 2017/1/5.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (LoadImage)



/**
 加载用户头像

 @param unionid 用户uid
 @param force 是否刷新
 */
- (void)loadUserAvatarImageWithUnionid:(NSString *)unionid force:(BOOL)force;


/**
 加载用户头像

 @param unionid 用户uid
 */
- (void)loadUserAvatarImageWithUnionid:(NSString *)unionid;


/**
 加载群组头像

 @param groupId 群组uid
 */
- (void)loadGroupAvatarImageWithGroupId:(NSString *)groupId;


/**
 加载图片，尺寸为屏幕一半，常用于小图加载

 @param url 图片的url，不需要做任何拼接，内部自动解析
 @param placeholder 展位图名称，可为空，默认为“blank_bg"
 */
- (void)loadCommonImageWithUrl:(NSString *)url placeholder:(NSString *)placeholder;


/**
 加载原图，流量消耗非常大，请谨慎使用

 @param url 同上
 @param placeholder 同上
 */
- (void)loadOriginImageWithUrl:(NSString *)url placeholder:(NSString *)placeholder;


- (void)loadImageWithUrl:(NSString *)url width:(CGFloat)width height:(CGFloat)height placeholder:(NSString *)placeholder;

@end
