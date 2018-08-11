//
//  VW_DetailsView.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/9/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_DetailsView.h"

@interface VW_DetailsView ()

@property (strong, nonatomic) UIScrollView*     scrollView;
@property (strong, nonatomic) UILabel*          spaceName;

@end

@implementation VW_DetailsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor redColor]];
        
        self.scrollView = [[UIScrollView alloc] init];
        [self.scrollView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_scrollView];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_scrollView
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        
        UILabel* contactTitle = [[UILabel alloc] init];
        [contactTitle setText:@"Thông tin cơ bản"];
        [self.scrollView addSubview:contactTitle];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.scrollView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeCenterX
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.scrollView
                                                                    attribute:NSLayoutAttributeCenterX
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeWidth
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.scrollView
                                                                    attribute:NSLayoutAttributeWidth
                                                                   multiplier:1.0
                                                                     constant:-20.0]];
        [self.scrollView addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:contactTitle
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:-40.0]];
    }
    return self;
}

-(void)updateScrollView
{
    
}

@end
