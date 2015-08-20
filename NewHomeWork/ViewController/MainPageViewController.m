//
//  MainPageViewController.m
//  NewHomeWork
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "MainPageViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    // Do any additional setup after loading the view from its nib.
}
- (void) initNavigationBar {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSString *username = [userDefault objectForKey:@"username"];
    self.title=username;
}
-(void) initTableView{
    NSString *url=@"http://wangiv2-2-w7:3000/rest/findAutoHeightCellTestDate";
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
