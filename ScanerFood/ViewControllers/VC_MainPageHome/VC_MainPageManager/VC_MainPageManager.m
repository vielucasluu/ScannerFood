//
//  VC_MainPageManager.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/3/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VC_MainPageManager.h"
#import "VW_SignInView.h"
#import "VW_UserInfoView.h"

@interface VC_MainPageManager ()

@property (strong, nonatomic) VW_SignInView* signInView;
@property (strong, nonatomic) VW_UserInfoView* userInfoView;

@end

@implementation VC_MainPageManager

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _userInfoView = [[VW_UserInfoView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_userInfoView];
    
    _signInView = [[VW_SignInView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_signInView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
