//
//  TVC_MainPageDistrict.m
//  ScanerFood
//
//  Created by Lucas Luu on 8/8/18.
//  Copyright © 2018 Lucas Luu. All rights reserved.
//

#import "TVC_MainPageDistrict.h"
#import "TC_MainPageDistrictCell.h"

@interface TVC_MainPageDistrict ()
{
    NSMutableArray*     _listSpace;
    NSMutableSet*       _collapsedSections;
}
@property (strong, nonatomic) FIRDatabaseReference* firebaseRef;

@end

@implementation TVC_MainPageDistrict

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSForegroundColorAttributeName:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]}];
    
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                   style:UIBarButtonItemStylePlain
                                                                  target:self
                                                                  action:@selector(backButtonTapped)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    [self.tableView registerClass:[TC_MainPageDistrictCell class] forCellReuseIdentifier:@"districtCell"];
    
    _listSpace = [NSMutableArray new];
    _firebaseRef = FIRDatabase.database.reference;
    [[_firebaseRef child:_keyString] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        //Code when new space has added;
        //Take the value and add it into list space
        if ([snapshot.value isKindOfClass:[NSDictionary class]]) {
            NSDictionary* space_dict = (NSDictionary*)snapshot.value;
            SpaceDataSource* newSpaceData = [[SpaceDataSource alloc] initWithDict:space_dict];
            
            BOOL isSameDict = NO;
            for (NSDictionary* quanDict in self->_listSpace) {
                if ([[quanDict objectForKey:@"quan_huyen"] isEqualToString:newSpaceData.quan]) {
                    
                    NSMutableArray* listSpaceInQuan = [quanDict objectForKey:@"list_space"];
                    [listSpaceInQuan addObject:newSpaceData];
                    
                    isSameDict = YES;
                    break;
                }
            }
            
            if (!isSameDict) {
                NSMutableArray* listSpaceInQuan = [NSMutableArray new];
                [listSpaceInQuan addObject:newSpaceData];
                NSDictionary* districtDict = @{@"quan_huyen": newSpaceData.quan,
                                               @"list_space":listSpaceInQuan};
                NSMutableDictionary* districtData = [NSMutableDictionary dictionaryWithDictionary:districtDict];
                [self->_listSpace addObject:districtData];
            }
            
            [self.tableView reloadData];
        }
    }];
    
    _collapsedSections = [NSMutableSet new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSArray*) indexPathsForSection:(NSInteger)section withNumberOfRows:(NSInteger)numberOfRows
{
    NSMutableArray* indexPaths = [NSMutableArray new];
    for (int i = 0; i < numberOfRows; i++) {
        NSIndexPath* indexPath = [NSIndexPath indexPathForRow:i inSection:section];
        [indexPaths addObject:indexPath];
    }
    return indexPaths;
}

