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
}
@property (strong, nonatomic) UIScrollView*     pageScroll;
@property (strong, nonatomic) UILabel*          spaceName;

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
        AutoScrollLabel* spaceName = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spaceName setLabelText:@"Cty Cổ Phần Nhà Hàng Bách Việt"];
        [spaceName setLabelFont:[UIFont boldSystemFontOfSize:13]];
        [spaceName setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceName];
        
        _xPos = 20;
        _yPos += 40;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* spaceAddressIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [spaceAddressIcon setImage:[UIImage imageNamed:@"space_location"]];
        [self.pageScroll addSubview:spaceAddressIcon];

        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        AutoScrollLabel* spaceAddress = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spaceAddress setLabelText:@"số 206 QL 13 - Phường 26 - Quận Bình Thạnh"];
        [spaceAddress setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [spaceAddress setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceAddress];
        
        _xPos = 20;
        _yPos += 30;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* phoneIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [phoneIcon setImage:[UIImage imageNamed:@"space_phone"]];
        [self.pageScroll addSubview:phoneIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        AutoScrollLabel* spacePhone = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spacePhone setLabelText:@"09085285392"];
        [spacePhone setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [spacePhone setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spacePhone];
        
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
        AutoScrollLabel* spaceAdmin = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spaceAdmin setLabelText:@"Nguyễn Ngọc Long"];
        [spaceAdmin setLabelFont:[UIFont boldSystemFontOfSize:13]];
        [spaceAdmin setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceAdmin];
        
        _xPos = 20;
        _yPos += 40;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* documentIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [documentIcon setImage:[UIImage imageNamed:@"space_document"]];
        [self.pageScroll addSubview:documentIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        AutoScrollLabel* spaceDocument = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spaceDocument setLabelText:@"1709/2016/ATTP-CNĐK"];
        [spaceDocument setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [spaceDocument setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceDocument];
        
        _xPos = 20;
        _yPos += 30;
        contentRect = CGRectMake(_xPos, _yPos, 30, 30);
        UIImageView* dateIcon = [[UIImageView alloc] initWithFrame:contentRect];
        [dateIcon setImage:[UIImage imageNamed:@"space_date"]];
        [self.pageScroll addSubview:dateIcon];
        
        _xPos += 50;
        contentRect = CGRectMake(_xPos, _yPos, selfFrame.size.width-50, 30);
        AutoScrollLabel* spaceDate = [[AutoScrollLabel alloc] initWithFrame:contentRect];
        [spaceDate setLabelText:@"20/08/2018 - Ban Quản lý ATTP"];
        [spaceDate setLabelFont:[UIFont italicSystemFontOfSize:12]];
        [spaceDate setLabelTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceDate];
        
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
    NSArray* listReview = @[@"20/08/2018 - Cập nhật địa chỉ",@"20/08/2018 - Cập nhật thông tin giấy phép",@"20/08/2018 - Cập nhật tên cơ sở"];
    _xPos = 20;
   
    for (NSString* textString in listReview) {
        CGRect contentRect = CGRectMake(_xPos, _yPos, self.frame.size.width-50, 30);
        UILabel* spaceDate = [[UILabel alloc] initWithFrame:contentRect];
        [spaceDate setText:textString];
        [spaceDate setFont:[UIFont italicSystemFontOfSize:12]];
        [spaceDate setTextAlignment:NSTextAlignmentLeft];
        [self.pageScroll addSubview:spaceDate];
        
        _yPos += 30;
    }
    
    [self.pageScroll setContentSize:CGSizeMake(self.frame.size.width, _yPos + 10)];
}

@end
