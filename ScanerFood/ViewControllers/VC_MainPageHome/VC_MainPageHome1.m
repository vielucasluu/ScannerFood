//
//  VC_MainPageHome.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/3/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VC_MainPageHome1.h"
#import "VC_MainPageSeach.h"
#import "VC_MainPageManager.h"

@interface VC_MainPageHome1 ()

@property (strong, nonatomic) VC_MainPageSeach* mapVC;
@property (strong, nonatomic) VC_MainPageManager* managerVC;

@end

@implementation VC_MainPageHome1

+(VC_MainPageHome1 *)shareInstance
{
    static VC_MainPageHome1 *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[VC_MainPageHome1 alloc] init];
    });
    return _sharedInstance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapVC = [[VC_MainPageSeach alloc] init];
    UINavigationController* firstNavController = [[UINavigationController alloc] initWithRootViewController:self.mapVC];
    firstNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Search"
                                                                  image:[[UIImage imageNamed:@"tabbar_map"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                          selectedImage:[[UIImage imageNamed:@"tabbar_map"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [firstNavController.tabBarItem setTag:0];
    
    self.managerVC = [[VC_MainPageManager alloc] init];
    UINavigationController* secondNavController = [[UINavigationController alloc] initWithRootViewController:self.managerVC];
    secondNavController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Manager"
                                                                  image:[[UIImage imageNamed:@"tabbar_manager"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                          selectedImage:[[UIImage imageNamed:@"tabbar_manager"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate]];
    [secondNavController.tabBarItem setTag:0];
    
    [self setViewControllers:@[firstNavController,secondNavController]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
