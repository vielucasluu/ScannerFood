//
//  User.h
//  ScanerFood
//
//  Created by Lucas Luu on 9/11/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (strong, nonatomic) NSString* userName;
@property (strong, nonatomic) NSString* password;
@property (strong, nonatomic) NSString* prioritylevel;

-(instancetype)initWithDict:(NSDictionary*)dict;

@end
