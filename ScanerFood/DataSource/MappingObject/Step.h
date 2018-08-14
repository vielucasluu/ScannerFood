//
//  Step.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Step : NSObject

@property (strong, nonatomic) GoogleMapValue* distance;
@property (strong, nonatomic) GoogleMapValue* duration;
@property (strong, nonatomic) Location* endLocation;
@property (strong, nonatomic) Location* startLocation;
@property (strong, nonatomic) Polyline* polyline;
@property (strong, nonatomic) NSString* htmlInstructions;
@property (strong, nonatomic) NSString* travelMode;

-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
