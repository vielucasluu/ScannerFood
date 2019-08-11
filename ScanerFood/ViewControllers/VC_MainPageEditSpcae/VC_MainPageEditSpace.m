//
//  VC_MainPageEditSpcae.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/10/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import "VC_MainPageEditSpace.h"

@interface VC_MainPageEditSpace ()<UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate>
{
    SpaceDataSource*       _dataSource;
    UIPickerView*       _districtPickerView;
    CLLocationManager*  _locationManager;
}
@property (strong, nonatomic) UIScrollView* pageScroll;
@property (strong, nonatomic) UIButton*     saveBtn;

// Thông tin liên lạc
@property (strong, nonatomic) ErrorTextField* tenCongtyTxt;
@property (strong, nonatomic) ErrorTextField* diachiTxt;
@property (strong, nonatomic) ErrorTextField* phuongTxt;
@property (strong, nonatomic) ErrorTextField* quanTxt;
@property (strong, nonatomic) ErrorTextField* dienthoaiTxt;
@property (strong, nonatomic) ErrorTextField* diDongTxt;
@property (strong, nonatomic) ErrorTextField* emailTxt;
@property (strong, nonatomic) ErrorTextField* faxTxt;

//Thông tin đăng ký
@property (strong, nonatomic) ErrorTextField* daidienTxt;
@property (strong, nonatomic) ErrorTextField* giayDKKDTxt;
@property (strong, nonatomic) ErrorTextField* giayChungNhanATTPTxt;
@property (strong, nonatomic) ErrorTextField* ngayCapGiayATTPTxt;
@property (strong, nonatomic) ErrorTextField* noiCapGiayATTPTxt;
@property (strong, nonatomic) ErrorTextField* chungChiKhacTxt;
@property (strong, nonatomic) ErrorTextField* soSuatAnTxt;

//Thông tin thuê nấu
@property (strong, nonatomic) ErrorTextField* tenCSThueNauTxt;
@property (strong, nonatomic) ErrorTextField* diaChiCSThueNauTxt;
@property (strong, nonatomic) ErrorTextField* dienThoaiCSThueNauTxt;
@property (strong, nonatomic) ErrorTextField* capHocTxt;

// Phan loai
@property (strong, nonatomic) ErrorTextField* khuCongNghiepTxt;
@property (strong, nonatomic) ErrorTextField* khuCongNgheCaoTxt;
@property (strong, nonatomic) ErrorTextField* khuCheXuatTxt;

// Đánh dấu
@property (strong, nonatomic) UIButton* getLocation;
@property (strong, nonatomic) ErrorTextField* locationTxt;

//Process Data
@property (strong, nonatomic) FIRDatabaseReference* firebaseRef;

@end

