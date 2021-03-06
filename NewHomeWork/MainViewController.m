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
#import "MainPageViewController.h"
#import "DelegateViewController.h"
#import "NotificationCenterViewController.h"
#import "KVOViewController.h"
#import "BlockViewController.h"
#import "CommonStyle.h"
#import "RegisterViewController.h"
#import "AutoLayOutViewController.h"
#import "SwichViewController.h"
#import "WebViewController.h"
#import "ScrollViewController.h"


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
    informationArray=[NSArray arrayWithObjects:@"TextField",@"TextView",@"NewHomeWork",@"FourWaysTransforData",@"AutoLayOut",@"Swich",@"WebView",@"ScrollView",nil];
    TextFieldViewController *textFieldViewController=[[TextFieldViewController alloc] initWithNibName:@"TextFieldViewController" bundle:nil];
    TextViewViewController *textViewViewController=[[TextViewViewController alloc]initWithNibName:@"TextViewViewController" bundle:nil];
    MainPageViewController *mainViewController=[[MainPageViewController alloc] initWithNibName:@"MainPageViewController" bundle:nil];
    
    UITabBarController *tabBarController=[[UITabBarController alloc]init];    
    DelegateViewController *delegateViewController=[[DelegateViewController alloc] initWithNibName:@"DelegateViewController" bundle:nil];
    [delegateViewController setTitle:@"Delegate"];
    [delegateViewController.tabBarItem setTitle:@"Delegate"];
    [delegateViewController.tabBarItem setImage:[UIImage imageNamed:@"tab1"]];
    [delegateViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab1_selected"]];
    //UINavigationController *delegateNavigationController=[[UINavigationController alloc] initWithRootViewController:delegateViewController];
    
    NotificationCenterViewController *notificationCenterViewController=[[NotificationCenterViewController alloc] initWithNibName:@"NotificationCenterViewController" bundle:nil];
    [notificationCenterViewController setTitle:@"Notification"];
    [notificationCenterViewController.tabBarItem setTitle:@"Notification"];
    [notificationCenterViewController.tabBarItem setImage:[UIImage imageNamed:@"tab2"]];
    [notificationCenterViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab2_selected"]];
    //UINavigationController *notificationCenterNavigationController=[[UINavigationController alloc] initWithRootViewController:notificationCenterViewController];
    
    
    
    KVOViewController *kvoViewController=[[KVOViewController alloc] initWithNibName:@"KVOViewController" bundle:nil];
    [kvoViewController setTitle:@"KVO"];
    [kvoViewController.tabBarItem setTitle:@"KVO"];
    [kvoViewController.tabBarItem setImage:[UIImage imageNamed:@"tab3"]];
    [kvoViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab3_selected"]];
    //UINavigationController *kvoNavigationController=[[UINavigationController alloc] initWithRootViewController:kvoViewController];
    
    
    
    BlockViewController *blockViewController=[[BlockViewController alloc] initWithNibName:@"BlockViewController" bundle:nil];
    [blockViewController setTitle:@"Block"];
    [blockViewController.tabBarItem setTitle:@"Block"];
    [blockViewController.tabBarItem setImage:[UIImage imageNamed:@"tab4"]];
    [blockViewController.tabBarItem setSelectedImage:[UIImage imageNamed:@"tab4_selected"]];
    //UINavigationController *blockNavigationController=[[UINavigationController alloc] initWithRootViewController:blockViewController];
    
    
    NSMutableArray *controllers=[[NSMutableArray alloc] initWithCapacity:4];
    [controllers addObject:delegateViewController];
    [controllers addObject:notificationCenterViewController];
    [controllers addObject:kvoViewController];
    [controllers addObject:blockViewController];
    tabBarController.viewControllers =controllers;
    
    //test AutoLayOut
    AutoLayOutViewController *autoLayOutViewController=[[AutoLayOutViewController alloc] initWithNibName:@"AutoLayOutViewController" bundle:nil];
    
    SwichViewController *swichViewController=[[SwichViewController alloc] initWithNibName:@"SwichViewController" bundle:nil];
    
    
    WebViewController *webViewController=[[WebViewController alloc] initWithNibName:@"WebViewController" bundle:nil];
    
    ScrollViewController *scrollViewController=[[ScrollViewController alloc] initWithNibName:@"ScrollViewController" bundle:nil];
    

    dictionarylink=[[NSDictionary alloc] initWithObjectsAndKeys:textFieldViewController,@"TextField",textViewViewController,@"TextView",mainViewController,@"NewHomeWork",tabBarController,@"FourWaysTransforData",autoLayOutViewController,@"AutoLayOut",swichViewController,@"Swich",webViewController,@"WebView",scrollViewController,@"ScrollView", nil];
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
    return 8;
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
    
    if ([@"NewHomeWork" caseInsensitiveCompare:informationArray[row]]==NSOrderedSame ) {
            NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
            NSString *username = [userDefault objectForKey:@"username"];
        
        
            if (!username) {
                RegisterViewController *registerViewController=[[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
                [self.navigationController pushViewController:registerViewController animated:YES];
        
            }else{
        
                MainPageViewController *mainPageViewController=[[MainPageViewController alloc] initWithNibName:@"MainPageViewController" bundle:nil];
                [self.navigationController pushViewController:mainPageViewController animated:YES];
            }

    }else{
        
      [self.navigationController pushViewController:[dictionarylink objectForKey:informationArray[row]] animated:YES];
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
