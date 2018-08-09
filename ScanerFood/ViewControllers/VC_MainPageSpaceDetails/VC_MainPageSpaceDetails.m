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

@interface VC_MainPageSpaceDetails ()

@property (strong, nonatomic) GMSMapView*   mapView;
@property (strong, nonatomic) UIButton*     detailsBtn;
@property (strong, nonatomic) UIButton*     directionBtn;
@property (strong, nonatomic) UIButton*     editBtn;

@property (strong, nonatomic) VW_DetailsView*       detailsView;
@property (strong, nonatomic) VW_DirectionView*     directionView;
@property (strong, nonatomic) VW_EditView*          editView;

@end

@implementation VC_MainPageSpaceDetails

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    _mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    _mapView.myLocationEnabled = YES;
    [_mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_mapView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_mapView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_mapView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_mapView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_mapView
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_mapView
                                                          attribute:NSLayoutAttributeHeight
                                                         multiplier:4/3
                                                           constant:100.0]];
    UIView* tabbarButtonView = [[UIView alloc] init];
    [tabbarButtonView setBackgroundColor:[UIColor LVL_colorWithHexString:@"f1f1f1" andAlpha:1.0]];
    [tabbarButtonView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:tabbarButtonView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_mapView
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:tabbarButtonView
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:30.0]];
    _directionBtn = [[UIButton alloc] init];
    [_directionBtn setBackgroundImage:[[UIImage imageNamed:@"direction"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_directionBtn setBackgroundImage:[[UIImage imageNamed:@"direction"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_directionBtn addTarget:self action:@selector(directionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_directionBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tabbarButtonView addSubview:_directionBtn];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_directionBtn
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
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
                                                                    toItem:_directionBtn
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:0.0]];
    _detailsBtn = [[UIButton alloc] init];
    [_detailsBtn setSelected:YES];
    [_detailsBtn setBackgroundImage:[[UIImage imageNamed:@"detail_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_detailsBtn setBackgroundImage:[[UIImage imageNamed:@"detail_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_detailsBtn addTarget:self action:@selector(detailsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_detailsBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tabbarButtonView addSubview:_detailsBtn];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_detailsBtn
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
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
                                                                    toItem:_detailsBtn
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:0.0]];
    _editBtn = [[UIButton alloc] init];
    [_editBtn setBackgroundImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [_editBtn setBackgroundImage:[[UIImage imageNamed:@"edit_button"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateSelected];
    [_editBtn addTarget:self action:@selector(editButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [_editBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [tabbarButtonView addSubview:_editBtn];
    [tabbarButtonView addConstraint:[NSLayoutConstraint constraintWithItem:_editBtn
                                                                 attribute:NSLayoutAttributeTop
                                                                 relatedBy:NSLayoutRelationEqual
                                                                    toItem:tabbarButtonView
                                                                 attribute:NSLayoutAttributeTop
                                                                multiplier:1.0
                                                                  constant:0.0]];
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
                                                                    toItem:_editBtn
                                                                 attribute:NSLayoutAttributeHeight
                                                                multiplier:1.0
                                                                  constant:0.0]];
    
    // Creates a marker in the center of the map.
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
    marker.title = @"Sydney";
    marker.snippet = @"Australia";
    marker.map = _mapView;
}

-(void)directionButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_editBtn setSelected:NO];
    [_detailsBtn setSelected:NO];
}

-(void)detailsButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_directionBtn setSelected:NO];
    [_editBtn setSelected:NO];
}

-(void)editButtonTapped:(UIButton*)btn
{
    [btn setSelected:YES];
    [_directionBtn setSelected:NO];
    [_detailsBtn setSelected:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
