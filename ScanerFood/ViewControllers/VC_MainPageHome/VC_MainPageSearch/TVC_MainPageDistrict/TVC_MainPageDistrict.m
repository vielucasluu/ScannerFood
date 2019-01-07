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
    
    [self.tableView registerClass:[TC_MainPageDistrictCell class] forCellReuseIdentifier:@"districtCell"];
    
    _listSpace = [NSMutableArray new];
    _firebaseRef = FIRDatabase.database.reference;
    [[_firebaseRef child:_keyString] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        //Code when new space has added;
        //Take the value and add it into list space
        if ([snapshot.value isKindOfClass:[NSDictionary class]]) {
            NSDictionary* space_dict = (NSDictionary*)snapshot.value;
            
            BOOL isSameDict = NO;
            for (NSDictionary* dict in self->_listSpace) {
                if ([[dict objectForKey:@"quan_huyen"] isEqualToString:[space_dict objectForKey:@"quan_huyen"]]) {
                    
                    NSMutableArray* space_in_district = [dict objectForKey:@"list_space"];
                    [space_in_district addObject:space_dict];
                    
                    isSameDict = YES;
                    break;
                }
            }
            
            if (!isSameDict) {
                NSMutableArray* space_in_district = [NSMutableArray new];
                [space_in_district addObject:space_dict];
                NSDictionary* districtDict = @{@"quan_huyen": [space_dict objectForKey:@"quan_huyen"],
                                               @"list_space":space_in_district};
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
    }
    else
    {
        NSDictionary* districtData = [_listSpace objectAtIndex:section];
        NSArray* listSpace = [districtData objectForKey:@"list_space"];
        NSArray* indexPaths = [self indexPathsForSection:section withNumberOfRows:listSpace.count];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        [_collapsedSections removeObject:@(section)];
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
    
    UIButton* result = [UIButton buttonWithType:UIButtonTypeCustom];
    [result addTarget:self action:@selector(sectionButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    result.backgroundColor = [UIColor grayColor];
    [result setTitle:[districtData objectForKey:@"quan_huyen"] forState:UIControlStateNormal];
    result.tag = section;
    return result;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (TC_MainPageDistrictCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TC_MainPageDistrictCell *cell = [tableView dequeueReusableCellWithIdentifier:@"districtCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[TC_MainPageDistrictCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"districtCell"];
    }
    
    NSDictionary* districtData = [_listSpace objectAtIndex:indexPath.section];
    NSArray* listSpace = [districtData objectForKey:@"list_space"];
    NSDictionary* cellData = [listSpace objectAtIndex:indexPath.row];
    
    [cell.spaceNameLabel setText:[cellData objectForKey:@"ten_cong_ty"]];
    [cell.addressLabel setText:[NSString stringWithFormat:@"%@ - %@",[cellData objectForKey:@"dia_chi"],[cellData objectForKey:@"phuong_xa"]]];
    [cell.districtLabel setText:[cellData objectForKey:@"quan_huyen"]];
    [cell.distanceLabel setText:@"0.0 km"];
 
    return cell;
}


#pragma mark - UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary* districtData = [_listSpace objectAtIndex:indexPath.section];
    NSArray* listSpace = [districtData objectForKey:@"list_space"];
    NSDictionary* cellData = [listSpace objectAtIndex:indexPath.row];
    
    VC_MainPageSpaceDetails* spaceDetails = [[VC_MainPageSpaceDetails alloc] init];
    [spaceDetails setKeyString:self.keyString];
    [spaceDetails setSpaceID:[[cellData objectForKey:@"space_id"] stringValue]];
    [self.navigationController pushViewController:spaceDetails animated:YES];
}

@end
