//
//	Data.m
// on 22/3/2018
//	Copyright © 2018 Apple (中国大陆). All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "Data.h"

NSString *const kDataLocationCount = @"location_count";
NSString *const kDataLocationDetail = @"location_detail";

@interface Data ()
@end
@implementation Data




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
	self = [super init];
	if(![dictionary[kDataLocationCount] isKindOfClass:[NSNull class]]){
		self.locationCount = dictionary[kDataLocationCount];
	}	
	if(dictionary[kDataLocationDetail] != nil && [dictionary[kDataLocationDetail] isKindOfClass:[NSArray class]]){
		NSArray * locationDetailDictionaries = dictionary[kDataLocationDetail];
		NSMutableArray * locationDetailItems = [NSMutableArray array];
		for(NSDictionary * locationDetailDictionary in locationDetailDictionaries){
			LocationDetail * locationDetailItem = [[LocationDetail alloc] initWithDictionary:locationDetailDictionary];
			[locationDetailItems addObject:locationDetailItem];
		}
		self.locationDetail = locationDetailItems;
	}
	return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
	NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
	if(self.locationCount != nil){
		dictionary[kDataLocationCount] = self.locationCount;
	}
	if(self.locationDetail != nil){
		NSMutableArray * dictionaryElements = [NSMutableArray array];
		for(LocationDetail * locationDetailElement in self.locationDetail){
			[dictionaryElements addObject:[locationDetailElement toDictionary]];
		}
		dictionary[kDataLocationDetail] = dictionaryElements;
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
	if(self.locationCount != nil){
		[aCoder encodeObject:self.locationCount forKey:kDataLocationCount];
	}
	if(self.locationDetail != nil){
		[aCoder encodeObject:self.locationDetail forKey:kDataLocationDetail];
	}

}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
	self = [super init];
	self.locationCount = [aDecoder decodeObjectForKey:kDataLocationCount];
	self.locationDetail = [aDecoder decodeObjectForKey:kDataLocationDetail];
	return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
	Data *copy = [Data new];

	copy.locationCount = [self.locationCount copy];
	copy.locationDetail = [self.locationDetail copy];

	return copy;
}
@end
