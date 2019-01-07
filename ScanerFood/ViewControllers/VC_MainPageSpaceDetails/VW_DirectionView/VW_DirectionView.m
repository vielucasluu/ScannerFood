//
//  VW_DirectionView.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/9/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VW_DirectionView.h"

@interface VW_DirectionView()
{
    CGFloat _xPos;
    CGFloat _yPos;
}
@property (strong, nonatomic) UIScrollView*     pageScroll;
@property (strong, nonatomic) ApplicationDirectionService* directionService;

@end

@implementation VW_DirectionView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        
//        CGRect selfFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
//        _xPos = 0.0;
//        _yPos = 0.0;
        
        _pageScroll = [[UIScrollView alloc] init];
        [_pageScroll setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self addSubview:_pageScroll];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeCenterX
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterX
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeCenterY
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeCenterY
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeWidth
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeWidth
                                                        multiplier:1.0
                                                          constant:0.0]];
        [self addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                         attribute:NSLayoutAttributeHeight
                                                         relatedBy:NSLayoutRelationEqual
                                                            toItem:self
                                                         attribute:NSLayoutAttributeHeight
                                                        multiplier:1.0
                                                          constant:0.0]];
    }
    return self;
}

-(void)reloadData
{
    _directionService = [ApplicationDirectionService shareInstance];
    
    _yPos += 30;
    _xPos = 20;
    CGRect contentRect = CGRectMake(_xPos, _yPos, self.frame.size.width-50, 30);
    UILabel* spaceDistance = [[UILabel alloc] initWithFrame:contentRect];
    [spaceDistance setText:[_directionService totalDistance]];
    [spaceDistance setFont:[UIFont italicSystemFontOfSize:12]];
    [spaceDistance setTextAlignment:NSTextAlignmentLeft];
    [self.pageScroll addSubview:spaceDistance];
    
    _yPos += 30;
    contentRect = CGRectMake(_xPos, _yPos, self.frame.size.width-50, 30);
    UILabel* spaceDuration = [[UILabel alloc] initWithFrame:contentRect];
    [spaceDuration setText:[_directionService totalDuration]];
    [spaceDuration setFont:[UIFont italicSystemFontOfSize:12]];
    [spaceDuration setTextAlignment:NSTextAlignmentLeft];
    [self.pageScroll addSubview:spaceDuration];
    
    _xPos = 0.0;
    _yPos += 40;
    contentRect = CGRectMake(10, _yPos, self.frame.size.width, 30);
    UILabel* checkingInfo = [[UILabel alloc] initWithFrame:contentRect];
    [checkingInfo setText:@"Hướng dẫn chi tiết"];
    [checkingInfo setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
    [checkingInfo setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
    [self.pageScroll addSubview:checkingInfo];
    
    _yPos += 40;
    _xPos = 20;
    for (Step* step in _directionService.selectSteps) {
        CGRect contentRect = CGRectMake(_xPos, _yPos, self.frame.size.width-50, 30);
        AutoScrollLabel* spaceIntroduction = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spaceIntroduction setLabelText:[step htmlInstructions]];
        [spaceIntroduction setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [spaceIntroduction setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceIntroduction];
        
        _yPos += 30;
    }
    
    [self.pageScroll setContentSize:CGSizeMake(self.frame.size.width, _yPos + 10)];
}

@end
