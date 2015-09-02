//
//  DelegateListViewController.m
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "DelegateListViewController.h"
#import "NSMutableArray+AddFunction.h"

@interface DelegateListViewController ()
@property (strong,nonatomic) NSArray *dwarves;


@end

@implementation DelegateListViewController
@synthesize dwarves = _dwarves;
@synthesize dalegateViewDelegate=_dalegateViewDelegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_selectCellValues) {
        _selectCellValues = [[NSMutableArray alloc]init];
    }
    [self initNavigationBar];
    [self initTableView];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void) initTableView
{
    NSMutableArray *testCategory=[[NSMutableArray alloc] init];
    [testCategory testArrayShow];
    NSMutableArray *initArry=[testCategory returnInitArray:100 initName:@"Delegate%d"];
   
    self.dwarves=initArry;

    //NSLog(@"%@",self.dwarves);
}
- (void) initNavigationBar {
    
    self.title=@"DelegateList";
    UIBarButtonItem *applyBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(handleApply)];
    self.navigationItem.rightBarButtonItem = applyBtn;

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
        [_dalegateViewDelegate setTextFieldValue:_selectCellValues];
    }else{
        [_dalegateViewDelegate setTextFieldValue:nil];
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
    return [self.dwarves count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier=@"DelegateListTable";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    NSString *selectCellName;
    selectCellName=[self.dwarves objectAtIndex:[indexPath row]];
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
    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
        cell.accessoryType = UITableViewCellAccessoryNone;
        [_selectCellValues removeObject:cell.textLabel.text];
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [_selectCellValues addObject:cell.textLabel.text];
    }
}

@end