@implementation VC_MainPageEditSpace

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]}];
    [self setTitle:@"Thông tin bếp ăn"];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(backButtonTapped)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    UIBarButtonItem *reviewButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"user_review_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(reviewButtonTapped)];
    self.navigationItem.rightBarButtonItem = reviewButton;
    
    _saveBtn = [[UIButton alloc] init];
    [_saveBtn setTitle:@"Lưu cập nhật" forState:UIControlStateNormal];
    [_saveBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_saveBtn setBackgroundColor:[UIColor LVL_colorWithHexString:kToneOrangeColor andAlpha:1.0]];
    [_saveBtn addTarget:self action:@selector(saveButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_saveBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_saveBtn];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_saveBtn
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_saveBtn
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_saveBtn
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_saveBtn
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_saveBtn
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:50.0]];
    
    _pageScroll = [[UIScrollView alloc] init];
    [_pageScroll setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_pageScroll];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_saveBtn
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                          attribute:NSLayoutAttributeWidth
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_saveBtn
                                                          attribute:NSLayoutAttributeWidth
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_pageScroll
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_saveBtn
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    UIGestureRecognizer* singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped)];
    [self.pageScroll addGestureRecognizer:singleTap];
    
    // Thong tin lien lac
    UILabel* contactTitle = [[UILabel alloc] init];
    [contactTitle setText:@"Thông tin cơ bản:"];
    [contactTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18]];
    [contactTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:contactTitle];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:40.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:contactTitle
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeCenterX
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
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:0.0
                                                                 constant:30.0]];

    _tenCongtyTxt = [[ErrorTextField alloc] init];
    [_tenCongtyTxt setPlaceholder:@"Tên cơ sở kinh doanh"];
    [_tenCongtyTxt setDividerNormalHeight:0.5];
    [_tenCongtyTxt setDividerActiveHeight:1];
    [_tenCongtyTxt setDividerActiveColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    [_tenCongtyTxt setPlaceholderActiveColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    [_tenCongtyTxt setTextColor:[UIColor blackColor]];
    [_tenCongtyTxt setFont:[UIFont systemFontOfSize:_textSize]];
    [_tenCongtyTxt setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [_tenCongtyTxt setAutocorrectionType:UITextAutocorrectionTypeNo];
    [_tenCongtyTxt setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:_tenCongtyTxt];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_tenCongtyTxt
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:contactTitle
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:30.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_tenCongtyTxt
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:-30.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_tenCongtyTxt
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:20.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_tenCongtyTxt
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_tenCongtyTxt
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:30.0]];
    _diachiTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_diachiTxt placeHolderText:@"Địa chỉ" toTopAs:_tenCongtyTxt isLastContent:NO];
    
    _phuongTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_phuongTxt placeHolderText:@"Phường/Xã" toTopAs:_diachiTxt isLastContent:NO];
    
    _quanTxt = [[ErrorTextField alloc] init];
    _districtPickerView = [[UIPickerView alloc] init];
    [_districtPickerView setDataSource:self];
    [_districtPickerView setDelegate:self];
    _quanTxt.inputView = _districtPickerView;
    [self addingTextField:_quanTxt placeHolderText:@"Quận/huyện" toTopAs:_phuongTxt isLastContent:NO];
    
    _dienthoaiTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_dienthoaiTxt placeHolderText:@"Điện thoại" toTopAs:_quanTxt isLastContent:NO];
    
    _diDongTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_diDongTxt placeHolderText:@"Di Động" toTopAs:_dienthoaiTxt isLastContent:NO];
    
    _emailTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_emailTxt placeHolderText:@"Email" toTopAs:_diDongTxt isLastContent:NO];
    
    _faxTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_faxTxt placeHolderText:@"Fax" toTopAs:_emailTxt isLastContent:NO];
    
    
    //Thông tin đăng ký
    UILabel* registerTitle = [[UILabel alloc] init];
    [registerTitle setText:@"Thông tin đăng ký:"];
    [registerTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18]];
    [registerTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:registerTitle];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerTitle
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_faxTxt
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:40.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerTitle
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerTitle
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:-20.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:registerTitle
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:0.0
                                                                 constant:30.0]];
    _daidienTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_daidienTxt placeHolderText:@"Đại diện" toTopAs:registerTitle isLastContent:NO];
    
    _giayDKKDTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_giayDKKDTxt placeHolderText:@"Giấy ĐKKD" toTopAs:_daidienTxt isLastContent:NO];
    
    _giayChungNhanATTPTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_giayChungNhanATTPTxt placeHolderText:@"Giấy chứng nhận ATTP" toTopAs:_giayDKKDTxt isLastContent:NO];
    
    _ngayCapGiayATTPTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_ngayCapGiayATTPTxt placeHolderText:@"Ngày cấp" toTopAs:_giayChungNhanATTPTxt isLastContent:NO];
    
    _noiCapGiayATTPTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_noiCapGiayATTPTxt placeHolderText:@"Nơi cấp" toTopAs:_ngayCapGiayATTPTxt isLastContent:NO];
    
    _chungChiKhacTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_chungChiKhacTxt placeHolderText:@"Chứng chỉ khác" toTopAs:_noiCapGiayATTPTxt isLastContent:NO];
    
    _soSuatAnTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_soSuatAnTxt placeHolderText:@"Số suất ăn" toTopAs:_chungChiKhacTxt isLastContent:NO];
    
    
    //Thông tin thuê nấu
    UILabel* renterTitle = [[UILabel alloc] init];
    [renterTitle setText:@"Thông tin cơ sở thuê nấu:"];
    [renterTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18]];
    [renterTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:renterTitle];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:renterTitle
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_soSuatAnTxt
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:40.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:renterTitle
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:renterTitle
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:-20.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:renterTitle
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:0.0
                                                                 constant:30.0]];
    _tenCSThueNauTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_tenCSThueNauTxt placeHolderText:@"Tên cơ sở thuê nấu" toTopAs:renterTitle isLastContent:NO];
    
    _diaChiCSThueNauTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_diaChiCSThueNauTxt placeHolderText:@"Địa chỉ" toTopAs:_tenCSThueNauTxt isLastContent:NO];
    
    _dienThoaiCSThueNauTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_dienThoaiCSThueNauTxt placeHolderText:@"Điện thoại" toTopAs:_diaChiCSThueNauTxt isLastContent:NO];
    
    _capHocTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_capHocTxt placeHolderText:@"Cấp học" toTopAs:_dienThoaiCSThueNauTxt isLastContent:NO];
    
    
    // Phan loai
    UILabel* spaceTypeTitle = [[UILabel alloc] init];
    [spaceTypeTitle setText:@"Phân loại KCN/KCX"];
    [spaceTypeTitle setFont:[UIFont fontWithName:@"AvenirNext-DemiBold" size:18]];
    [spaceTypeTitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:spaceTypeTitle];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceTypeTitle
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_capHocTxt
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:40.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceTypeTitle
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:0.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceTypeTitle
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:-20.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceTypeTitle
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.view
                                                                attribute:NSLayoutAttributeHeight
                                                               multiplier:0.0
                                                                 constant:30.0]];
    _khuCongNghiepTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_khuCongNghiepTxt placeHolderText:@"Thuộc Khu Công Nghiệp:" toTopAs:spaceTypeTitle isLastContent:NO];
    
    _khuCongNgheCaoTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_khuCongNgheCaoTxt placeHolderText:@"Thuộc Khu Công Nghệ Cao" toTopAs:_khuCongNghiepTxt isLastContent:NO];
    
    _khuCheXuatTxt = [[ErrorTextField alloc] init];
    [self addingTextField:_khuCheXuatTxt placeHolderText:@"Thuộc Khu Chế Xuất" toTopAs:_khuCongNgheCaoTxt isLastContent:NO];
    
    // Định vị
    _locationTxt = [[ErrorTextField alloc] init];
    [_locationTxt setUserInteractionEnabled:NO];
    [self addingTextField:_locationTxt placeHolderText:@"Toạ độ" toTopAs:_khuCheXuatTxt isLastContent:YES];
    
    _getLocation = [[UIButton alloc] init];
    [_getLocation setBackgroundImage:[UIImage imageNamed:@"locate_icon"] forState:UIControlStateNormal];
    [_getLocation addTarget:self action:@selector(locateButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [_getLocation setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:_getLocation];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_getLocation
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_locationTxt
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:0.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_getLocation
                                                                attribute:NSLayoutAttributeRight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_locationTxt
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0
                                                                 constant:-20.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_getLocation
                                                                attribute:NSLayoutAttributeLeft
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_getLocation
                                                                attribute:NSLayoutAttributeRight
                                                               multiplier:1.0
                                                                 constant:-30.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:_getLocation
                                                                attribute:NSLayoutAttributeHeight
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:_getLocation
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:0.0]];
    
    [self reloadData];
    
}

