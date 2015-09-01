//
//  MainViewController.m
//  ControlStudyProject
//
//  Created by rex man  on 15/8/29.
//  Copyright (c) 2015年 com.oocl.euc. All rights reserved.
//

#import "MainViewController.h"
#import "TextFieldViewController.h"
#import "TextViewViewController.h"


@interface MainViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *informationArray;
@property (strong, nonatomic) NSDictionary *dictionarylink;

@end

@implementation MainViewController
@synthesize informationArray;
@synthesize dictionarylink;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initTableView];
    [self initNavigation];
    // Do any additional setup after loading the view from its nib.
}
-(void)initNavigation{
    self.title =@"Main";
}
-(void)initTableView
{
    informationArray=[NSArray arrayWithObjects:@"TextField",@"TextView", nil];
    TextFieldViewController *textFieldViewController=[[TextFieldViewController alloc] initWithNibName:@"TextFieldViewController" bundle:nil];
    TextViewViewController *textViewViewController=[[TextViewViewController alloc]initWithNibName:@"TextViewViewController" bundle:nil];
    
    dictionarylink=[[NSDictionary alloc] initWithObjectsAndKeys:textFieldViewController,@"TextField",textViewViewController,@"TextView", nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // Return the number of rows in the section.
    return 2;
}
-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleNone;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger row = [indexPath row];
    static NSString * cellIdentifier = @"UserNameCellIdentifier";
    UITableViewCell * cell= [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==nil){
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
 
   
    cell.textLabel.text=informationArray[row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = [indexPath row];
    //UITableViewCell *tableCell=[tableView cellForRowAtIndexPath:indexPath];
    [self.navigationController pushViewController:[dictionarylink objectForKey:informationArray[row]] animated:YES];
    
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
