//
//  DirectionOverview.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "DirectionOverview.h"

@implementation DirectionOverview

- (instancetype)initWithDictionary:(NSDictionary *)dataSource
{
    self = [super init];
    if (self) {
        _geocodedWaypoints = [NSMutableArray new];
        NSArray* geocodedWaypoints = [dataSource objectForKey:@"geocoded_waypoints"];
        for (NSDictionary* geocodedWaypointDict in geocodedWaypoints) {
            GeocodedWaypoint* geo = [[GeocodedWaypoint alloc] initWithDataSource:geocodedWaypointDict];
            [_geocodedWaypoints addObject:geo];
        }
        
        _routes = [NSMutableArray new];
        NSArray* routes = [dataSource objectForKey:@"routes"];
        for (NSDictionary* routeDict in routes) {
            Route* route = [[Route alloc] initWithDataSource:routeDict];
            [_routes addObject:route];
        }
        
        _status = [dataSource objectForKey:@"status"];
    }
    return self;
}

@end
