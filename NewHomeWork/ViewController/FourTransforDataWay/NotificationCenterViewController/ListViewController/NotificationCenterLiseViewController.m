//
//  NotificationCenterLiseViewController.m
//  HomeWork
//
//  Created by admin on 7/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "NotificationCenterLiseViewController.h"

@interface NotificationCenterLiseViewController ()
@property (retain,nonatomic) NSArray *dwarves;
@end

@implementation NotificationCenterLiseViewController
@synthesize dwarves = _dwarves;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if (!_selectCellValues) {
        _selectCellValues = [[NSMutableArray alloc]init];
    }
    [self initNavigationBar];
    [self initTableView];
}
-(void) initTableView
{
    
    NSMutableArray *initArry=[NSMutableArray arrayWithCapacity:100];
    for (int i=1; i<=100; i++) {
        NSString *item = [NSString stringWithFormat:@"NotificationCenter%d",i];
        [initArry addObject:item];
    }
    self.dwarves=initArry;
    NSLog(@"%@",self.dwarves);
}
- (void) initNavigationBar {
    
    self.title=@"NotificationCenterList";
    UIBarButtonItem *applyBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(handleApply)];
    self.navigationItem.rightBarButtonItem = applyBtn;
 
}
- (void)handleApply{
    
    NSLog(@"handleApply is called");
    if ([_selectCellValues count]!=0) {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationCenter_SelectValue" object:_selectCellValues];
    }else{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NotificationCenter_SelectValue" object:nil];

    }
    
    [self.navigationController popViewControllerAnimated:YES];
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
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *simpleTableIdentifier=@"NotificationCenterListTable";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    
    NSString *selectCellName;
    selectCellName=[self.dwarves objectAtIndex:[indexPath row]];
    cell.textLabel.text=selectCellName;
    if (_selectCellValues.count>0 &&[_selectCellValues containsObject:selectCellName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
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
