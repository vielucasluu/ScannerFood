//
//  CC_MainPageGroupCells.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/5/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import "CC_MainPageGroupCells.h"

@implementation CC_MainPageGroupCells

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    self.layer.shadowOffset = CGSizeMake(1, 0);
    self.layer.shadowColor = [[UIColor blackColor] CGColor];
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = .25;
    self.clipsToBounds = NO;
    self.layer.masksToBounds = NO;
    
    _groupImage = [[UIImageView alloc] init];
    [_groupName setContentMode:UIViewContentModeScaleAspectFit];
    [_groupName.layer setMasksToBounds:YES];
    [_groupImage setBackgroundColor:[UIColor yellowColor]];
    [_groupImage setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_groupImage];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupImage
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeTop
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupImage
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupImage
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupImage
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_groupImage
                                                     attribute:NSLayoutAttributeWidth
                                                    multiplier:0.71
                                                      constant:0.0]];
    
    _groupName = [[UILabel alloc] init];
    [_groupName setTextAlignment:NSTextAlignmentCenter];
    [_groupName setNumberOfLines:0];
    [_groupName setFont:[UIFont boldSystemFontOfSize:12]];
    [_groupName setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self addSubview:_groupName];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupName
                                                     attribute:NSLayoutAttributeTop
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:_groupImage
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupName
                                                     attribute:NSLayoutAttributeLeft
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeLeft
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupName
                                                     attribute:NSLayoutAttributeRight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeRight
                                                    multiplier:1.0
                                                      constant:0.0]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:_groupName
                                                     attribute:NSLayoutAttributeBottom
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:self
                                                     attribute:NSLayoutAttributeBottom
                                                    multiplier:1.0
                                                      constant:0.0]];
    
    return self;
}

@end
