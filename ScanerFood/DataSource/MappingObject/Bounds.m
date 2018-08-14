//
//  Bounds.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "Bounds.h"

@implementation Bounds

-(instancetype)initWithDataSource:(NSDictionary*)dataSource
{
    self = [super init];
    if (self) {
        _northeast = [[Location alloc] initWithDataSource:[dataSource objectForKey:@"northeast"]];
        _southwest = [[Location alloc] initWithDataSource:[dataSource objectForKey:@"southwest"]];
    }
    return self;
}
@end