-(void)addingTextField:(ErrorTextField*) textField
       placeHolderText:(NSString*) placeHolderText
               toTopAs:(UIView*) topView
         isLastContent:(BOOL) isLastView
{
    [textField setPlaceholder:placeHolderText];
    [textField setDividerNormalHeight:0.5];
    [textField setDividerActiveHeight:1];
    [_tenCongtyTxt setDividerActiveColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    [_tenCongtyTxt setPlaceholderActiveColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    [_tenCongtyTxt setTextColor:[UIColor blackColor]];
    [textField setFont:[UIFont systemFontOfSize:_textSize]];
    [textField setAutocapitalizationType:UITextAutocapitalizationTypeNone];
    [textField setAutocorrectionType:UITextAutocorrectionTypeNo];
    [textField setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.pageScroll addSubview:textField];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:textField
                                                                attribute:NSLayoutAttributeTop
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:topView
                                                                attribute:NSLayoutAttributeBottom
                                                               multiplier:1.0
                                                                 constant:30.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:textField
                                                                attribute:NSLayoutAttributeWidth
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeWidth
                                                               multiplier:1.0
                                                                 constant:-30.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:textField
                                                                attribute:NSLayoutAttributeCenterX
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:self.pageScroll
                                                                attribute:NSLayoutAttributeCenterX
                                                               multiplier:1.0
                                                                 constant:20.0]];
    [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:textField
                                                                attribute:NSLayoutAttributeBottom
                                                                relatedBy:NSLayoutRelationEqual
                                                                   toItem:textField
                                                                attribute:NSLayoutAttributeTop
                                                               multiplier:1.0
                                                                 constant:30.0]];
    if (isLastView) {
        
        UIView* spaceView = [[UIView alloc] init];
        [spaceView setTranslatesAutoresizingMaskIntoConstraints:NO];
        [self.pageScroll addSubview:spaceView];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceView
                                                                    attribute:NSLayoutAttributeTop
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:textField
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:spaceView
                                                                    attribute:NSLayoutAttributeTop
                                                                   multiplier:1.0
                                                                     constant:175.0]];
        [self.pageScroll addConstraint:[NSLayoutConstraint constraintWithItem:spaceView
                                                                    attribute:NSLayoutAttributeBottom
                                                                    relatedBy:NSLayoutRelationEqual
                                                                       toItem:self.pageScroll
                                                                    attribute:NSLayoutAttributeBottom
                                                                   multiplier:1.0
                                                                     constant:0.0]];
        
    }
}

