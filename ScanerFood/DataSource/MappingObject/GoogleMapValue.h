//
//  GoogleMapValue.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoogleMapValue : NSObject

@property (strong, nonatomic) NSString* text;
@property (assign, nonatomic) NSInteger value;

-(instancetype)initWithDataSource:(NSDictionary*)dataSource;

@end
