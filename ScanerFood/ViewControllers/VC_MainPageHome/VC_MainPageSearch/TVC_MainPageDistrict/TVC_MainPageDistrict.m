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
    [[_firebaseRef child:@"space_data"] observeEventType:FIRDataEventTypeChildAdded withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        //Code when new space has added;
        //Take the value and add it into list space
        if ([snapshot.value isKindOfClass:[NSDictionary class]]) {
            NSDictionary* space_dict = (NSDictionary*)snapshot.value;
            
            BOOL isSameDict = NO;
            for (NSDictionary* dict in self->_listSpace) {
                if ([[dict objectForKey:@"districtName"] isEqualToString:[space_dict objectForKey:@"district"]]) {
                    
                    NSMutableArray* space_in_district = [dict objectForKey:@"list_space"];
                    [space_in_district addObject:space_dict];
                    
                    isSameDict = YES;
                    break;
                }
            }
            
            if (!isSameDict) {
                NSMutableArray* space_in_district = [NSMutableArray new];
                [space_in_district addObject:space_dict];
                NSDictionary* districtDict = @{@"districtName": [space_dict objectForKey:@"district"],
                                               @"list_space":space_in_district};
                NSMutableDictionary* districtData = [NSMutableDictionary dictionaryWithDictionary:districtDict];
                [self->_listSpace addObject:districtData];
            }
            
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _listSpace.count;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary* districtData = [_listSpace objectAtIndex:section];
    return [districtData objectForKey:@"districtName"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
   NSDictionary* districtData = [_listSpace objectAtIndex:section];
    NSArray* listSpace = [districtData objectForKey:@"list_space"];
    return listSpace.count;
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
    
    [cell.spaceNameLabel setText:[cellData objectForKey:@"space_name"]];
    [cell.addressLabel setText:[NSString stringWithFormat:@"%@ - %@",[cellData objectForKey:@"address"],[cellData objectForKey:@"address_2"]]];
    [cell.districtLabel setText:[cellData objectForKey:@"district"]];
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
    [spaceDetails setSpaceID:[[cellData objectForKey:@"space_id"] stringValue]];
    [self.navigationController pushViewController:spaceDetails animated:YES];
}

@end
