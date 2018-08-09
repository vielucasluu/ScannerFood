//
//  TC_MainPageSearchCell.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/3/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "TC_MainPageSearchCell.h"

@implementation TC_MainPageSearchCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _spaceTypeImage = [[UIImageView alloc] init];
        [_spaceTypeImage setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_spaceTypeImage];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceTypeImage
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceTypeImage
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceTypeImage
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceTypeImage
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceTypeImage
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        
        _spaceCountLable = [[UILabel alloc] init];
        [_spaceCountLable setTextAlignment:NSTextAlignmentRight];
        [_spaceCountLable setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_spaceCountLable];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceCountLable
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceCountLable
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceCountLable
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-5.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceCountLable
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceCountLable
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:-110.0]];
        
        _spaceName = [[UILabel alloc] init];
        [_spaceName setNumberOfLines:0];
        [_spaceName setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_spaceName];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                         attribute:NSLayoutAttributeTop
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeTop
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                         attribute:NSLayoutAttributeBottom
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeBottom
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                         attribute:NSLayoutAttributeLeft
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceTypeImage
                                                         attribute:NSLayoutAttributeRight
                                                        multiplier:1.0
                                                          constant:20.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_spaceName
                                                         attribute:NSLayoutAttributeRight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:_spaceCountLable
                                                         attribute:NSLayoutAttributeLeft
                                                        multiplier:1.0
                                                          constant:0.0]];
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
