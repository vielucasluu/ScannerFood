//
//  VC_MainPageSpaceDetails.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/3/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VC_MainPageSpaceDetails.h"
#import <GoogleMaps/GoogleMaps.h>
#import "VW_DetailsView.h"
#import "VW_DirectionView.h"
#import "VW_EditView.h"

@interface VC_MainPageSpaceDetails ()<GMSMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager*  _locationManager;
    CLLocation*         _currentLocation;
    
    NSDictionary*       _dataSource;
}
@property (strong, nonatomic) ApplicationDirectionService* directionService;

@property (strong, nonatomic) GMSMapView*   mapView;
@property (strong, nonatomic) UIButton*     detailsBtn;
@property (strong, nonatomic) UIButton*     directionBtn;
@property (strong, nonatomic) UIButton*     editBtn;

@property (strong, nonatomic) VW_DetailsView*       detailsView;
@property (strong, nonatomic) VW_DirectionView*     directionView;
@property (strong, nonatomic) VW_EditView*          editView;

@property (strong, nonatomic) FIRDatabaseReference* firebaseRef;

@end

@implementation VC_MainPageSpaceDetails

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _locationManager = [[CLLocationManager alloc] init];
        [_locationManager setDelegate:self];;
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
        if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse) {
            [_locationManager requestWhenInUseAuthorization];
        }
        else {
            [_locationManager startUpdatingLocation];
        }
        
        _directionService = [ApplicationDirectionService shareInstance];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:15];
    
    CGFloat xPos = 0.0;
    CGFloat yPos = 0.0;
    
    CGRect frame = self.view.frame;
    CGRect contentRect = CGRectMake(xPos, yPos, frame.size.width, frame.size.width*9/16);
    
    _mapView = [GMSMapView mapWithFrame:contentRect camera:camera];
    [_mapView setMyLocationEnabled:YES];
    [_mapView.settings setMyLocationButton:YES];
    [_mapView setDelegate:self];
    [self.view addSubview:_mapView];
    
    yPos += contentRect.size.height;
    contentRect = CGRectMake(xPos, yPos, frame.size.width, 50);
    UIView* tabbarButtonView = [[UIView alloc] initWithFrame:contentRect];
    [tabbarButtonView setBackgroundColor:[UIColor LVL_colorWithHexString:@"f1f1f1" andAlpha:1.0]];
    [self.view addSubview:tabbarButtonView];
    
    yPos += contentRect.size.height;
    xPos = (frame.size.width - 3*30)/4;
    contentRect = CGRectMake(xPos, 10, 30, 30);
    _detailsBtn = [[UIButton alloc] initWithFrame:contentRect];
    [_detailsBtn setSelected:YES];
    [_detailsBtn setBackgroundImage:[[UIImage imageNamed:@"detail_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_detailsBtn setBackgroundImage:[[UIImage imageNamed:@"detail_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_detailsBtn addTarget:self action:@selector(detailsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarButtonView addSubview:_detailsBtn];
    
    xPos += 30 + (frame.size.width - 3*30)/4;
    contentRect = CGRectMake(xPos, 10, 30, 30);
    _directionBtn = [[UIButton alloc] initWithFrame:contentRect];
    [_directionBtn setBackgroundImage:[[UIImage imageNamed:@"direction"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_directionBtn setBackgroundImage:[[UIImage imageNamed:@"direction"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_directionBtn addTarget:self action:@selector(directionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarButtonView addSubview:_directionBtn];
    
    xPos += 30 + (frame.size.width - 3*30)/4;
    contentRect = CGRectMake(xPos, 10, 30, 30);
    _editBtn = [[UIButton alloc] initWithFrame:contentRect];
    [_editBtn setBackgroundImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_editBtn setBackgroundImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_editBtn addTarget:self action:@selector(editButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarButtonView addSubview:_editBtn];
    
    xPos = 0.0;
    contentRect = CGRectMake(xPos, yPos, frame.size.width, frame.size.height - yPos - 49 - 64 );
    _detailsView = [[VW_DetailsView alloc] initWithFrame:contentRect];
    [_detailsView setHidden:NO];
    [self.view addSubview:_detailsView];
    
    
    _directionView = [[VW_DirectionView alloc] initWithFrame:contentRect];
    [_directionView setHidden:YES];
    [self.view addSubview:_directionView];
    
    _editView = [[VW_EditView alloc] initWithFrame:contentRect];
    [_editView setHidden:YES];
    [self.view addSubview:_editView];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = _mapView;
    
    [self reloadData];
}

#pragma mark - Loading UI
-(void)detailsButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_directionBtn setSelected:NO];
    [_editBtn setSelected:NO];
    
    [_detailsView setHidden:NO];
    [_directionView setHidden:YES];
    [_editView setHidden:YES];
}

-(void)directionButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_editBtn setSelected:NO];
    [_detailsBtn setSelected:NO];
    
    [_detailsView setHidden:YES];
    [_directionView setHidden:NO];
    [_editView setHidden:YES];
}

-(void)editButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_directionBtn setSelected:NO];
    [_detailsBtn setSelected:NO];
    
    [_detailsView setHidden:YES];
    [_directionView setHidden:YES];
    [_editView setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Process Location

-(void)scanDirection
{
    [_mapView clear];
    NSString* origin = @"10.792659,106.699817";
    NSString* destination = @"10.772638, 106.690937";
    GMSMarker* destinationMarker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake(10.772638, 106.690937)];
    [destinationMarker setMap:_mapView];
    [self.directionService getDirectionsWithOrigin:origin
                                       destination:destination
                                        travelMode:@"driving"
                                getDirectionStatus:^(BOOL success) {
                                    if (success) {
                                        [self drawRoute];
                                        dispatch_async(dispatch_get_main_queue(), ^{
                                            [self->_directionView reloadData];
                                        });
                                    }
                                }];
}

-(void)drawRoute
{
    for (Step* step in self.directionService.selectSteps){
        if (![step.polyline.points isEqualToString:@""])
        {
            GMSPath* path = [GMSPath pathFromEncodedPath:step.polyline.points];
            GMSPolyline* routePolyline = [GMSPolyline polylineWithPath:path];
            [routePolyline setStrokeColor:[UIColor blueColor]];
            [routePolyline setStrokeWidth:3.0];
            [routePolyline setMap:_mapView];
        } else {
            return;
        }
    }
}

#pragma mark - CLLocationManagerDelegate
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    [manager stopUpdatingLocation];
    _currentLocation = [locations lastObject];
    if (_currentLocation) {
        GMSCameraPosition* camera = [GMSCameraPosition cameraWithLatitude:_currentLocation.coordinate.latitude
                                                               longitude:_currentLocation.coordinate.longitude
                                                                    zoom:15];
        if ([_mapView isHidden]) {
            [_mapView setHidden:NO];
            [_mapView setCamera:camera];
        }
        else
        {
            [_mapView animateToCameraPosition:camera];
        }
    }
}

-(void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [manager startUpdatingLocation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    [manager stopUpdatingLocation];
    NSLog(@"Error: %@",error.localizedDescription);
}

#pragma mark - Loading DataSource

-(void)setSpaceID:(NSString*)spaceID
{
    _spaceID = spaceID;
    _firebaseRef = FIRDatabase.database.reference;

    //Retive Data
    [[[_firebaseRef child:@"space_data"] child:_spaceID] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        self->_dataSource = (NSDictionary*)snapshot.value;
        [self reloadData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    //Handle Data change
    [[[_firebaseRef child:@"space_data"] child:_spaceID] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        if ([snapshot.value isKindOfClass:[NSDictionary class]]) {
            self->_dataSource = (NSDictionary*)snapshot.value;
            [self reloadData];
        }
    }];
}

-(void)reloadData
{
    [_detailsView setDataSource:_dataSource];
    [self scanDirection];
}

@end
