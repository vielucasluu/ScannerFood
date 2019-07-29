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

@property (strong, nonatomic) AutoScrollLabel*  spaceName;
@property (strong, nonatomic) AutoScrollLabel*  spaceAddress;
@property (strong, nonatomic) AutoScrollLabel*  spacePhone;
@property (strong, nonatomic) AutoScrollLabel*  spaceAdmin;
@property (strong, nonatomic) AutoScrollLabel*  spaceDocument;
@property (strong, nonatomic) AutoScrollLabel*  spaceDate;

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
        [contactTitle setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
        [contactTitle setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
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
        
        UIImageView* spaceNameIcon = [[UIImageView alloc] init];
        [spaceNameIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [spaceNameIcon setImage:[UIImage imageNamed:@"space_name"]];
        [self.pageScroll addSubview:spaceNameIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeBottom
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
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        _spaceName = [[AutoScrollLabel alloc] init];
        [_spaceName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceName setLabelText:@""];
        [_spaceName setLabelFont:[UIFont boldSystemFontOfSize:13]];
        [_spaceName setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceName];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
//        _xPos = 20;
//        _yPos += 40;
//        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* spaceAddressIcon = [[UIImageView alloc] init];
        [spaceAddressIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [spaceAddressIcon setImage:[UIImage imageNamed:@"space_location"]];
        [self.pageScroll addSubview:spaceAddressIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
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
//        _xPos += 50;
//        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spaceAddress = [[AutoScrollLabel alloc] init];
        [_spaceAddress setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceAddress setLabelText:@""];
        [_spaceAddress setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spaceAddress setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceAddress];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAddress
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];

        UIImageView* phoneIcon = [[UIImageView alloc] init];
        [phoneIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [phoneIcon setImage:[UIImage imageNamed:@"space_phone"]];
        [self.pageScroll addSubview:phoneIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceAddressIcon
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:phoneIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceNameIcon
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

//        _xPos += 50;
//        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spacePhone = [[AutoScrollLabel alloc] init];
        [_spacePhone setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spacePhone setLabelText:@""];
        [_spacePhone setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spacePhone setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spacePhone];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:phoneIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:phoneIcon
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:phoneIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spacePhone
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
//        _yPos += 50;
//        contentRect = CGRectMake(10, _yPos, selfFrame.size.width, 30);
        UILabel* registerInfo = [[UILabel alloc] init];
        [registerInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [registerInfo setText:@"Thông tin đăng ký"];
        [registerInfo setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
        [registerInfo setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
        [self.pageScroll addSubview:registerInfo];
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
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerInfo
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spacePhone
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
//
//        _xPos = 20;
//        _yPos += 40;
//        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* adminIcon = [[UIImageView alloc] init];
        [adminIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [adminIcon setImage:[UIImage imageNamed:@"space_admin"]];
        [self.pageScroll addSubview:adminIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:adminIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
//        _xPos += 50;
//        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 40);
        _spaceAdmin = [[AutoScrollLabel alloc] init];
        [_spaceAdmin setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceAdmin setLabelText:@""];
        [_spaceAdmin setLabelFont:[UIFont boldSystemFontOfSize:13]];
        [_spaceAdmin setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceAdmin];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:adminIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:adminIcon
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:adminIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceAdmin
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];

//        _xPos = 20;
//        _yPos += 40;
//        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* documentIcon = [[UIImageView alloc] init];
        [documentIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [documentIcon setImage:[UIImage imageNamed:@"space_document"]];
        [self.pageScroll addSubview:documentIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:adminIcon
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:documentIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
//
//        _xPos += 50;
//        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spaceDocument = [[AutoScrollLabel alloc] init];
        [_spaceDocument setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceDocument setLabelText:@""];
        [_spaceDocument setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spaceDocument setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceDocument];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:documentIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:documentIcon
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:documentIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDocument
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
//
//        _xPos = 20;
//        _yPos += 30;
//        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* dateIcon = [[UIImageView alloc] init];
        [dateIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [dateIcon setImage:[UIImage imageNamed:@"space_date"]];
        [self.pageScroll addSubview:dateIcon];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:documentIcon
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:10.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:dateIcon
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:registerInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];

//        _xPos += 50;
//        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spaceDate = [[AutoScrollLabel alloc] init];
        [_spaceDate setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceDate setLabelText:@""];
        [_spaceDate setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spaceDate setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceDate];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:dateIcon
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:5.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeCenterY
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:dateIcon
                                                                    attribute:NSLayoutAttributeCenterY
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:dateIcon
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_spaceDate
                                                                    attribute:NSLayoutAttributeRight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeRight
                                                                   multiplier:1.0
                                                                     constant:0.0]];

////        _yPos += 30;
////        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
////        AutoScrollLabel* spacePolice = [[AutoScrollLabel alloc] initWithFrame:contentRect];
////        [spacePolice setLabelText:@"Ban Quản lý ATTP"];
////        [spacePolice setLabelFont:[UIFont italicSystemFontOfSize:12]];
////        [spacePolice setLabelTextAlignment:NSTextAlignmentLeft];
////        [self.pageScroll addSubview:spacePolice];
//        
//        _yPos += 40;
//        contentRect = CGRectMake(10, _yPos, selfFrame.size.width, 30);
        UILabel* checkingInfo = [[UILabel alloc] init];
        [checkingInfo setTranslatesAutoresizingMaskIntoConstraints:NO];
        [checkingInfo setText:@"Lịch sử thanh tra/kiểm tra"];
        [checkingInfo setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
        [checkingInfo setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
        [self.pageScroll addSubview:checkingInfo];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeLeft
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeLeft
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeHeight
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeHeight
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:checkingInfo
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:_spaceDate
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:5.0]];
    }
    return self;
}

-(void)setDataSource:(NSDictionary*)dataSource
{
    [_spaceName setLabelText:[dataSource objectForKey:@"ten_cong_ty"]];
    [_spaceAddress setLabelText:[NSString stringWithFormat:@"%@ - %@",[dataSource objectForKey:@"dia_chi"],[dataSource objectForKey:@"phuong_xa"]]];
    [_spacePhone setLabelText:[dataSource objectForKey:@"di_dong"]];
    [_spaceAdmin setLabelText:[dataSource objectForKey:@"dai_dien"]];
    [_spaceDocument setLabelText:[dataSource objectForKey:@"giay_CN_ATTP"]];
    
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd/MM/yyyy"];
    NSDate* date = [dateFormater dateFromString:[dataSource objectForKey:@"ngay_cap"]];
    NSString* dateString = [dateFormater stringFromDate:date]?[dateFormater stringFromDate:date]:@"";
    
    [_spaceDate setLabelText:[NSString stringWithFormat:@"%@  %@",dateString,[dataSource objectForKey:@"noi_cap"]]];
    
//    NSArray* listReview = [dataSource objectForKey:@"list_review"];
//    NSArray* listReview = @[@"20/08/2018 - Cập nhật địa chỉ",@"20/08/2018 - Cập nhật thông tin giấy phép",@"20/08/2018 - Cập nhật tên cơ sở"];
//    [self setReview:listReview];
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
