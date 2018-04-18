//
//	LocationDetail.h
// on 22/3/2018
//	Copyright © 2018 Apple (中国大陆). All rights reserved.
//

//	Model file Generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

#import <UIKit/UIKit.h>

@interface LocationDetail : NSObject

@property (nonatomic, strong) NSString * deviceCount;
@property (nonatomic, strong) NSString * iconId;
@property (nonatomic, strong) NSString * locationId;
@property (nonatomic, strong) NSString * locationName;

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
