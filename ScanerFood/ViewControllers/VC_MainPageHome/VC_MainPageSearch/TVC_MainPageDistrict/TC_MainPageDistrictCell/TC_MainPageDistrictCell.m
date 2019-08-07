//
//  TC_MainPageDistrictCell.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/8/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "TC_MainPageDistrictCell.h"

@interface TC_MainPageDistrictCell()

@property (strong, nonatomic) UIImageView*  directionIcon;

@end

@implementation TC_MainPageDistrictCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _spaceNameLabel = [[UILabel alloc] init];
        [_spaceNameLabel setNumberOfLines:2];
        [_spaceNameLabel setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:14]];
        [_spaceNameLabel setTextColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
        [_spaceNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceNameLabel setText:@""];
        [self addSubview:_spaceNameLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:0.0
                                                          constant:40.0]];
        _addressLabel = [[UILabel alloc] init];
        [_addressLabel setFont:[UIFont fontWithName:@"AvenirNext-Medium" size:11]];
        [_addressLabel setTextColor:[UIColor grayColor]];
        [_addressLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_addressLabel setNumberOfLines:2];
        [_addressLabel setText:@""];
        [self addSubview:_addressLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressLabel
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressLabel
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-70.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_addressLabel
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:40.0]];
        
        _warningImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"warning_icon"]];
        [_warningImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_warningImage];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_warningImage
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_addressLabel
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_warningImage
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_warningImage
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:0.0
                                                          constant:20.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_warningImage
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_warningImage
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant:0.0]];
        _reviewStatus = [[UILabel alloc] init];
        _reviewStatus.text = @"Đã kiểm tra (03 tháng trước)";
        _reviewStatus.font = [UIFont fontWithName:@"AvenirNext-DemiBold" size:10];
        _reviewStatus.textColor = [UIColor LVL_colorWithHexString:kWarningGreenColor andAlpha:1.0];
        [_reviewStatus setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_reviewStatus];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_reviewStatus
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_addressLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_reviewStatus
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_addressLabel
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_reviewStatus
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_addressLabel
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_reviewStatus
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_reviewStatus
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:20.0]];

    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
