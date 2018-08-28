//
//  VW_EditView.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/9/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_EditView.h"
#import "VC_MainPageSpaceDetails.h"

@interface VW_EditView()

{
    FIRDatabaseReference* _firebaseRef;
}

@end

@implementation VW_EditView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _firebaseRef = FIRDatabase.database.reference;
    }
    return self;
}

-(void)addReview
{
    //Hard code
    NSString* spaceID = [_delegate spaceID];
    NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd-MM-yyyy"];
    NSString* date = [dateFormatter stringFromDate:[NSDate date]];
    
    NSString *key = [[[_firebaseRef child:@"space_data"] child:spaceID] childByAutoId].key;
    NSDictionary *post = @{@"date": date,
                           @"author": @"Admin001",
                           @"title": @"Cập nhật thông tin giấy phép"};
    NSDictionary *childUpdates = @{[@"/reviews/" stringByAppendingString:key]: post};
    [[[_firebaseRef child:@"space_data"] child:spaceID] updateChildValues:childUpdates];
}

@end
