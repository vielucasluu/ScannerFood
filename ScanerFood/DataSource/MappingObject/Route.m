//
//  Route.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "Route.h"

@implementation Route

-(instancetype)initWithDataSource:(NSDictionary *)dataSource
{
    self = [super init];
    if (self) {
        _bounds = [[Bounds alloc] initWithDataSource:[dataSource objectForKey:@"bounds"]];
        _overviewPolyline = [[Polyline alloc] initWithDataSource:[dataSource objectForKey:@"overview_polyline"]];
        
        _copyrights = [dataSource objectForKey:@"copyrights"];
        _summary = [dataSource objectForKey:@"summary"];
        
        _legs = [NSMutableArray new];
        NSArray* legs = [dataSource objectForKey:@"legs"];
        for (NSDictionary* legDict in legs) {
            Leg* leg = [[Leg alloc] initWithDataSource:legDict];
            [_legs addObject:leg];
        }
    }
    return self;
}

@end
