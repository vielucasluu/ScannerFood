//
//  Route.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (strong, nonatomic) Bounds* bounds;
@property (strong, nonatomic) Polyline* overviewPolyline;
@property (strong, nonatomic) NSMutableArray* legs;

@property (strong, nonatomic) NSString* copyrights;
@property (strong, nonatomic) NSString* summary;

-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
