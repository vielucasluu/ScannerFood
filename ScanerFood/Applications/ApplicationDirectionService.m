//
//  ApplicationDirectionService.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "ApplicationDirectionService.h"

#define baseURLDirections @"https://maps.googleapis.com/maps/api/directions/"

@interface ApplicationDirectionService()
{
    AFHTTPSessionManager*   _manager;
    
    DirectionOverview* _direction;
    NSInteger _totalDistanceInMeters;
    NSInteger _totalDurationInSeconds;
    
    NSMutableArray*    _geoCodedWayPoints;
}

@end

@implementation ApplicationDirectionService

+(ApplicationDirectionService *)shareInstance
{
    static ApplicationDirectionService *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ApplicationDirectionService alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:baseURLDirections]];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];
        
        _selectSteps = [NSMutableArray new];
        _selectLegs = [NSMutableArray new];
    }
    return self;
}

-(NSString *)totalDistance
{
    return [NSString stringWithFormat:@"TotalDistance: %ld km",(_totalDistanceInMeters/1000)];
}

-(NSString*)totalDuration
{
    return [NSString stringWithFormat:@"TotalDuration: %ld days, %ld hours, %ld mins, %ld sesc",
            (_totalDurationInSeconds/86400),
            ((_totalDurationInSeconds/3600)%24),
            ((_totalDurationInSeconds/60)%60),
            (_totalDurationInSeconds%60)];
}

-(void)getDirectionsWithOrigin:(NSString *)origin
                   destination:(NSString *)destination
                    travelMode:(NSString *)travelMode
            getDirectionStatus:(void (^)(BOOL))status
{
    NSDictionary* parameter = @{@"origin":origin,
                                @"destination":destination,
                                @"mode":travelMode,
                                @"key":kGoogleAPI};
    [_manager GET:@"json"
       parameters:parameter
         progress:^(NSProgress * _Nonnull uploadProgress) {
             //
         }
          success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
              NSDictionary* returnDict = (NSDictionary*)responseObject;
              
              if ([returnDict objectForKey:@"error_message"]) {
                  UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Request Fail"
                                                                                   message:[returnDict objectForKey:@"error_message"]
                                                                            preferredStyle:UIAlertControllerStyleAlert];
                  UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                                     style:UIAlertActionStyleDefault
                                                                   handler:^(UIAlertAction * _Nonnull action) {
                                                                       [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                                   }];
                  [alertVC addAction:okAction];
                  [_NavController presentViewController:alertVC animated:YES completion:nil];
                  return;
              }
              
              DirectionOverview* direction = [[DirectionOverview alloc] initWithDictionary:returnDict];
              NSLog(@"");
              if ([direction.status isEqualToString:@""]) {
                  status(false);
                  return;
              }
              self->_direction = direction;
              BOOL success = false;
              if ([direction.status isEqualToString:@"OK"]) {
                  if (direction.routes.count > 0) {
                      Route* firstRoute = [direction.routes firstObject];
                      Leg* firstLeg = [firstRoute.legs firstObject];
                      
                      if (![firstRoute.overviewPolyline.points isEqualToString:@""] &&
                          firstRoute.legs.count > 0 &&
                          firstLeg.steps.count > 0)
                      {
                          self.selectLegs = firstRoute.legs;
                      }
                      
                      BOOL result = [self calculateTotalDistanceAndDuration];
                      success = result;
                  }
                  status(success);
              }
          }
          failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
              NSLog(@"");
          }];
}

-(BOOL)calculateTotalDistanceAndDuration
{
    _totalDistanceInMeters = 0;
    _totalDurationInSeconds = 0;
    BOOL status = false;
    for (Leg* leg in _selectLegs) {
        for (Step* step in leg.steps) {
            [_selectSteps addObject:step];
            NSInteger distance = step.distance.value;
            NSInteger duration = step.duration.value;
            if (distance && duration) {
                _totalDistanceInMeters += distance;
                _totalDurationInSeconds += duration;
            }
        }
    }
    status = true;
    return status;
}

@end
