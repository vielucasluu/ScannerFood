//
//  SpaceDataSource.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/11/19.
//  Copyright © 2019 Lucas Luu. All rights reserved.
//

#import "SpaceDataSource.h"

@implementation SpaceDataSource

-(instancetype)initWithDict:(NSDictionary*)dict
{
    if (self = [super init]) {
        //System
        _spaceID        = [self parse:[dict objectForKey:@"space_id"]];
        _tenCongty      = [self parse:[dict objectForKey:@"ten_cong_ty"]];
        _diachi         = [self parse:[dict objectForKey:@"dia_chi"]];
        _phuong         = [self parse:[dict objectForKey:@"phuong_xa"]];
        _quan           = [self parse:[dict objectForKey:@"quan_huyen"]];
        _dienthoai      = [self parse:[dict objectForKey:@"dien_thoai"]];
        _diDong         = [self parse:[dict objectForKey:@"di_dong"]];
        _email          = [self parse:[dict objectForKey:@"email"]];
        _fax            = [self parse:[dict objectForKey:@"fax"]];
        
        //Thông tin đăng ký
        _daidien        = [self parse:[dict objectForKey:@"dai_dien"]];
        _giayDKKD       = [self parse:[dict objectForKey:@"giay_DKKD"]];
        _giayChungNhanATTP      = [self parse:[dict objectForKey:@"giay_CN_ATTP"]];
        _ngayCapGiayATTP        = [self parse:[dict objectForKey:@"ngay_cap"]];
        _noiCapGiayATTP         = [self parse:[dict objectForKey:@"noi_cap"]];
        _chungChiKhac           = [self parse:[dict objectForKey:@"other_certificate"]];
        _soSuatAn               = [self parse:[dict objectForKey:@"so_suat_an"]];

        //Thông tin thuê nấu
        _tenCSThueNau   = [self parse:[dict objectForKey:@"ten_cs_thue_nau"]];
        _diaChiCSThueNau        = [self parse:[dict objectForKey:@"dia_chi_CSTN"]];
        _dienThoaiCSThueNau     = [self parse:[dict objectForKey:@"dienthoai_CSTN"]];
        _capHoc                 = [self parse:[dict objectForKey:@"cap_hoc"]];

        // Phan loai
        _khuCongNghiep          = [self parse:[dict objectForKey:@"khu_cong_nghiep"]];
        _khuCongNgheCao         = [self parse:[dict objectForKey:@"khu_cong_nghe_cao"]];
        _khuCheXuat             = [self parse:[dict objectForKey:@"khu_che_xuat"]];
        
        // Đánh dấu
        _location       = [self parse:[dict objectForKey:@"location"]];
        
        //Thanh tra
        _listInspects   = [dict objectForKey:@"inspects"]?[dict objectForKey:@"inspects"]:[NSDictionary new];
    }
    return self;
}

-(NSString*)parse:(id)object
{
    if (object && [object isKindOfClass: [NSString class]]) {
        return (NSString*)object;
    }
    else if (object && [object isKindOfClass:[NSNumber class]])
    {
        return [NSString stringWithFormat:@"%@",object];
    }
    else
        return @"";
}

-(NSDictionary*)parseObject
{
    NSMutableDictionary* source = [NSMutableDictionary new];
    
    [source setObject:_tenCongty forKey:@"ten_cong_ty"];
    [source setObject:_diachi forKey:@"dia_chi"];
    [source setObject:_phuong forKey:@"phuong_xa"];
    [source setObject:_quan forKey:@"quan_huyen"];
    [source setObject:_dienthoai forKey:@"dien_thoai"];
    [source setObject:_diDong forKey:@"di_dong"];
    [source setObject:_email forKey:@"email"];
    [source setObject:_fax forKey:@"fax"];

    //Thông tin đăng ký
    [source setObject:_daidien forKey:@"dai_dien"];
    [source setObject:_giayDKKD forKey:@"giay_DKKD"];
    [source setObject:_giayChungNhanATTP forKey:@"giay_CN_ATTP"];
    [source setObject:_ngayCapGiayATTP forKey:@"ngay_cap"];
    [source setObject:_noiCapGiayATTP forKey:@"noi_cap"];
    [source setObject:_chungChiKhac forKey:@"other_certificate"];
    [source setValue:_chungChiKhac forKey:@"otheRpCertificate"];
    [source setObject:_soSuatAn forKey:@"so_suat_an"];

    //Thông tin thuê nấu
    [source setObject:_tenCSThueNau forKey:@"ten_cs_thue_nau"];
    [source setObject:_diaChiCSThueNau forKey:@"dia_chi_CSTN"];
    [source setObject:_dienThoaiCSThueNau forKey:@"dienthoai_CSTN"];
    [source setObject:_capHoc forKey:@"cap_hoc"];
    
    // Phan loai
    [source setObject:_khuCongNghiep forKey:@"khu_cong_nghiep"];
    [source setObject:_khuCongNgheCao forKey:@"khu_cong_nghe_cao"];
    [source setObject:_khuCheXuat forKey:@"khu_che_xuat"];

    // Đánh dấu
    [source setObject:_location forKey:@"location"];
    
    return (NSDictionary*)source;
}

@end
