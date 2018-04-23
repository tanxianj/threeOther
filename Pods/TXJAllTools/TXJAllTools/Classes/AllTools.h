//
//  AllTools.h
//  TXJAllTools
//
//  Created by bang on 2018/1/26.
//

#ifndef AllTools_h
#define AllTools_h
#import "ButtonTool.h"
#import "UIButton+button.h"
#import "UILableTool.h"
#import "UILabel+NewLab.h"
#import "UIColor+Hex.h"
//#import "ZJImageMagnification.h"
#import "SFLabel.h"
#import "NSArray+ZXPUnicode.h"
#import "NSDictionary+ZXPUnicode.h"
#import "NSObject+ZXPUnicode.h"
#import "ZPScreenAdaptation.h"
#import "UIView+LSCore.h"
#endif /* AllTools_h */

#ifdef DEBUG
#define NSLog(FORMAT, ...)  fprintf(stderr,"<%s %d>:%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])
#else
#define NSLog(FORMAT, ...)  nil
#endif
// 自定义log输出，debug时，正常NSLog输出，release状态，为空，不打印
#ifdef DEBUG // 调试时DEBUG

#define DeBuGLog(...) NSLog(__VA_ARGS__)

#else // 发布时

#define DeBuGLog(...)

#endif
