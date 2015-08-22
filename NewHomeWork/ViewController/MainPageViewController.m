//
//  MainPageViewController.m
//  NewHomeWork
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "MainPageViewController.h"
#import "AFHTTPRequestOperationManager.h"
#import <Mantle/Mantle.h>
#import "MainPageModel.h"
#import "MainPageTableViewCell.h"

@interface MainPageViewController ()
@property (strong,nonatomic) NSMutableArray *mainPageDataArray;
@property (strong,nonatomic) UIAlertView *uiAlertView;
@property (assign,nonatomic) NSInteger selectRow;
@property (strong,nonatomic) MainPageTableViewCell *selectedCell;


@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    [self initTableView];
    [self initNavigationBar];
    [self initAlertView];
    // Do any additional setup after loading the view from its nib.
}
-(void) initAlertView
{
    _uiAlertView= [[UIAlertView alloc]initWithTitle:@"Demo" message:@"Are you sure to mark as favorite?" delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes"  , nil];
}

- (void) initNavigationBar {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    self.title=username;
}
-(void) initTableView{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *url=@"http://wangiv2-2-w7:3000/rest/findAutoHeightCellTestData";
    _mainPageDataArray=[[NSMutableArray alloc] init];
    [manager GET:url parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSArray *data = responseObject;
        for (NSDictionary *dataDict in data) {
            MainPageModel *mainPageModel=[MTLJSONAdapter modelOfClass:MainPageModel.class fromJSONDictionary:dataDict error:nil];
            [_mainPageDataArray addObject:mainPageModel];
        }
        [_mainPageTableView reloadData];
        
    } failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
     UINib *nib = [UINib nibWithNibName:@"MainPageTableViewCell" bundle:nil];
    [self.mainPageTableView registerNib:nib forCellReuseIdentifier:@"MainPageTableViewCell"];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    MainPageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainPageTableViewCell"];
   
    
    if (cell==nil) {
        cell=[[MainPageTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainPageTableViewCell"];
    }
    
    NSUInteger row = [indexPath row];
    MainPageModel *rowData = [self.mainPageDataArray objectAtIndex:row];
    
    [cell.userImage setImage:[UIImage imageNamed:@"headImage.jpg"]];
    cell.userImage.layer.masksToBounds = YES;
    cell.userImage.layer.cornerRadius = CGRectGetHeight(cell.userImage.bounds)/2;
    cell.userImage.layer.borderWidth = 0.5f;
    cell.userImage.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    cell.userTitle.text = rowData.title;
    cell.userDetail.text  =rowData.detail;
    cell.userTime.text  =[rowData.date length]>0?[rowData.date substringToIndex:11]:@"";
    cell.userinformation.text=rowData.information;
    cell.userNote.text=rowData.note;
    if (!rowData.isFavorate) {
       [cell.favoriteIconButton setBackgroundImage:[UIImage imageNamed:@"favorite.png"] forState:UIControlStateNormal];
    }else{
       [cell.favoriteIconButton setBackgroundImage:[UIImage imageNamed:@"misterwong.png"] forState:UIControlStateNormal];

    }
    
    [cell.favoriteIconButton setTag:indexPath.row];
    [cell.favoriteIconButton addTarget:self action:@selector(handleFavoriteIconChange:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}

#pragma mark Table Delegate Methods
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MainPageTableViewCell *cell = [self tableView:_mainPageTableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(void) handleFavoriteIconChange:(id)sender {
    UIButton *favoriteButton=(UIButton *)sender;
    self.selectRow=[favoriteButton tag];
    [_uiAlertView show];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _selectedCell=[self tableView:_mainPageTableView cellForRowAtIndexPath:indexPath];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_mainPageDataArray count];
}
-(void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
    MainPageModel *rowData = [self.mainPageDataArray objectAtIndex:self.selectRow];
    if ([buttonTitle isEqualToString:@"Yes"]) {
        rowData.isFavorate=YES;
        [_selectedCell.favoriteIconButton setBackgroundImage:[UIImage imageNamed:@"misterwong.png"] forState:UIControlStateNormal];
        NSLog(@"User pressed the Yes button.");
    }else if([buttonTitle isEqualToString:@"No"]){
        rowData.isFavorate=NO;
        [_selectedCell.favoriteIconButton setBackgroundImage:[UIImage imageNamed:@"favorite.png"] forState:UIControlStateNormal];
        NSLog(@"User pressed the No button.");
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