-(void)backButtonTapped
{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)sectionButtonTouchUpInside:(UIButton*)sender
{
    [self.tableView beginUpdates];
    NSInteger section = sender.tag;
    bool shouldCollapse = ![_collapsedSections containsObject:@(section)];
    if (shouldCollapse) {
        NSInteger numOfRows = [self.tableView numberOfRowsInSection:section];
        NSArray* indexPaths = [self indexPathsForSection:section withNumberOfRows:numOfRows];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [_collapsedSections addObject:@(section)];
        
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_down"] forState:UIControlStateNormal];
    }
    else
    {
        NSDictionary* districtData = [_listSpace objectAtIndex:section];
        NSArray* listSpace = [districtData objectForKey:@"list_space"];
        NSArray* indexPaths = [self indexPathsForSection:section withNumberOfRows:listSpace.count];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [_collapsedSections removeObject:@(section)];
        
        [sender setBackgroundImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateNormal];
    }
    [self.tableView endUpdates];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _listSpace.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([_collapsedSections containsObject:@(section)] )
    {
        return 0;
    }
    else
    {
        NSDictionary* districtData = [_listSpace objectAtIndex:section];
        NSArray* listSpace = [districtData objectForKey:@"list_space"];
        return listSpace.count;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    NSDictionary* districtData = [_listSpace objectAtIndex:section];
    
    
    UIView* contentView = [[UIView alloc] init];
    [contentView setBackgroundColor:[UIColor LVL_colorWithHexString:kToneColor andAlpha:1.0]];
    
    NSArray* listItems = [districtData objectForKey:@"list_space"];
    NSString* contentText = [NSString stringWithFormat:@"%@ (%ld)",[districtData objectForKey:@"quan_huyen"],listItems.count];
    
    UILabel* districtName = [[UILabel alloc] init];
    [districtName setTextColor:[UIColor whiteColor]];
    [districtName setFont:[UIFont fontWithName:@"AvenirNext-BoldItalic" size:14]];
    [districtName setText:[contentText uppercaseString]];
    [districtName setTranslatesAutoresizingMaskIntoConstraints:NO];
    [contentView addSubview:districtName];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:districtName
                                                            attribute:NSLayoutAttributeTop
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeTop
                                                           multiplier:1.0
                                                             constant:0.0]];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:districtName
                                                            attribute:NSLayoutAttributeLeft
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeLeft
                                                           multiplier:1.0
                                                             constant:30.0]];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:districtName
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:0.0]];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:districtName
                                                            attribute:NSLayoutAttributeBottom
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeBottom
                                                           multiplier:1.0
                                                             constant:0.0]];
    
    UIButton* collapBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [collapBtn addTarget:self action:@selector(sectionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [collapBtn setBackgroundImage:[UIImage imageNamed:@"arrow_up"] forState:UIControlStateNormal];
    collapBtn.tag = section;
    [collapBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [contentView addSubview:collapBtn];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:collapBtn
                                                            attribute:NSLayoutAttributeCenterY
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeCenterY
                                                           multiplier:1.0
                                                             constant:0.0]];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:collapBtn
                                                            attribute:NSLayoutAttributeHeight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeHeight
                                                           multiplier:0.0
                                                             constant:10.0]];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:collapBtn
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:0.0
                                                             constant:20.0]];
    [contentView addConstraint:[NSLayoutConstraint constraintWithItem:collapBtn
                                                            attribute:NSLayoutAttributeRight
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:contentView
                                                            attribute:NSLayoutAttributeRight
                                                           multiplier:1.0
                                                             constant:-30.0]];
    
    return contentView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (TC_MainPageDistrictCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TC_MainPageDistrictCell *cell = [tableView dequeueReusableCellWithIdentifier:@"districtCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[TC_MainPageDistrictCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"districtCell"];
    }
    
    NSDictionary* districtData = [_listSpace objectAtIndex:indexPath.section];
    NSArray* listSpace = [districtData objectForKey:@"list_space"];
    SpaceDataSource* cellData = (SpaceDataSource*)[listSpace objectAtIndex:indexPath.row];
    
    [cell.spaceNameLabel setText:cellData.tenCongty];
    [cell.addressLabel setText:[NSString stringWithFormat:@"%@ - %@",cellData.diachi,cellData.phuong]];
    
    if ([cellData.listInspects allKeys].count > 0) {
        
        [cell.warningImage setHidden:YES];
        
        NSString* lastObjectKey = [[cellData.listInspects allKeys] lastObject];
        NSDictionary* lastInspect = [cellData.listInspects objectForKey:lastObjectKey];
        
        NSString* dateString = [lastInspect objectForKey:@"date"];
        NSDate* date = [NSDate dateFromString:dateString];
        NSDate* nowDate = [NSDate date];
        
        NSInteger days = [NSDate daysBetweenDate:date andDate:nowDate];
        
        if (days <= 31) {
            [cell.reviewStatus setText:[NSString stringWithFormat:@"Đã kiểm tra (%ld ngày trước)", days]];
            [cell.reviewStatus setTextColor:[UIColor LVL_colorWithHexString:kWarningGreenColor andAlpha:1.0]];
        }
        else if (days > 31 && days <= 365) {
            [cell.reviewStatus setText:[NSString stringWithFormat:@"Đã kiểm tra (%ld tháng trước)", days/31]];
            [cell.reviewStatus setTextColor:[UIColor LVL_colorWithHexString:kWarningGreenColor andAlpha:1.0]];
        }
        else {
            days -= 365;
            [cell.warningImage setHidden:NO];
            if (days <= 31) {
                [cell.reviewStatus setText:[NSString stringWithFormat:@"Qúa hạn kiểm tra (%ld ngày trước)", days]];
                [cell.reviewStatus setTextColor:[UIColor LVL_colorWithHexString:kWarningRedColor andAlpha:1.0]];
            }
            else if (days > 31) {
                [cell.reviewStatus setText:[NSString stringWithFormat:@"Quá hạn kiểm tra (%ld tháng trước)", days/31]];
                [cell.reviewStatus setTextColor:[UIColor LVL_colorWithHexString:kWarningRedColor andAlpha:1.0]];
            }
        }
        
    }
    else
    {
        [cell.warningImage setHidden:NO];
        [cell.reviewStatus setText:@"Cơ sở không có lịch sử thanh tra"];
        [cell.reviewStatus setTextColor:[UIColor LVL_colorWithHexString:kWarningRedColor andAlpha:1.0]];
    }
    
 
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary* districtData = [_listSpace objectAtIndex:indexPath.section];
    NSArray* listSpace = [districtData objectForKey:@"list_space"];
    SpaceDataSource* cellData = [listSpace objectAtIndex:indexPath.row];
    
    VC_MainPageSpaceDetails* spaceDetails = [[VC_MainPageSpaceDetails alloc] init];
    [spaceDetails setKeyString:self.keyString];
    [spaceDetails setSpaceID:cellData.spaceID];
    [self.navigationController pushViewController:spaceDetails animated:YES];
}

@end
