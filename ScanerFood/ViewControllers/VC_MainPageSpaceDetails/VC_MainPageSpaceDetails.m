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

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-33.86
                                                            longitude:151.20
                                                                 zoom:6];
    
    CGFloat xPos = 0.0;
    CGFloat yPos = 0.0;
    
    CGRect frame = self.view.frame;
    CGRect contentRect = CGRectMake(xPos, yPos, frame.size.width, frame.size.width*9/16);
    
    _mapView = [GMSMapView mapWithFrame:contentRect camera:camera];
    _mapView.myLocationEnabled = YES;
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
    [_detailsView setDataSource:nil];
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

#pragma mark - Loading DataSource
-(void)reloadData
{
    [self setTitle:@"Nhà Hàng Bách Việt"];
}

@end
