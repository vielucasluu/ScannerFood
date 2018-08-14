//
//  Leg.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "Leg.h"

@implementation Leg

-(instancetype)initWithDataSource:(NSDictionary *)dataSource
{
    self = [super init];
    if (self) {
        _distance = [[GoogleMapValue alloc] initWithDataSource:[dataSource objectForKey:@"distance"]];
        _duration = [[GoogleMapValue alloc] initWithDataSource:[dataSource objectForKey:@"duration"]];
        _endLocation = [[Location alloc] initWithDataSource:[dataSource objectForKey:@"end_location"]];
        _startLocation = [[Location alloc] initWithDataSource:[dataSource objectForKey:@"start_location"]];
        
        _startAddress = [dataSource objectForKey:@"start_address"];
        _endAddress = [dataSource objectForKey:@"end_address"];
        
        _steps = [NSMutableArray new];
        NSArray* steps = [dataSource objectForKey:@"steps"];
        for (NSDictionary* stepDict in steps) {
            Step* step = [[Step alloc] initWithDataSource:stepDict];
            [_steps addObject:step];
        }
    }
    return self;
}

@end