-(void)backButtonTapped {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)reviewButtonTapped {
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Thanh Tra"
                                                                     message:@"Bạn xác nhận đã thanh tra xong cơ sở này?"
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Xác nhận đảm bảo ATTTP"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         [self markSpaceAsChecked];
                                                     }];
    UIAlertAction* failAction = [UIAlertAction actionWithTitle:@"Xác nhận không đảm bảo ATTTP"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         [self markSpaceAsFail];
                                                     }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Huỷ"
                                                       style:UIAlertActionStyleCancel
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    [alertVC addAction:okAction];
    [alertVC addAction:failAction];
    [alertVC addAction:cancelAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)locateButtonTapped
{
    
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Định vị"
                                                                     message:@"Bạn có muốn sử dụng địa điểm hiện tại của bạn như là địa điểm của cơ sở này không?"
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Xác nhận"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         self->_locationManager = [[CLLocationManager alloc] init];
                                                         self->_locationManager.delegate = self;
                                                         self->_locationManager.distanceFilter = kCLDistanceFilterNone;
                                                         self->_locationManager.desiredAccuracy = kCLLocationAccuracyBest;
                                                         
                                                         if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
                                                             [self->_locationManager requestWhenInUseAuthorization];
                                                         
                                                         [self->_locationManager startUpdatingLocation];
                                                     }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Huỷ"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

-(void)saveButtonTapped
{
   UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Xác nhận"
                                                                    message:@"Bạn xác nhận những thay đổi thông tin đối với cơ sở này? Mọi thay đổi sẽ được ghi đè lên dữ liệu cũ"
                                                             preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Huỷ"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         }];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Xác nhận"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                         [self uploadNewSpaceData];
                                                     }];
    [alertVC addAction:cancelAction];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)markSpaceAsFail
{
    User* userData = [_AppDataHandler user];
    
    NSString* date = [[NSDate date] stringFromDate];
    
    NSString *key = [[[_firebaseRef child:_keyString] child:_spaceID] childByAutoId].key;
    NSDictionary *post = @{@"date": date,
                           @"author": userData.userID,
                           @"isPass":@"0",
                           @"comment":@"Cơ sở không đủ điều kiện kinh doanh thực phẩm"};
    NSDictionary *childUpdates = @{[@"/inspects/" stringByAppendingString:key]: post};
    [[[_firebaseRef child:_keyString] child:_spaceID] updateChildValues:childUpdates withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (!error) {
            UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Cập nhật thành công!"
                                                                             message:@"Cơ sở này được đánh dấu là không đủ điều kiện ATTP"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                             }];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
    }];
}

