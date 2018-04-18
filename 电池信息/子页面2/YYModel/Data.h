//
//	Data.h
// on 22/3/2018
//	Copyright © 2018 Apple (中国大陆). All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>
#import "LocationDetail.h"

@interface Data : NSObject

@property (nonatomic, strong) NSString * locationCount;
@property (nonatomic, strong) NSArray * locationDetail;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
