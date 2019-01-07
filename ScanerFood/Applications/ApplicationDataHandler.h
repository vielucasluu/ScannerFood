//
//  ApplicationDataHandler.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/14/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ApplicationDataHandlerDelegate <NSObject>
@required
-(void)LVLDataRequestComplete:(id) responseValue;

@end

@interface ApplicationDataHandler : NSObject

@property (strong, nonatomic) User* user;

+(ApplicationDataHandler *)shareInstance;

-(void)signInWithUserName:(NSString*)userName
                 password:(NSString*)password
                   sender:(NSObject<ApplicationDataHandlerDelegate>*)sender;

@end
