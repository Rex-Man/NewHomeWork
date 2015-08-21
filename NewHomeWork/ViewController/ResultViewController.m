//
//  ResultViewController.m
//  NewHomeWork
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "ResultViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import <Mantle/Mantle.h>
#import "CityModel.h"

@interface ResultViewController ()
@property (retain,nonatomic) NSMutableArray *dwarves;
@property (assign,nonatomic) BOOL  isInSearchMode;
@property (strong,nonatomic) NSArray *filteredCity;
@end

@implementation ResultViewController
@synthesize dwarves = _dwarves;
@synthesize cityViewDelegate=_cityViewDelegate;
- (void)viewDidLoad {
    [super viewDidLoad];
     self.edgesForExtendedLayout = UIRectEdgeNone;
    // Do any additional setup after loading the view from its nib.
    if (!_selectCellValues) {
        _selectCellValues = [[NSMutableArray alloc]init];
    }
    
    
    [self initNavigationBar];
    [self initTableView];
    _isInSearchMode=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initTableView
{
    self.dwarves=[[NSMutableArray alloc] init];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:@"http://wangiv2-2-w7:3000/rest/getCityList" parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *data = responseObject;
        for (NSDictionary *dataDict in data) {
        CityModel *cityModel=[MTLJSONAdapter modelOfClass:CityModel.class fromJSONDictionary:dataDict error:nil];
            [_dwarves addObject:cityModel];
        }
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
    
    
    
    //self.dwarves=[[NSMutableArray alloc] initWithObjects:@"Zhu Hai",@"Hong Kong",@"Guang Zhou",@"Shang Hai", nil];
     //[self.cityTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"DelegateListTable"];
    
}
- (void) initNavigationBar {
    
    self.title=@"City";
    UIBarButtonItem *applyBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(handleApply)];
    self.navigationItem.rightBarButtonItem = applyBtn;
    
    self.navigationItem.backBarButtonItem=applyBtn;
    
    
}
- (void)handleApply{
    NSLog(@"handleApply is called");
    if ([_selectCellValues count]!=0) {
        //        NSMutableString *selectValues=[[NSMutableString alloc] init];
        //        for(NSString *cellValue in _selectCellValues)
        //        {
        //            if(![selectValues isEqualToString:@""])
        //            {
        //                [selectValues appendString:@";"];
        //            }
        //            [selectValues appendString:cellValue];
        //        }
        [_cityViewDelegate setSelectCity:_selectCellValues];
    }else{
        [_cityViewDelegate setSelectCity:nil];
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(!_isInSearchMode)
    {
        return [self.dwarves count];
    }else{
        return _filteredCity.count;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier=@"DelegateListTable";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSString *selectCellName;
    if(!_isInSearchMode)
    {
        selectCellName=[self.dwarves objectAtIndex:[indexPath row]];
    }else{
        selectCellName=[self.filteredCity objectAtIndex:[indexPath row]];
    }
   
    cell.textLabel.text=selectCellName;
    if (_selectCellValues.count>0 && [_selectCellValues containsObject:selectCellName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //cell.tintColor = [UIColor colorWithHex:0x136366 alpha:1];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    if (!_isInSearchMode) {
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [_selectCellValues removeObject:cell.textLabel.text];
        }else
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [_selectCellValues addObject:cell.textLabel.text];
        }
    }else{
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            [_selectCellValues removeObject:cell.textLabel.text];
        }else
        {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            [_selectCellValues addObject:cell.textLabel.text];
        }
        
    }
    
}
#pragma mark - UISearchBar Delegate

- (void)searchBarTextDidBeginEditing: (UISearchBar *)searchBar {
    [searchBar setShowsCancelButton: YES animated: YES];
}

- (void)searchBar: (UISearchBar *)searchBar textDidChange: (NSString *)searchText {
    
    [self searchCity];
    if (searchText==nil || [searchText isEqualToString:@""]) {
        _isInSearchMode=NO;
        [_cityTableView reloadData];
    }
}

- (void)searchBarCancelButtonClicked: (UISearchBar *)searchBar {
    searchBar.text = @"";
     _isInSearchMode=NO;
    [_cityTableView reloadData];
    [searchBar resignFirstResponder];
}

- (void)searchBarSearchButtonClicked: (UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
    [self searchCity];
}

- (void)searchBarTextDidEndEditing: (UISearchBar *)searchBar {
    [searchBar setShowsCancelButton: NO animated: YES];
}

- (void) searchCity{
    _isInSearchMode=YES;
    NSString *filterString = _citySearchBar.text;
    if (filterString.length>0) {
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF LIKE[cd] %@",filterString];
        _filteredCity  =  [self.dwarves filteredArrayUsingPredicate:pred];
       [self.cityTableView reloadData];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
