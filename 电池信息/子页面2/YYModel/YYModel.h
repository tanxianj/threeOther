//
//	YYModel.h
// on 22/3/2018
//	Copyright © 2018 Apple (中国大陆). All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "Data.h"

@interface YYModel : NSObject

@property (nonatomic, strong) NSString * code;
@property (nonatomic, strong) Data * data;
@property (nonatomic, strong) NSString * desc;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
