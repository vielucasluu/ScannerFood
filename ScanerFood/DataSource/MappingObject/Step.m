//
//  Step.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "Step.h"

@implementation Step

-(instancetype)initWithDataSource:(NSDictionary *)dataSource
{
    self = [super init];
    if (self) {
        _distance = [[GoogleMapValue alloc] initWithDataSource:[dataSource objectForKey:@"distance"]];
        _duration = [[GoogleMapValue alloc] initWithDataSource:[dataSource objectForKey:@"duration"]];
        _endLocation = [[Location alloc] initWithDataSource:[dataSource objectForKey:@"end_location"]];
        _startLocation = [[Location alloc] initWithDataSource:[dataSource objectForKey:@"start_location"]];
        _polyline = [[Polyline alloc] initWithDataSource:[dataSource objectForKey:@"polyline"]];
        
        _htmlInstructions = [dataSource objectForKey:@"html_instructions"];
        _htmlInstructions = [_htmlInstructions stringByReplacingOccurrencesOfString:@"<b>" withString:@""];
        _htmlInstructions = [_htmlInstructions stringByReplacingOccurrencesOfString:@"</b>" withString:@""];
        _htmlInstructions = [_htmlInstructions stringByReplacingOccurrencesOfString:@"<div style=\"font-size:0.9em\">" withString:@"."];
        _htmlInstructions = [_htmlInstructions stringByReplacingOccurrencesOfString:@"</div>" withString:@"."];
        
        _travelMode = [dataSource objectForKey:@"travel_mode"];
    }
    return self;
}

@end
