//
//  GeocodedWaypoint.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GeocodedWaypoint : NSObject

@property (strong, nonatomic) NSString* geocoderStatus;
@property (strong, nonatomic) NSString* placeId;
@property (strong, nonatomic) NSArray* types;


-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
