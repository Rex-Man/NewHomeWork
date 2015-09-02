//
//  DelegateViewController.m
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "DelegateViewController.h"
#import "DelegateListViewController.h"

@interface DelegateViewController ()
@property (strong ,nonatomic) NSMutableArray *selectedCellValue;
@end

@implementation DelegateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    _delegateButton=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)doSubmit:(id)sender {
    if(![[_delegateTextField text] isEqual:@""])
    {
       NSArray *needSelectArray=[[_delegateTextField text] componentsSeparatedByString:NSLocalizedString(@";", nil)];
       _selectedCellValue = [NSMutableArray arrayWithArray:needSelectArray];
    }else{
        _selectedCellValue =nil;
    }
    DelegateListViewController *result = [[DelegateListViewController alloc]initWithNibName:@"DelegateListViewController" bundle:nil];
    result.dalegateViewDelegate = self;
    result.selectCellValues= _selectedCellValue;

    [self.navigationController pushViewController:result animated:YES];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) initNavigationBar {
     self.navigationItem.title =@"Delegate";
    }
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)setTextFieldValue:(NSMutableArray *)fillTextFieldValue{
    NSString *selectValueString = @"";
    for(NSString *selectValue in fillTextFieldValue){
        if (selectValue && selectValue.length>0) {
            if(selectValueString.length==0){
                selectValueString =selectValue;
            }else{
                selectValueString = [selectValueString stringByAppendingString:[NSString stringWithFormat:@";%@",selectValue]];
            }
            
        }
    }
    [_delegateTextField setText:selectValueString];
    _selectedCellValue=fillTextFieldValue;
}


@end
