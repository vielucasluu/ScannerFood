//
//  GeocodedWaypoint.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "GeocodedWaypoint.h"

@implementation GeocodedWaypoint

- (instancetype)initWithDataSource:(NSDictionary *)dataSource
{
    self = [super init];
    if (self) {
        _geocoderStatus = [dataSource objectForKey:@"geocoder_status"];
        _types = [dataSource objectForKey:@"types"];
        _placeId = [dataSource objectForKey:@"place_id"];
    }
    return self;
}

@end
