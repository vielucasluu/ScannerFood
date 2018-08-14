//
//  Location.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "Location.h"

@implementation Location

-(instancetype)initWithDataSource:(NSDictionary*)dataSource
{
    self = [super init];
    if (self) {
        _latitude = [[dataSource objectForKey:@"lat"] floatValue];
        _longtidude = [[dataSource objectForKey:@"lng"] floatValue];
    }
    return self;
}

@end
