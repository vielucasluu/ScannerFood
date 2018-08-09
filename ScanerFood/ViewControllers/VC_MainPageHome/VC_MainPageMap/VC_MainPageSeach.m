//
//  VC_MainPageMap.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/3/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "VC_MainPageSeach.h"
#import "TC_MainPageSearchCell.h"
#import "TVC_MainPageDistrict.h"

@interface VC_MainPageSeach ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (strong, nonatomic) UISearchBar* searchBar;
@property (strong, nonatomic) UITableView* tableView;

@end

@implementation VC_MainPageSeach

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    _searchBar = [[UISearchBar alloc]init];
    [_searchBar setPlaceholder:@"Search..."];
    [_searchBar setBarStyle:UIBarStyleDefault];
    [_searchBar setSearchBarStyle:UISearchBarStyleProminent];
    [_searchBar setDelegate:self];
    [_searchBar setBarTintColor:[UIColor LVL_colorWithHexString:@"F9F9F9" andAlpha:1.0]];
    [_searchBar setTintColor:[UIColor LVL_colorWithHexString:@"4a4a4a" andAlpha:1.0]];
    [_searchBar setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_searchBar];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_searchBar
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_searchBar
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_searchBar
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_searchBar
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_searchBar
                                                          attribute:NSLayoutAttributeTop
                                                         multiplier:1.0
                                                           constant:44.0]];
    _tableView = [[UITableView alloc] init];
    [_tableView registerClass:[TC_MainPageSearchCell class] forCellReuseIdentifier:@"searchCell"];
    [_tableView setDataSource:self];
    [_tableView setDelegate:self];
    [_tableView setSeparatorColor:[UIColor clearColor]];
    [_tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:_tableView];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeTop
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:_searchBar
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeLeft
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeLeft
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeRight
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeRight
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:_tableView
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:0.0]];
    [self createInputAccessoryView];
}

-(void)createInputAccessoryView
{
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    keyboardToolbar.barStyle = UIBarStyleDefault;
    [keyboardToolbar setBarTintColor:[UIColor LVL_colorWithHexString:@"E6E6E8" andAlpha:1.0]];
    //    [keyboardToolbar setBarTintColor:[UIColor LVL_colorWithHexString:@"303030" andAlpha:1.0]];
    
    
    UIBarButtonItem* flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBtnTapped)];
    
    [keyboardToolbar setItems:@[flexSpace,doneButton] animated:NO];
    [_searchBar setInputAccessoryView:keyboardToolbar];
}

-(void)mapButtonTapped
{
    VC_MainPageSpaceDetails* spaceDetails = [[VC_MainPageSpaceDetails alloc] init];
    [self.navigationController pushViewController:spaceDetails animated:YES];
}

-(void)doneBtnTapped
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(TC_MainPageSearchCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TC_MainPageSearchCell* cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell"];
    if (!cell) {
        cell = [[TC_MainPageSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell"];
    }
    
    if (indexPath.row == 0) {
        [cell.spaceTypeImage setImage:[UIImage imageNamed:@"suat_an_san"]];
        [cell.spaceName setText:@"Cơ sở chế biến suất ăn sẵn"];
        [cell.spaceCountLable setText:@"210"];
    }
    else if (indexPath.row == 1)
    {
        [cell.spaceTypeImage setImage:[UIImage imageNamed:@"suat_an_cong_nghiep"]];
        [cell.spaceName setText:@"Khu chế xuất - Khu công nghiệp"];
        [cell.spaceCountLable setText:@"115"];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TVC_MainPageDistrict* districtVC = [[TVC_MainPageDistrict alloc] initWithStyle:UITableViewStylePlain];
    if (indexPath.row == 0) {
        [districtVC setTitle:@"Suất ăn sẵn"];
        [self.navigationController pushViewController:districtVC animated:YES];
    }
    else
    {
        [districtVC setTitle:@"Suất ăn công nghiệp"];
        [self.navigationController pushViewController:districtVC animated:YES];
    }
}

#pragma mark - UISearchBarDelegate
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (!searchText) {
        [_searchBar setShowsCancelButton:NO];
    }
    else
    {
        [_searchBar setShowsCancelButton:YES];
    }
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [searchBar endEditing:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [_searchBar setText:@""];
    [_searchBar setShowsCancelButton:NO];
    [_searchBar resignFirstResponder];
}

@end
