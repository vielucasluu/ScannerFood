//
//  VW_UserInfoView.m
//  ScanerFood
//
//  Created by Lucas Luu on 9/7/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_UserInfoView.h"

@interface VW_UserInfoView()

@property (strong, nonatomic) UIImageView* logo;
@property (strong, nonatomic) UILabel* userName;

@end

@implementation VW_UserInfoView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
            
        _logo = [[UIImageView alloc] init];
        [_logo setImage:[UIImage imageNamed:@"lunch_image_icon"]];
        [_logo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_logo];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:100.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.4
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_logo
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_logo
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        
        UILabel* logininLabel = [[UILabel alloc] init];
        [logininLabel setText:@"Signed as"];
        [logininLabel setTextAlignment:NSTextAlignmentCenter];
        [logininLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:logininLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:logininLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_logo
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:30.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:logininLabel
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:logininLabel
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.6
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:logininLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:logininLabel
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:30.0]];
        
        _userName = [[UILabel alloc] init];
        [_userName.layer setBorderWidth:0.5];
        [_userName.layer setBorderColor:[UIColor blackColor].CGColor];
        [_userName.layer setCornerRadius:10];
        [_userName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_userName];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:logininLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.6
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_userName
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_userName
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:50.0]];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateData) name:@"kUserSignedIn" object:nil];
    }
    return self;
}

-(void)updateData
{
    User* userData = [_AppDataHandler userID];
    [_userName setText:userData.userName];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
