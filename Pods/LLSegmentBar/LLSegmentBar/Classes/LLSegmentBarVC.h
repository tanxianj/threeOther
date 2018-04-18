//
//  LLSegmentBarVC.h
//  LLSegmentBar
//
//  Created by liushaohua on 2017/6/3.
//  Copyright © 2017年 416997919@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LLSegmentBar.h"
// 自定义log输出，debug时，正常NSLog输出，release状态，为空，不打印
#ifdef DEBUG
#define NSLog(FORMAT, ...)  fprintf(stderr,"<%s %d>:%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...)  nil
#endif
#ifdef DEBUG // 调试时

#define TXJLog(...) NSLog(__VA_ARGS__)

#else // 发布时

#define TXJLog(...)

#endif
@interface LLSegmentBarVC : UIViewController

@property (nonatomic,weak) LLSegmentBar * segmentBar;

- (void)setUpWithItems: (NSArray <NSString *>*)items childVCs: (NSArray <UIViewController *>*)childVCs;

@end
