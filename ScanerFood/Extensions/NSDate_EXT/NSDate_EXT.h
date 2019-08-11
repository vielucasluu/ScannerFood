//
//  NSDate_EXT.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/11/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (expanded)

+ (NSInteger)daysBetweenDate:(NSDate*)fromDateTime andDate:(NSDate*)toDateTime;
+ (NSDate*)dateFromString:(NSString*)str;
- (NSString*)stringFromDate;

@end
