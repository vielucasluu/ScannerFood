//
//  GoogleMapValue.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "GoogleMapValue.h"

@implementation GoogleMapValue

-(instancetype)initWithDataSource:(NSDictionary*)dataSource
{
    self = [super init];
    if (self) {
        _text = [dataSource objectForKey:@"text"];
        _value = [[dataSource objectForKey:@"value"] integerValue];
    }
    return self;
}

@end
