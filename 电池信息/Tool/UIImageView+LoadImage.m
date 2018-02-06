//
//  UIImageView+LoadImage.m
//  消汇邦
//
//  Created by 罗建 on 2017/1/5.
//  Copyright © 2017年 深圳消汇邦成都分公司. All rights reserved.
//

#import "UIImageView+LoadImage.h"

//#import "ImageManager.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (LoadImage)

- (void)loadUserAvatarImageWithUnionid:(NSString *)unionid force:(BOOL)force{
    if (unionid.length == 0) {
        self.image = [UIImage imageNamed:@"default_avatar"];
        return;
    }
//    NSURL *url = [ImageUrlTool userAvatarImageUrlWithUid:unionid];
    [self sd_setImageWithURL:[NSURL URLWithString:unionid] placeholderImage:[UIImage imageNamed:@"default_avatar"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
#ifdef DEBUG
            NSLog(@"%@%@",error.localizedDescription,imageURL);
#endif
        }
    }];
//    if (force) {
//        [[SDImageCache sharedImageCache]removeImageForKey:url.absoluteString withCompletion:nil];
//    }
    
}

- (void)loadUserAvatarImageWithUnionid:(NSString *)unionid {
    [self loadUserAvatarImageWithUnionid:unionid force:NO];

}

- (void)loadGroupAvatarImageWithGroupId:(NSString *)groupId {
//    UIImage *avatarImage = [ImageManager readAvatarImageWithUnionid:groupId];
//    if (avatarImage) {
//        self.image = avatarImage;
//    }
//    else {
        [self sd_setImageWithURL:[NSURL URLWithString:groupId] placeholderImage:[UIImage imageNamed:@"default_avatar"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
            if (error) {
#ifdef DEBUG
                NSLog(@"%@%@",error.localizedDescription,imageURL);
#endif
            }else{
                dispatch_async(dispatch_get_global_queue(0, 0), ^{
//                    [ImageManager writeGroupAvatarImageWithGroupId:groupId];
                });
            }
        }];
//    }
}

- (void)loadCommonImageWithUrl:(NSString *)url placeholder:(NSString *)placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString: url] placeholderImage:placeholder.length ? [UIImage imageNamed:placeholder] : [UIImage imageNamed:@"blank_bg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
#ifdef DEBUG
            NSLog(@"%@%@",error.localizedDescription,imageURL);
#endif
        }
        
    }];
}
- (void)loadOriginImageWithUrl:(NSString *)url placeholder:(NSString *)placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString: url] placeholderImage:placeholder.length ? [UIImage imageNamed:placeholder] : [UIImage imageNamed:@"blank_bg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
#ifdef DEBUG
            NSLog(@"%@%@",error.localizedDescription,imageURL);
#endif
        }
        
    }];
}

- (void)loadImageWithUrl:(NSString *)url width:(CGFloat)width height:(CGFloat)height placeholder:(NSString *)placeholder{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder.length ? [UIImage imageNamed:placeholder] : [UIImage imageNamed:@"blank_bg"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
#ifdef DEBUG
            NSLog(@"%@%@",error.localizedDescription,imageURL);
#endif
        }
        
    }];
}

@end
