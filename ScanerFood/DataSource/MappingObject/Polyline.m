//
//  Polyline.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "Polyline.h"

@implementation Polyline

-(instancetype)initWithDataSource:(NSDictionary*)dataSource
{
    self = [super init];
    if (self) {
        _points = [dataSource objectForKey:@"points"];
    }
    return self;
}

@end