-(void)markSpaceAsChecked
{
    User* userData = [_AppDataHandler user];
    
    NSString* date = [[NSDate date] stringFromDate];
    
    NSString *key = [[[_firebaseRef child:_keyString] child:_spaceID] childByAutoId].key;
    NSDictionary *post = @{@"date": date,
                           @"author": userData.userID,
                           @"isPass":@"1",
                           @"comment":@"Cơ sở đủ điều kiện kinh doanh thực phẩm"};
    NSDictionary *childUpdates = @{[@"/inspects/" stringByAppendingString:key]: post};
    [[[_firebaseRef child:_keyString] child:_spaceID] updateChildValues:childUpdates withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
        if (!error) {
            UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Cập nhật thành công"
                                                                             message:@"Cơ sở này thoả mãn kiểm tra ATTP"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"OK"
                                                               style:UIAlertActionStyleDefault
                                                             handler:^(UIAlertAction * _Nonnull action) {
                                                                 [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                             }];
            [alertVC addAction:okAction];
            [self presentViewController:alertVC animated:YES completion:nil];
        }
    }];
}

-(void)uploadNewSpaceData
{

    //Thông tin liên lạc
    _dataSource.tenCongty   = _tenCongtyTxt.text;
    _dataSource.diachi      = _diachiTxt.text;
    _dataSource.phuong      = _phuongTxt.text;
    _dataSource.quan        = _quanTxt.text;
    _dataSource.dienthoai   = _dienthoaiTxt.text;
    _dataSource.diDong      = _diDongTxt.text;
    _dataSource.email       = _emailTxt.text;
    _dataSource.fax         = _faxTxt.text;
    
    //Thông tin đăng ký
    _dataSource.daidien     = _daidienTxt.text;
    _dataSource.giayDKKD    = _giayDKKDTxt.text;
    _dataSource.giayChungNhanATTP   = _giayChungNhanATTPTxt.text;
    _dataSource.ngayCapGiayATTP     = _ngayCapGiayATTPTxt.text;
    _dataSource.noiCapGiayATTP      = _noiCapGiayATTPTxt.text;
    _dataSource.chungChiKhac        = _chungChiKhacTxt.text;
    _dataSource.soSuatAn            = _soSuatAnTxt.text;
    
    //Thông tin thuê nấu
    _dataSource.tenCSThueNau    = _tenCSThueNauTxt.text;
    _dataSource.diaChiCSThueNau = _diaChiCSThueNauTxt.text;
    _dataSource.dienThoaiCSThueNau  = _dienThoaiCSThueNauTxt.text;
    _dataSource.capHoc          = _capHocTxt.text;
    
    // Phan loai
    _dataSource.khuCongNghiep   = _khuCongNghiepTxt.text;
    _dataSource.khuCongNgheCao  = _khuCongNgheCaoTxt.text;
    _dataSource.khuCheXuat      = _khuCheXuatTxt.text;
    
    // Đánh dấu
    _dataSource.location        = _locationTxt.text;
    
    _firebaseRef = FIRDatabase.database.reference;
    [[[_firebaseRef child:_keyString] child:_spaceID] updateChildValues:[_dataSource parseObject]
                                                    withCompletionBlock:^(NSError * _Nullable error, FIRDatabaseReference * _Nonnull ref) {
                                                        if (error == nil) {
                                                            [self updateSuccessfully];
                                                        }
                                                        else {
                                                            [self updateFail];
                                                        }
                                                    }];
}

-(void)updateSuccessfully
{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Cập nhật thành công !!"
                                                                     message:@"Bạn đã cập nhật thành công dữ liệu cho cơ sở này"
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Xác nhận"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)updateFail
{
    UIAlertController* alertVC = [UIAlertController alertControllerWithTitle:@"Cập nhật không thành công !!"
                                                                     message:@"Bạn đã không cập nhật thành công dữ liệu cho cơ sở này"
                                                              preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"Xác nhận"
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         [alertVC dismissViewControllerAnimated:YES completion:nil];
                                                     }];
    [alertVC addAction:okAction];
    [self presentViewController:alertVC animated:YES completion:nil];
}

-(void)viewTapped
{
    [self.view endEditing:YES];
}

