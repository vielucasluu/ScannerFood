//
//  SpaceDataSource.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/11/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SpaceDataSource : NSObject

// System
@property (strong, nonatomic) NSString* spaceID;

// Thong tin liên hệ
@property (strong, nonatomic) NSString* tenCongty;
@property (strong, nonatomic) NSString* diachi;
@property (strong, nonatomic) NSString* phuong;
@property (strong, nonatomic) NSString* quan;
@property (strong, nonatomic) NSString* dienthoai;
@property (strong, nonatomic) NSString* diDong;
@property (strong, nonatomic) NSString* email;
@property (strong, nonatomic) NSString* fax;

//Thông tin đăng ký
@property (strong, nonatomic) NSString* daidien;
@property (strong, nonatomic) NSString* giayDKKD;
@property (strong, nonatomic) NSString* giayChungNhanATTP;
@property (strong, nonatomic) NSString* ngayCapGiayATTP;
@property (strong, nonatomic) NSString* noiCapGiayATTP;
@property (strong, nonatomic) NSString* chungChiKhac;
@property (strong, nonatomic) NSString* soSuatAn;

//Thông tin thuê nấu
@property (strong, nonatomic) NSString* tenCSThueNau;
@property (strong, nonatomic) NSString* diaChiCSThueNau;
@property (strong, nonatomic) NSString* dienThoaiCSThueNau;
@property (strong, nonatomic) NSString* capHoc;

// Phan loai
@property (strong, nonatomic) NSString* khuCongNghiep;
@property (strong, nonatomic) NSString* khuCongNgheCao;
@property (strong, nonatomic) NSString* khuCheXuat;

// Đánh dấu
@property (strong, nonatomic) NSString* location;

//Lịch sử kiểm tra
@property (strong, nonatomic) NSDictionary* listInspects;

-(instancetype)initWithDict:(NSDictionary*)dict;
-(NSDictionary*)parseObject;

@end

NS_ASSUME_NONNULL_END
