//
//  VW_DetailsView.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/9/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_DetailsView.h"

@interface VW_DetailsView ()
{
    CGFloat _xPos;
    CGFloat _yPos;
    
    NSMutableArray* _listReviewView;
}
@property (strong, nonatomic) UIScrollView*     pageScroll;

@property (strong, nonatomic) UILabel*  spaceName;
@property (strong, nonatomic) UILabel*  spaceAddress;
@property (strong, nonatomic) UILabel*  spacePhone;
@property (strong, nonatomic) UILabel*  spaceAdmin;
@property (strong, nonatomic) UILabel*  spaceDocument;
@property (strong, nonatomic) UILabel*  spaceDate;

@end

@implementation VW_DetailsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.pageScroll = [[UIScrollView alloc] init];
        [self.pageScroll setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_pageScroll];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        
//        CGRect contentRect = CGRectMake(10, 0, selfFrame.size.width, 30);
        UILabel* contactTitle = [[UILabel alloc] init];
        [contactTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
        [contactTitle setText:@"Thông tin cơ bản"];
        [contactTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18]];
        [self.pageScroll addSubview:contactTitle];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:-20.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:0.0
                                                                     constant:30.0]];
        _spaceName = [[UILabel alloc] init];
        [_spaceName setText:@""];
        [_spaceName setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13]];
        [_spaceName setTextAlignment:NSTextAlignmentLeft];
        [_spaceName setNumberOfLines:2];
        [_spaceName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:_spaceName];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:-20.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:40.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:30.0]];
        
        UIImageView* spaceNameIcon = [[UIImageView alloc] init];
        [spaceNameIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [spaceNameIcon setImage:[UIImage imageNamed:@"space_name"]];
        [self.pageScroll addSubview:spaceNameIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:20.0]];
        
        _spaceAddress = [[UILabel alloc] init];
        [_spaceAddress setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceAddress setText:@""];
        [_spaceAddress setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:12]];
        [_spaceAddress setTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceAddress];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:30.0]];
        
        UIImageView* spaceAddressIcon = [[UIImageView alloc] init];
        [spaceAddressIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [spaceAddressIcon setImage:[UIImage imageNamed:@"space_location"]];
        [self.pageScroll addSubview:spaceAddressIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
        _spacePhone = [[UILabel alloc] init];
        [_spacePhone setText:@""];
        [_spacePhone setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:12]];
        [_spacePhone setTextAlignment:NSTextAlignmentLeft];
        [_spacePhone setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:_spacePhone];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spacePhone
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:30.0]];
        
        UIImageView* phoneIcon = [[UIImageView alloc] init];
        [phoneIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [phoneIcon setImage:[UIImage imageNamed:@"space_phone"]];
        [self.pageScroll addSubview:phoneIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spacePhone
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:phoneIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:0.0]];

        UILabel* registerInfo = [[UILabel alloc] init];
        [registerInfo setText:@"Thông tin đăng ký"];
        [registerInfo setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18]];
        [registerInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:registerInfo];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerInfo
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spacePhone
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerInfo
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
        _spaceAdmin = [[UILabel alloc] init];
        [_spaceAdmin setText:@""];
        [_spaceAdmin setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:13]];
        [_spaceAdmin setTextAlignment:NSTextAlignmentLeft];
        [_spaceAdmin setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:_spaceAdmin];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:-20.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:40.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationGreaterThanOrEqual
                                                                       toItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:30.0]];
        
        UIImageView* adminIcon = [[UIImageView alloc] init];
        [adminIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [adminIcon setImage:[UIImage imageNamed:@"space_admin"]];
        [self.pageScroll addSubview:adminIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:adminIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
        _spaceDocument = [[UILabel alloc] init];
        [_spaceDocument setText:@""];
        [_spaceDocument setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:12]];
        [_spaceDocument setTextAlignment:NSTextAlignmentLeft];
        [_spaceDocument setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:_spaceDocument];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:30.0]];
        
        UIImageView* documentIcon = [[UIImageView alloc] init];
        [documentIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [documentIcon setImage:[UIImage imageNamed:@"space_document"]];
        [self.pageScroll addSubview:documentIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:documentIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
        _spaceDate = [[UILabel alloc] init];
        [_spaceDate setText:@""];
        [_spaceDate setFont:[UIFont fontWithName:@"AvenirNext-Regular" size:12]];
        [_spaceDate setTextAlignment:NSTextAlignmentLeft];
        [_spaceDate setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:_spaceDate];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceName
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDate
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:30.0]];
        UIImageView* dateIcon = [[UIImageView alloc] init];
        [dateIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [dateIcon setImage:[UIImage imageNamed:@"space_date"]];
        [self.pageScroll addSubview:dateIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDate
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:dateIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:0.0]];

        UILabel* checkingInfo = [[UILabel alloc] init];
        [checkingInfo setText:@"Lịch sử kiểm tra"];
        [checkingInfo setTextAlignment:NSTextAlignmentRight];
        [checkingInfo setFont:[UIFont fontWithName:@"AvenirNext-DemiBoldItalic" size:13]];
        [checkingInfo setTextColor:[UIColor LVL_colorWithHexString:@"B9531A" andAlpha:1.0]];
        [checkingInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:checkingInfo];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:-20.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDate
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        UIView* line = [[UIView alloc] init];
        [line setBackgroundColor:[UIColor LVL_colorWithHexString:@"B9531A" andAlpha:1.0]];
        [line setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:line];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:checkingInfo
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:-3.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:checkingInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:checkingInfo
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:line
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:1.0]];
        
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:line
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:-50.0]];
        
        UIGestureRecognizer* tapgesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewHistoryCheck)];
        [checkingInfo addGestureRecognizer:tapgesture];
        
    }
    return self;
}

-(void)viewHistoryCheck {
    if ([_delegate respondsToSelector:@selector(viewHistoryCheck)]) {
        [_delegate viewHistoryCheck];
    }
}

-(void)setDataSource:(SpaceDataSource*)dataSource
{
    [_spaceName setText:dataSource.tenCongty];
    [_spaceAddress setText:[NSString stringWithFormat:@"%@ - %@",dataSource.diachi,dataSource.phuong]];
    [_spacePhone setText:dataSource.diDong];
    [_spaceAdmin setText:dataSource.daidien];
    [_spaceDocument setText:dataSource.giayChungNhanATTP];
    
    NSDate* date = [NSDate dateFromString:dataSource.ngayCapGiayATTP];
    NSString* dateString = [date stringFromDate]?[date stringFromDate]:@"";
    [_spaceDate setText:[NSString stringWithFormat:@"%@  %@",dateString,dataSource.noiCapGiayATTP]];
}

-(void)setReview:(NSArray*)listReview
{
    for (UIView* view in _listReviewView) {
        [view removeFromSuperview];
    };
    
    _yPos = 340;
    [self.pageScroll setContentSize:CGSizeMake(self.frame.size.width, _yPos + 40)];
    
    _xPos = 20;
    _listReviewView = [NSMutableArray new];
    for (NSString* textString in listReview) {
        CGRect contentRect = CGRectMake(_xPos, _yPos, self.frame.size.width-50, 30);
        UILabel* spaceDate = [[UILabel alloc] initWithFrame:contentRect];
        [spaceDate setText:textString];
        [spaceDate setFont:[UIFont italicSystemFontOfSize:12]];
        [spaceDate setTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceDate];
        [_listReviewView addObject:spaceDate];
        
        _yPos += 30;
    }
    
    [self.pageScroll setContentSize:CGSizeMake(self.frame.size.width, _yPos + 10)];
}

@end
