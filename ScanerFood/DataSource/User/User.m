//
//  User.m
//  ScanerFood
//
//  Created by Lucas Luu on 9/11/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "User.h"

@implementation User

-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        _userName = [dict objectForKey:@"username"]?[dict objectForKey:@"username"]:@"";
        _password = [dict objectForKey:@"userpassword"]?[dict objectForKey:@"userpassword"]:@"";
        _prioritylevel = [dict objectForKey:@"prioritylevel"]?[dict objectForKey:@"prioritylevel"]:@"1";
    }
    return self;
}

@end
