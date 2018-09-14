//
//  AllTools.h
//  TXJAllTools
//
//  Created by bang on 2018/1/26.
//

#ifndef AllTools_h
#define AllTools_h
//UIButton
#import "UIButton+button.h"
#import "ButtonTool.h"
//UILabel
#import "UILableTool.h"
#import "UILabel+NewLab.h"
#import "SFLabel.h"
//UIColor
#import "UIColor+Hex.h"
//UIImageView
#import "ZJImageMagnification.h"
//ZXPUnicode
#import "NSArray+ZXPUnicode.h"
#import "NSDictionary+ZXPUnicode.h"
#import "NSObject+ZXPUnicode.h"
//
#import "ZPScreenAdaptation.h"
//UIView
#import "UIView+Shadow.h"
#import "UIView+LSCore.h"
#import "CAShapeLayer+ViewDottedLine.h"
//UIViewController
#import "UIViewController+NavigationItems.h"
#import "UIViewController+Category.h"
//UIWindow
//#import "UIWindow+Motion.h"
//UITableViewCell
#import "UITableViewCell+ReuseIdentifier.h"
//UITabBar
#import "UITabBar+badge.h"
//UIDevice
//#import "UIDevice+Category.h"
//NSString
#import "NSString+Time.h"
#import "DateToTimeAgo.h"
#import "NSString+XCJson.h"
#import "NSString+hright.h"
#import "NSString+FirstWord.h"
//NSObject
#import "NSObject+ReplaceMethod.h"
#endif /* AllTools_h */

// 自定义log输出，debug时，正常NSLog输出，release状态，为空，不打印
#ifdef DEBUG // 调试时DEBUG

#define DeBuGLog(FORMAT, ...)  fprintf(stderr,"<%s %d>:%s\n",[[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String])

#else // 发布时

#define DeBuGLog(FORMAT, ...) nil

#endif
