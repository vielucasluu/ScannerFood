//
//  Leg.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Leg : NSObject

@property (strong, nonatomic) GoogleMapValue* distance;
@property (strong, nonatomic) GoogleMapValue* duration;
@property (strong, nonatomic) Location* startLocation;
@property (strong, nonatomic) Location* endLocation;
@property (strong, nonatomic) NSMutableArray* steps;
@property (strong, nonatomic) NSString* startAddress;
@property (strong, nonatomic) NSString* endAddress;

-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
