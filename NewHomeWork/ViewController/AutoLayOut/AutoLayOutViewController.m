//
//  AutoLayOutViewController.m
//  NewHomeWork
//
//  Created by REX MAN (EUCD-EUC-ISD-OOCLL/ZHA) on 9/4/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "AutoLayOutViewController.h"

@interface AutoLayOutViewController ()

@end

@implementation AutoLayOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
        [self initNavigation];
    // Do any additional setup after loading the view from its nib.
}
-(void)initNavigation{
    self.title =@"AutoLayOut";
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
