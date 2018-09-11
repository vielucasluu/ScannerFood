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
    NSMutableArray*         _listUser;
}
@property (strong, nonatomic) FIRDatabaseReference* firebaseRef;

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
        
        _listUser = [NSMutableArray new];
        _firebaseRef = FIRDatabase.database.reference;
        [[_firebaseRef child:@"user_login"] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
            //Code when new space has added;
            //Take the value and add it into list space
            if (snapshot.value) {
                User* newUser = [[User alloc] initWithDict:snapshot.value];
                [self->_listUser addObject:newUser];
            }
        }];
    }
    return self;
}

-(void)signInWithUserName:(NSString*)userName
                 password:(NSString*)password
                   sender:(NSObject<ApplicationDataHandlerDelegate>*)sender
{
    
    for (User* user in _listUser) {
        if ([user.userName isEqualToString:userName] && [user.password isEqualToString:password]) {
            _userID = user;
            if ([sender respondsToSelector:@selector(LVLDataRequestComplete:)]) {
                [sender LVLDataRequestComplete:user];
            }
            return;
        }
    }
    
    if ([sender respondsToSelector:@selector(LVLDataRequestComplete:)]) {
        [sender LVLDataRequestComplete:nil];
    }
}

@end
