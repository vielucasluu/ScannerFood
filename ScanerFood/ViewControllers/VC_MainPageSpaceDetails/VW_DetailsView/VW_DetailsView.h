//
//  VW_DetailsView.h
//  ScanerFood
//
//  Created by Lucas Luu on 8/9/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol VW_DetailsViewDelegate <NSObject>

@required
-(void)viewHistoryCheck;

@end

@interface VW_DetailsView : UIView

@property (weak, nonatomic) NSObject<VW_DetailsViewDelegate>* delegate;

-(void)setDataSource:(SpaceDataSource*)dataSource;

@end