#pragma mark - Process Data
-(void)setSpaceID:(NSString*)spaceID
{
    _spaceID = spaceID;
    _firebaseRef = FIRDatabase.database.reference;
    
    //Retive Data
    [[[_firebaseRef child:_keyString] child:_spaceID] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        NSDictionary* spaceDict = (NSDictionary*)snapshot.value;
        self->_dataSource = [[SpaceDataSource alloc] initWithDict:spaceDict];
        [self reloadData];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
    //Handle Data change
    [[[_firebaseRef child:_keyString] child:_spaceID] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        if ([snapshot.value isKindOfClass:[NSDictionary class]]) {
            NSDictionary* returnDict = (NSDictionary*)snapshot.value;
            self->_dataSource = [[SpaceDataSource alloc] initWithDict:returnDict];
            [self reloadData];
        }
    }];
}

-(void)reloadData
{
    if (_dataSource) {
        
        // Thông tin liên lạc
        [_tenCongtyTxt setText:_dataSource.tenCongty];
        [_diachiTxt setText:_dataSource.diachi];
        [_phuongTxt setText:_dataSource.phuong];
        [_quanTxt setText:_dataSource.quan];
        [_dienthoaiTxt setText:_dataSource.dienthoai];
        [_diDongTxt setText:_dataSource.diDong];
        [_emailTxt setText:_dataSource.email];
        [_faxTxt setText:_dataSource.fax];
        
        //Thông tin đăng ký
        [_daidienTxt setText:_dataSource.daidien];
        [_giayDKKDTxt setText:_dataSource.giayDKKD];
        [_giayChungNhanATTPTxt setText:_dataSource.giayChungNhanATTP];
        
        NSDate* date = [NSDate dateFromString:_dataSource.ngayCapGiayATTP];
        if (date != nil) {
            NSString* dateString = [date stringFromDate]?[date stringFromDate]:@"";
            [_ngayCapGiayATTPTxt setText:dateString];
        };
        
        [_noiCapGiayATTPTxt setText:_dataSource.noiCapGiayATTP];
        [_chungChiKhacTxt setText:_dataSource.chungChiKhac];
        [_soSuatAnTxt setText:_dataSource.soSuatAn];
        
        //Thông tin thuê nấu
        [_tenCSThueNauTxt setText:_dataSource.tenCSThueNau];
        [_diaChiCSThueNauTxt setText:_dataSource.diaChiCSThueNau];
        [_dienThoaiCSThueNauTxt setText:_dataSource.dienThoaiCSThueNau];
        [_capHocTxt setText:_dataSource.capHoc];
        
        // Phan loai
        [_khuCongNghiepTxt setText:_dataSource.khuCongNghiep];
        [_khuCongNgheCaoTxt setText:_dataSource.khuCongNgheCao];
        [_khuCheXuatTxt setText:_dataSource.khuCheXuat];
        
        //Location
        [_locationTxt setText:_dataSource.location];
        
    }
}

#pragma mark - CLLocationManagerDelegate

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
    CLLocation* location = [locations lastObject];
    NSDate* eventDate = location.timestamp;
    NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    if (fabs(howRecent) < 15.0) {
        // If the event is recent, do something with it.
        [_locationTxt setText:[NSString stringWithFormat:@"%.06f, %.06f",location.coordinate.latitude,location.coordinate.longitude]];
    }
}

#pragma mark - UIPickerViewDataSource

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self listDistrict].count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[self listDistrict] objectAtIndex:row];
}

#pragma mark - UIPickerViewDelegate

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component

{
    NSString* districtTitle = [[self listDistrict] objectAtIndex:row];
    [_quanTxt setText:districtTitle];
    [self.view endEditing:YES];
}

#pragma mark - Process Data
-(NSArray*)listDistrict {
    return @[@"Quận 1",@"Quận 2",@"Quận 3", @"Quận 4", @"Quận 5", @"Quận 6", @"Quận 7", @"Quận 8",
             @"Quận 9",
             @"Quận 10",@"Quận 11",@"Quận 12",
             @"Quận Bình Thạnh",
             @"Quận Bình Tân", @"Quận Gò Vấp",
             @"Quận Phú Nhuận", @"Quận Tân Bình", @"Quận Tân Phú", @"Quận Thủ Đức",
             @"Huyện Bình Chánh",@"Huyện Củ Chi",@"Huyện Hóc Môn", @"Huyện Nhà Bè"];
}

@end
