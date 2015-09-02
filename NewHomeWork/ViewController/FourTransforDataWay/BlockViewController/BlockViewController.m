//
//  BlockViewController.m
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "BlockViewController.h"
#import "BlockListViewController.h"

@interface BlockViewController ()
@property (retain ,nonatomic) NSMutableArray *selectedCellValue;
@end

@implementation BlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNavigationBar];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) initNavigationBar {
    self.navigationItem.title =@"Block";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onSubmit:(id)sender {
    if(![[_blockTextField text] isEqual:@""])
    {
        NSArray *needSelectArray=[[_blockTextField text] componentsSeparatedByString:NSLocalizedString(@";", nil)];
        _selectedCellValue = [NSMutableArray arrayWithArray:needSelectArray];
    }else{
        _selectedCellValue =nil;
    }

    BlockListViewController *result = [[BlockListViewController alloc]initWithNibName:@"BlockListViewController" bundle:nil];
    
    result.selectCellValues= [NSMutableArray arrayWithArray:_selectedCellValue];
    //other
    //result.returnSelectArrayValue=^(NSMutableArray *selectValue){
    result.ReturnArrayBlock=^(NSMutableArray *selectValue){
        NSMutableArray *selectValueArray=selectValue;
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
        [_blockTextField setText:selectValueString];
        _selectedCellValue=selectValueArray;

    };
    [self.navigationController pushViewController:result animated:YES];
 
}


@end
