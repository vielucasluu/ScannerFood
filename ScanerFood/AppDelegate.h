//
//  AppDelegate.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/3/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) ApplicationNavigationController* navController;
@property (strong, nonatomic) ApplicationDataHandler* dataHandler;

+ (AppDelegate*)sharedInstance;

@end

