//
//  ApplicationDataHandler.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "ApplicationDataHandler.h"

#define kBaseURLString @""

@interface ApplicationDataHandler ()

{
    AFHTTPSessionManager*   _manager;
}

@end

@implementation ApplicationDataHandler

+(ApplicationDataHandler *)shareInstance
{
    static ApplicationDataHandler *_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[ApplicationDataHandler alloc] init];
    });
    return _sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseURLString]];
        _manager.responseSerializer = [AFJSONResponseSerializer serializer];        
    }
    return self;
}


@end
