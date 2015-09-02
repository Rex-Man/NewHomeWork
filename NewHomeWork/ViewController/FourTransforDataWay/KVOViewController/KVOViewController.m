//
//  KVOViewController.m
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "KVOViewController.h"
#import "KVOListViewController.h"

@interface KVOViewController ()
@property (strong ,nonatomic) NSMutableArray *selectedCellValue;
@property (strong ,nonatomic) NSString *tempSaveSelectValue;
@end
@implementation KVOViewController

//@synthesize kvoNavigationBar;
@synthesize selectedCellValue;
@synthesize tempSaveSelectValue;
//@synthesize kvoButton;

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
    self.navigationItem.title =@"KVO";
}
//-(void)viewWillAppear:(BOOL)animated
//{
//  
//    if (tempSaveSelectValue.length>0) {
//        [kvoTextField setText:tempSaveSelectValue];
//    }
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)onSubmit:(id)sender {
    if(![[_kvoTextField text] isEqual:@""])
    {
        NSArray *needSelectArray=[[_kvoTextField text] componentsSeparatedByString:NSLocalizedString(@";", nil)];
        selectedCellValue = [NSMutableArray arrayWithArray:needSelectArray];
    }else{
        selectedCellValue =nil;
    }

    
    
    
    KVOListViewController *result = [[KVOListViewController alloc]initWithNibName:@"KVOListViewController" bundle:nil];
    
    result.selectCellValues= [NSMutableArray arrayWithArray:selectedCellValue];
    result.kvoViewDelegate=self;
    [self.navigationController pushViewController:result animated:YES];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"-----------");
    if([keyPath isEqualToString:@"SelectCellValues"])
    {
        NSMutableArray *selectValueArray=[change objectForKey:NSKeyValueChangeNewKey];
        NSString *selectValueString = @"";
        if (selectValueArray!=nil&& ![selectValueArray isKindOfClass:[NSNull class]] && selectValueArray.count>0) {
            
                   for(NSString *selectValue in selectValueArray){
                if (selectValue && selectValue.length>0) {
                    if(selectValueString.length==0){
                        selectValueString =selectValue;
                    }else{
                        selectValueString = [selectValueString stringByAppendingString:[NSString stringWithFormat:@";%@",selectValue]];
                    }
            
                }
            }
        }
        selectedCellValue=selectValueArray;
        [_kvoTextField setText:selectValueString];
    }
}


@end
