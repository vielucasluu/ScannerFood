//
//  Location.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (assign, nonatomic) CGFloat latitude;
@property (assign, nonatomic) CGFloat longtidude;

-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
