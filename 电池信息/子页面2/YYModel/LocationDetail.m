//
//	LocationDetail.m
// on 22/3/2018
//	Copyright © 2018 Apple (中国大陆). All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "LocationDetail.h"
NSString *const kLocationDetailDeviceCount = @"device_count";
NSString *const kLocationDetailIconId = @"icon_id";
NSString *const kLocationDetailLocationId = @"location_id";
NSString *const kLocationDetailLocationName = @"location_name";

@interface LocationDetail ()
@end
@implementation LocationDetail




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kLocationDetailDeviceCount] isKindOfClass:[NSNull class]]){
		self.deviceCount = dictionary[kLocationDetailDeviceCount];
	}	
	if(![dictionary[kLocationDetailIconId] isKindOfClass:[NSNull class]]){
		self.iconId = dictionary[kLocationDetailIconId];
	}	
	if(![dictionary[kLocationDetailLocationId] isKindOfClass:[NSNull class]]){
		self.locationId = dictionary[kLocationDetailLocationId];
	}	
	if(![dictionary[kLocationDetailLocationName] isKindOfClass:[NSNull class]]){
		self.locationName = dictionary[kLocationDetailLocationName];
	}	
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.deviceCount != nil){
		dictionary[kLocationDetailDeviceCount] = self.deviceCount;
	}
	if(self.iconId != nil){
		dictionary[kLocationDetailIconId] = self.iconId;
	}
	if(self.locationId != nil){
		dictionary[kLocationDetailLocationId] = self.locationId;
	}
	if(self.locationName != nil){
		dictionary[kLocationDetailLocationName] = self.locationName;
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
	if(self.deviceCount != nil){
		[aCoder encodeObject:self.deviceCount forKey:kLocationDetailDeviceCount];
	}
	if(self.iconId != nil){
		[aCoder encodeObject:self.iconId forKey:kLocationDetailIconId];
	}
	if(self.locationId != nil){
		[aCoder encodeObject:self.locationId forKey:kLocationDetailLocationId];
	}
	if(self.locationName != nil){
		[aCoder encodeObject:self.locationName forKey:kLocationDetailLocationName];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.deviceCount = [aDecoder decodeObjectForKey:kLocationDetailDeviceCount];
	self.iconId = [aDecoder decodeObjectForKey:kLocationDetailIconId];
	self.locationId = [aDecoder decodeObjectForKey:kLocationDetailLocationId];
	self.locationName = [aDecoder decodeObjectForKey:kLocationDetailLocationName];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	LocationDetail *copy = [LocationDetail new];

	copy.deviceCount = [self.deviceCount copy];
	copy.iconId = [self.iconId copy];
	copy.locationId = [self.locationId copy];
	copy.locationName = [self.locationName copy];

	return copy;
}
@end
