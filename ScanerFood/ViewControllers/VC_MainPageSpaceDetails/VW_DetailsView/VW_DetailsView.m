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
        
        CGRect selfFrame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        
        _xPos = 0.0;
        _yPos = 0.0;
        
        self.pageScroll = [[UIScrollView alloc] initWithFrame:selfFrame];
        [self addSubview:_pageScroll];
        
        CGRect contentRect = CGRectMake(10, 0, selfFrame.size.width, 30);
        UILabel* contactTitle = [[UILabel alloc] initWithFrame:contentRect];
        [contactTitle setText:@"Thông tin cơ bản"];
        [contactTitle setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
        [contactTitle setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
        [self.pageScroll addSubview:contactTitle];
        
        _xPos = 20; // thut dong
        _yPos += 30;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* spaceNameIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [spaceNameIcon setImage:[UIImage imageNamed:@"space_name"]];
        [self.pageScroll addSubview:spaceNameIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 40);
        _spaceName = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [_spaceName setLabelText:@""];
        [_spaceName setLabelFont:[UIFont boldSystemFontOfSize:13]];
        [_spaceName setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceName];
        
        _xPos = 20;
        _yPos += 40;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* spaceAddressIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [spaceAddressIcon setImage:[UIImage imageNamed:@"space_location"]];
        [self.pageScroll addSubview:spaceAddressIcon];

        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spaceAddress = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [_spaceAddress setLabelText:@""];
        [_spaceAddress setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spaceAddress setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceAddress];
        
        _xPos = 20;
        _yPos += 30;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* phoneIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [phoneIcon setImage:[UIImage imageNamed:@"space_phone"]];
        [self.pageScroll addSubview:phoneIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spacePhone = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [_spacePhone setLabelText:@""];
        [_spacePhone setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spacePhone setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spacePhone];
        
        _yPos += 50;
        contentRect = CGRectMake(10, _yPos, selfFrame.size.width, 30);
        UILabel* registerInfo = [[UILabel alloc] initWithFrame:contentRect];
        [registerInfo setText:@"Thông tin đăng ký"];
        [registerInfo setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
        [registerInfo setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
        [self.pageScroll addSubview:registerInfo];
        
        _xPos = 20;
        _yPos += 40;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* adminIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [adminIcon setImage:[UIImage imageNamed:@"space_admin"]];
        [self.pageScroll addSubview:adminIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 40);
        _spaceAdmin = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [_spaceAdmin setLabelText:@""];
        [_spaceAdmin setLabelFont:[UIFont boldSystemFontOfSize:13]];
        [_spaceAdmin setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceAdmin];
        
        _xPos = 20;
        _yPos += 40;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* documentIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [documentIcon setImage:[UIImage imageNamed:@"space_document"]];
        [self.pageScroll addSubview:documentIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spaceDocument = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [_spaceDocument setLabelText:@""];
        [_spaceDocument setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spaceDocument setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceDocument];
        
        _xPos = 20;
        _yPos += 30;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* dateIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [dateIcon setImage:[UIImage imageNamed:@"space_date"]];
        [self.pageScroll addSubview:dateIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        _spaceDate = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [_spaceDate setLabelText:@""];
        [_spaceDate setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [_spaceDate setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:_spaceDate];
        
//        _yPos += 30;
//        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
//        AutoScrollLabel* spacePolice = [[AutoScrollLabel alloc] initWithFrame:contentRect];
//        [spacePolice setLabelText:@"Ban Quản lý ATTP"];
//        [spacePolice setLabelFont:[UIFont italicSystemFontOfSize:12]];
//        [spacePolice setLabelTextAlignment:NSTextAlignmentLeft];
//        [self.pageScroll addSubview:spacePolice];
        
        _yPos += 40;
        contentRect = CGRectMake(10, _yPos, selfFrame.size.width, 30);
        UILabel* checkingInfo = [[UILabel alloc] initWithFrame:contentRect];
        [checkingInfo setText:@"Lịch sử kiểm định"];
        [checkingInfo setBackgroundColor:[UIColor LVL_colorWithHexString:@"ebeaf0" andAlpha:1.0]];
        [checkingInfo setTextColor:[UIColor LVL_colorWithHexString:@"355183" andAlpha:1.0]];
        [self.pageScroll addSubview:checkingInfo];
        
        _yPos += 40;
        [self.pageScroll setContentSize:CGSizeMake(selfFrame.size.width, _yPos + 40)];
    }
    return self;
}

-(void)setDataSource:(NSDictionary*)dataSource
{
    [_spaceName setLabelText:[dataSource objectForKey:@"space_name"]];
    [_spaceAddress setLabelText:[NSString stringWithFormat:@"%@ - %@",[dataSource objectForKey:@"address"],[dataSource objectForKey:@"address_2"]]];
    [_spacePhone setLabelText:[dataSource objectForKey:@"space_phone"]];
    [_spaceAdmin setLabelText:[dataSource objectForKey:@"space_admin"]];
    [_spaceDocument setLabelText:[dataSource objectForKey:@"space_document"]];
    
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd-MM-yyyy"];
    NSDate* date = [dateFormater dateFromString:[dataSource objectForKey:@"space_date"]];
    NSString* dateString = [dateFormater stringFromDate:date]?[dateFormater stringFromDate:date]:@"";
    
    [_spaceDate setLabelText:[NSString stringWithFormat:@"%@  %@",dateString,[dataSource objectForKey:@"space_police"]]];
    
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
