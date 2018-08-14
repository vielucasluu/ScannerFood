//
//  DirectionOverview.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DirectionOverview : NSObject

@property (strong, nonatomic) NSMutableArray* geocodedWaypoints;
@property (strong, nonatomic) NSMutableArray* routes;
@property (strong, nonatomic) NSString* status;

-(instancetype)initWithDictionary:(NSDictionary*)dataSource;

@end
