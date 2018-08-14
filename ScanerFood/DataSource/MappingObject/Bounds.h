//
//  Bounds.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bounds : NSObject

@property (strong, nonatomic) Location* northeast;
@property (strong, nonatomic) Location* southwest;

-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
