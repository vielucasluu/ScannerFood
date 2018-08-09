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
        [_spaceNameLabel setNumberOfLines:0];
        [_spaceNameLabel setFont:[UIFont boldSystemFontOfSize:14]];
        [_spaceNameLabel setTextColor:[UIColor blueColor]];
        [_spaceNameLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_spaceNameLabel setText:@"CHI NHÁNH CÔNG TY CỔ PHẨN NHÀ HÀNG BÁCH VIỆT"];
        [self addSubview:_spaceNameLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
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
                                                          constant:-70.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:40.0]];
        _addressLabel = [[UILabel alloc] init];
        [_addressLabel setFont:[UIFont systemFontOfSize:12]];
        [_addressLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_addressLabel setText:@"89/10 NGÔ ĐỨC KẾ - Phường 12"];
        [self addSubview:_addressLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_addressLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceNameLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:5.0]];
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
                                                          constant:10.0]];
        _districtLabel = [[UILabel alloc] init];
        [_districtLabel setFont:[UIFont systemFontOfSize:12]];
        [_districtLabel setTextColor:[UIColor grayColor]];
        [_districtLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_districtLabel setText:@"Quận Bình Thạnh"];
        [self addSubview:_districtLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_districtLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_addressLabel
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_districtLabel
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_districtLabel
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-70.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_districtLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        _directionIcon = [[UIImageView alloc] init];
        [_directionIcon setImage:[UIImage imageNamed:@"direction"]];
        [_directionIcon setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_directionIcon];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_directionIcon
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_directionIcon
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_directionIcon
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_directionIcon
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-30.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_directionIcon
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_directionIcon
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:30.0]];
        _distanceLabel = [[UILabel alloc] init];
        [_distanceLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
        [_distanceLabel setText:@"3,7 km"];
        [self addSubview:_distanceLabel];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_distanceLabel
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_directionIcon
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_distanceLabel
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-10.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_distanceLabel
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-70.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_distanceLabel
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_distanceLabel
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:40.0]];
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
