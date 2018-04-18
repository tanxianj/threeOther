//
//	YYModel.m
// on 22/3/2018
//	Copyright © 2018 Apple (中国大陆). All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "YYModel.h"

NSString *const kYYModelCode = @"code";
NSString *const kYYModelData = @"data";
NSString *const kYYModelDesc = @"desc";

@interface YYModel ()
@end
@implementation YYModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kYYModelCode] isKindOfClass:[NSNull class]]){
		self.code = dictionary[kYYModelCode];
	}	
	if(![dictionary[kYYModelData] isKindOfClass:[NSNull class]]){
		self.data = [[Data alloc] initWithDictionary:dictionary[kYYModelData]];
	}

	if(![dictionary[kYYModelDesc] isKindOfClass:[NSNull class]]){
		self.desc = dictionary[kYYModelDesc];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.code != nil){
		dictionary[kYYModelCode] = self.code;
	}
	if(self.data != nil){
		dictionary[kYYModelData] = [self.data toDictionary];
	}
	if(self.desc != nil){
		dictionary[kYYModelDesc] = self.desc;
	}
	return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
	if(self.code != nil){
		[aCoder encodeObject:self.code forKey:kYYModelCode];
	}
	if(self.data != nil){
		[aCoder encodeObject:self.data forKey:kYYModelData];
	}
	if(self.desc != nil){
		[aCoder encodeObject:self.desc forKey:kYYModelDesc];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.code = [aDecoder decodeObjectForKey:kYYModelCode];
	self.data = [aDecoder decodeObjectForKey:kYYModelData];
	self.desc = [aDecoder decodeObjectForKey:kYYModelDesc];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	YYModel *copy = [YYModel new];

	copy.code = [self.code copy];
	copy.data = [self.data copy];
	copy.desc = [self.desc copy];

	return copy;
}
@end
