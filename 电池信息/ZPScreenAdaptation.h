//
//  ZPScreenAdaptation.h
//  iOS-demo
//
//  Created by 张鹏 on 14/11/7.
//  Copyright (c) 2014年 rimi. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark - UIScreen size confirmation category

@interface UIScreen (ConfirmScreenSize)

+ (BOOL)isEqualToSize:(CGSize)size;

@end

@implementation UIScreen (ConfirmScreenSize)

+ (BOOL)isEqualToSize:(CGSize)size {
    return [self instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(size, [self mainScreen].currentMode.size) : NO;
}

@end

#pragma mark - Macros to determine the device type

#define ZP_IPHONE_3_5_INCH ([UIScreen isEqualToSize:CGSizeMake(640, 960)])
#define ZP_IPHONE_4_0_INCH ([UIScreen isEqualToSize:CGSizeMake(640, 1136)])
#define ZP_IPHONE_4_7_INCH ([UIScreen isEqualToSize:CGSizeMake(750, 1334)])
#define ZP_IPHONE_5_5_INCH ([UIScreen isEqualToSize:CGSizeMake(1242, 2208)])

#pragma mark - Flexible factor functions

/**
 *  get screen flexibility factor
 *
 *  @return the factor value
 */
CG_INLINE CGPoint ZPFlexibleFactor() {
    
    if (ZP_IPHONE_3_5_INCH) {
        return CGPointMake(320.0 / 320.0, 480.0 / 480.0);
    }
    else if (ZP_IPHONE_4_0_INCH) {
        return CGPointMake(320.0 / 320.0, 568.0 / 568.0);
    }
    else if (ZP_IPHONE_4_7_INCH) {
        return CGPointMake(375.0 / 320.0, 667.0 / 568.0);
    }
    else if (ZP_IPHONE_5_5_INCH) {
        return CGPointMake(414.0 / 320.0, 736.0 / 568.0);
    }
    else {
        CGSize screenSize = [UIScreen mainScreen].currentMode.size;
        CGRect screenBounds = [UIScreen mainScreen].bounds;
#if DEBUG
        NSLog(@"%@", NSStringFromCGRect([UIScreen mainScreen].bounds));
        NSLog(@"Unknown device matchs screen size '%@'.", NSStringFromCGSize(screenSize));
#endif
        return CGPointMake(CGRectGetWidth(screenBounds) / 320.0, CGRectGetHeight(screenBounds) / 568.0);
    }
}

CG_INLINE CGRect ZPRectMake(CGPoint origin, CGSize size) {
    return CGRectMake(origin.x, origin.y, size.width, size.height);
}

CG_INLINE CGFloat ZPFlexibleX(CGFloat value) {
    return value * ZPFlexibleFactor().x;
}

CG_INLINE CGFloat ZPFlexibleY(CGFloat value) {
    return value * ZPFlexibleFactor().y;
}

CG_INLINE CGFloat ZPFlexible(CGFloat value) {
    return ZPFlexibleX(value);
}

CG_INLINE CGPoint ZPFlexiblePointMake(CGFloat x, CGFloat y) {
    return CGPointMake(ZPFlexibleX(x), ZPFlexibleY(y));
}

CG_INLINE CGSize ZPFlexibleSizeMake(CGFloat width, CGFloat height) {
    return CGSizeMake(ZPFlexibleX(width), ZPFlexibleY(height));
}

CG_INLINE CGRect ZPFlexibleRectMake(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    CGPoint view_origin = ZPFlexiblePointMake(x, y);
    CGSize view_size = ZPFlexibleSizeMake(width, height);
    return ZPRectMake(view_origin, view_size);
}

CG_INLINE CGRect ZPFlexibleBoundsMake(CGFloat width, CGFloat height) {
    return ZPFlexibleRectMake(0, 0, width, height);
}

#pragma mark - Horizontal & Vertical alignment

typedef NS_ENUM(NSInteger, ZPAlignOption) {
    ZPAlignTopLeft      = 1 << 0,
    ZPAlignTopCenter    = 1 << 1,
    ZPAlignTopRight     = 1 << 2,
    
    ZPAlignBottomLeft   = 1 << 3,
    ZPAlignBottomCenter = 1 << 4,
    ZPAlignBottomRight  = 1 << 5,
    
    ZPAlignCenterLeft   = 1 << 6,
    ZPAlignCenterRight  = 1 << 7,
    
    ZPAlignCenter       = 1 << 8,
};

/**
 *  calculate the flexible frame for the specific view, the frame will affected by the target view and the position you want.
 *
 *  @param target target view
 *  @param option position of the specific view
 *  @param offset the offset of the specific view to the target view
 *  @param size   the specific view's size
 *
 *  @return the frame of the specific view
 */
CG_INLINE CGRect ZPAlignFrame(UIView *target, ZPAlignOption option, CGPoint offset, CGSize size) {
    // check target view existing
    if (!target) {
#if DEBUG
        NSLog(@"Align function need a valid target view.");
#endif
        return CGRectZero;
    }
    
    // calculate the flexible attributes
    CGSize flexible_size = ZPFlexibleSizeMake(size.width, size.height);
    CGPoint flexible_offset = ZPFlexiblePointMake(offset.x, offset.y);
    
    // calculate the flexible view origin
    CGFloat x, y;
    
    // determine the origin value
    switch (option) {
            
        case ZPAlignTopLeft: {
            x = CGRectGetMinX(target.frame) - flexible_offset.x - flexible_size.width;
            y = CGRectGetMinY(target.frame) - flexible_offset.y - flexible_size.height;
        } break;
            
        case ZPAlignTopCenter: {
            x = CGRectGetMidX(target.frame) + flexible_offset.x - flexible_size.width / 2;
            y = CGRectGetMinY(target.frame) - flexible_offset.y - flexible_size.height;
        } break;
            
        case ZPAlignTopRight: {
            x = CGRectGetMaxX(target.frame) + flexible_offset.x;
            y = CGRectGetMinY(target.frame) - flexible_offset.y - flexible_size.height;
        } break;
            
        case ZPAlignBottomLeft: {
            x = CGRectGetMinX(target.frame) - flexible_offset.x - flexible_size.width;
            y = CGRectGetMaxY(target.frame) + flexible_offset.y;
        } break;
            
        case ZPAlignBottomCenter: {
            x = CGRectGetMidX(target.frame) - flexible_size.width / 2 + flexible_offset.x;
            y = CGRectGetMaxY(target.frame) + flexible_offset.y;
        } break;
            
        case ZPAlignBottomRight: {
            x = CGRectGetMaxX(target.frame) + flexible_offset.x;
            y = CGRectGetMaxY(target.frame) + flexible_offset.y;
        } break;
            
        case ZPAlignCenterLeft: {
            x = CGRectGetMinX(target.frame) - flexible_offset.x - flexible_size.width;
            y = CGRectGetMidY(target.frame) - flexible_size.height / 2;
        } break;
            
        case ZPAlignCenterRight: {
            x = CGRectGetMaxX(target.frame) + flexible_offset.x;
            y = CGRectGetMidY(target.frame) - flexible_size.height / 2 + flexible_offset.y;
        } break;
            
        case ZPAlignCenter: {
            x = CGRectGetMidX(target.frame) - flexible_size.width / 2 + flexible_offset.x;
            y = CGRectGetMidY(target.frame) - flexible_size.height / 2 + flexible_offset.y;
        } break;
            
        default: break;
    }
    CGPoint flexible_origin = CGPointMake(x, y);
    return ZPRectMake(flexible_origin, flexible_size);
}
