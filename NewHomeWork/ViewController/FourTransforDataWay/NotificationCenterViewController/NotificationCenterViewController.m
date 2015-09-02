//
//  NotificationCenterViewController.m
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "NotificationCenterViewController.h"
#import "NotificationCenterLiseViewController.h"

@interface NotificationCenterViewController ()
@property (retain ,nonatomic) NSMutableArray *selectedCellValue;
@end

@implementation NotificationCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    [self registerObservers];
    // Do any additional setup after loading the view from its nib.
}
- (void) registerObservers{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleShowValueInTextField:) name:@"NotificationCenter_SelectValue" object:nil];
}
-(void) handleShowValueInTextField: (NSNotification*) aNotification{
    NSMutableArray *selectValueArray=[aNotification object];
    NSString *selectValueString = @"";
    for(NSString *selectValue in selectValueArray){
        if (selectValue && selectValue.length>0) {
            if(selectValueString.length==0){
                selectValueString =selectValue;
            }else{
                selectValueString = [selectValueString stringByAppendingString:[NSString stringWithFormat:@";%@",selectValue]];
            }
            
        }
    }
    [_notificationCenterTextField setText:selectValueString];
    _selectedCellValue=selectValueArray;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) initNavigationBar {
        self.navigationItem.title =@"Notification";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)doSubmit:(id)sender {
    if(![[_notificationCenterTextField text] isEqual:@""])
    {
        NSArray *needSelectArray=[[_notificationCenterTextField text] componentsSeparatedByString:NSLocalizedString(@";", nil)];
        _selectedCellValue = [NSMutableArray arrayWithArray:needSelectArray];
    }else{
        _selectedCellValue =nil;
    }

    NotificationCenterLiseViewController *result = [[NotificationCenterLiseViewController alloc]initWithNibName:@"NotificationCenterLiseViewController" bundle:nil];
    
    result.selectCellValues= [NSMutableArray arrayWithArray:_selectedCellValue];
    [self.navigationController pushViewController:result animated:YES];
 
}

- (void)dealloc {
   
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
   
}
@end
