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
#import "VW_ReviewView.h"

@interface VC_MainPageSpaceDetails ()<GMSMapViewDelegate, CLLocationManagerDelegate>
{
    CLLocationManager*  _locationManager;
    CLLocation*         _currentLocation;
    
    NSDictionary*       _dataSource;
}
@property (strong, nonatomic) ApplicationDirectionService* directionService;

@property (strong, nonatomic) GMSMapView*   mapView;
@property (strong, nonatomic) NSMutableArray* addedPolyline;
@property (strong, nonatomic) UIButton*     detailsBtn;
@property (strong, nonatomic) UIButton*     directionBtn;
@property (strong, nonatomic) UIButton*     editBtn;

@property (strong, nonatomic) VW_DetailsView*       detailsView;
@property (strong, nonatomic) VW_DirectionView*     directionView;
@property (strong, nonatomic) VW_ReviewView*          reviewView;

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
                                                                 zoom:11];
    
    CGRect frame = self.view.frame;
    CGRect contentRect = CGRectMake(0, 0, frame.size.width, frame.size.width*9/16);
    
    _mapView = [GMSMapView mapWithFrame:contentRect camera:camera];
    [_mapView setMyLocationEnabled:YES];
    [_mapView.settings setMyLocationButton:YES];
    [_mapView setDelegate:self];
    [self.view addSubview:_mapView];
    
    UIView* tabbarButtonView = [[UIView alloc] init];
    [tabbarButtonView setBackgroundColor:[UIColor LVL_colorWithHexString:@"f1f1f1" andAlpha:1.0]];
    [tabbarButtonView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:tabbarButtonView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_mapView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:50.0]];
    
//    yPos += contentRect.size.height;
//    xPos = (frame.size.width - 3*30)/4;
//    contentRect = CGRectMake(xPos, 10, 30, 30);
    _detailsBtn = [[UIButton alloc] init];
    [_detailsBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_detailsBtn setSelected:YES];
    [_detailsBtn setBackgroundImage:[[UIImage imageNamed:@"detail_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_detailsBtn setBackgroundImage:[[UIImage imageNamed:@"detail_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_detailsBtn addTarget:self action:@selector(detailsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarButtonView addSubview:_detailsBtn];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_detailsBtn
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:0.5
                                                                  constant:0.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_detailsBtn
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_detailsBtn
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0
                                                                  constant:30.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_detailsBtn
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0
                                                                  constant:30.0]];
    
    _directionBtn = [[UIButton alloc] init];
    [_directionBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_directionBtn setBackgroundImage:[[UIImage imageNamed:@"direction"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_directionBtn setBackgroundImage:[[UIImage imageNamed:@"direction"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_directionBtn addTarget:self action:@selector(directionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarButtonView addSubview:_directionBtn];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_directionBtn
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_directionBtn
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_directionBtn
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0
                                                                  constant:30.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_directionBtn
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0
                                                                  constant:30.0]];
    
    _editBtn = [[UIButton alloc] initWithFrame:CGRectZero];
    [_editBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_editBtn setBackgroundImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_editBtn setBackgroundImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_editBtn addTarget:self action:@selector(editButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [tabbarButtonView addSubview:_editBtn];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_editBtn
                                                                 attribute:NSLayoutAttributeCenterX
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeCenterX
                                                                multiplier:1.5
                                                                  constant:0.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_editBtn
                                                                 attribute:NSLayoutAttributeCenterY
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeCenterY
                                                                multiplier:1.0
                                                                  constant:0.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_editBtn
                                                                 attribute:NSLayoutAttributeWidth
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeWidth
                                                                multiplier:0.0
                                                                  constant:30.0]];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_editBtn
                                                                 attribute:NSLayoutAttributeHeight
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:0.0
                                                                  constant:30.0]];
    
    _detailsView = [[VW_DetailsView alloc] initWithFrame:CGRectZero];
    [_detailsView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_detailsView setHidden:NO];
    [self.view addSubview:_detailsView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_detailsView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_detailsView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_detailsView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_detailsView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    
    _directionView = [[VW_DirectionView alloc] init];
    [_directionView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_directionView setHidden:YES];
    [self.view addSubview:_directionView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_directionView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_directionView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_directionView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_directionView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    _reviewView = [[VW_ReviewView alloc] init];
    [_reviewView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_reviewView setSpaceID:_spaceID];
    [_reviewView setKeyString:_keyString];
    [_reviewView setHidden:YES];
    [self.view addSubview:_reviewView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_reviewView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_reviewView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_reviewView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_reviewView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = _mapView;
    
    [self reloadData];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [_mapView clear];
    // clear polyline
    if (_addedPolyline.count > 0) {
        for (GMSPolyline *polylineToremove in _addedPolyline) {
            [polylineToremove setMap:nil];
        }
        _addedPolyline = [NSMutableArray new];
    }
}

#pragma mark - Loading UI
-(void)detailsButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_directionBtn setSelected:NO];
    [_editBtn setSelected:NO];
    
    [_detailsView setHidden:NO];
    [_directionView setHidden:YES];
    [_reviewView setHidden:YES];
}

-(void)directionButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_editBtn setSelected:NO];
    [_detailsBtn setSelected:NO];
    
    [_detailsView setHidden:YES];
    [_directionView setHidden:NO];
    [_reviewView setHidden:YES];
}

-(void)editButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_directionBtn setSelected:NO];
    [_detailsBtn setSelected:NO];
    
    [_detailsView setHidden:YES];
    [_directionView setHidden:YES];
    [_reviewView setHidden:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Process Location

-(void)scanDirection
{
    [_mapView clear];
    NSString* origin = @"10.773327, 106.690346"; // Trung Tam ATTP
    NSString* destination = [_dataSource objectForKey:@"location"];
    
    NSArray* elementLocation = [destination componentsSeparatedByString:@", "];
    
    GMSMarker* destinationMarker = [GMSMarker markerWithPosition:CLLocationCoordinate2DMake([elementLocation[0] doubleValue], [elementLocation[1] doubleValue])];
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
    // clear polyline
    if (_addedPolyline.count > 0) {
        for (GMSPolyline *polylineToremove in _addedPolyline) {
            [polylineToremove setMap:nil];
        }
    }
    
    _addedPolyline = [NSMutableArray new];
    for (Step* step in self.directionService.selectSteps){
        if (![step.polyline.points isEqualToString:@""])
        {
            GMSPath* path = [GMSPath pathFromEncodedPath:step.polyline.points];
            GMSPolyline* routePolyline = [GMSPolyline polylineWithPath:path];
            [routePolyline setStrokeColor:[UIColor blueColor]];
            [routePolyline setStrokeWidth:3.0];
            [routePolyline setMap:_mapView];
            [_addedPolyline addObject:routePolyline];
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
    [_reviewView setSpaceID:spaceID];
    _firebaseRef = FIRDatabase.database.reference;

    //Retive Data
    [[[_firebaseRef child:_keyString] child:_spaceID] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        self->_dataSource = (NSDictionary*)snapshot.value;
        [self reloadData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    //Handle Data change
    [[[_firebaseRef child:_keyString] child:_spaceID] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        if ([snapshot.value isKindOfClass:[NSDictionary class]]) {
            self->_dataSource = (NSDictionary*)snapshot.value;
            [self reloadData];
        }
    }];
}

-(void)reloadData
{
    if (_dataSource) {
        [_detailsView setDataSource:_dataSource];
        [self scanDirection];
    }
}

@end
