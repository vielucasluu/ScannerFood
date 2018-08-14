//
//  ApplicationDirectionService.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DirectionOverview.h"
#import "Leg.h"
#import "Step.h"

@interface ApplicationDirectionService : NSObject

@property (strong, nonatomic) NSMutableArray* selectLegs; //[Leg]
@property (strong, nonatomic) NSMutableArray* selectSteps; //[Step]
@property (assign, nonatomic) CLLocationCoordinate2D originCoordinate;
@property (assign, nonatomic) CLLocationCoordinate2D destinationCoordinate;

+(ApplicationDirectionService *)shareInstance;

-(NSString*)totalDistance;
-(NSString*)totalDuration;
-(void)getDirectionsWithOrigin:(NSString*)origin
                   destination:(NSString*)destination
                    travelMode:(NSString*)travelMode
            getDirectionStatus:(void (^)(BOOL finished))status;

@end
