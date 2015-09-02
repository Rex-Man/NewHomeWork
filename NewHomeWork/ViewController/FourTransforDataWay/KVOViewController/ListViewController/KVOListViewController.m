//
//  KVOListViewController.m
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "KVOListViewController.h"
#import "KVOViewController.h"

@interface KVOListViewController ()
@property (retain,nonatomic) NSArray *dwarves;
@end

@implementation KVOListViewController{
    KVOViewController *kvoViewController;
    NSMutableDictionary *selectDictionary;
}
@synthesize kvoViewDelegate=_kvoViewDelegate;
@synthesize dwarves = _dwarves;
@synthesize selectCellValues;
- (void)viewDidLoad {
    [super viewDidLoad];
    if (selectCellValues.count==0) {
        selectCellValues = [[NSMutableArray alloc]init];
    }
    selectDictionary=[[NSMutableDictionary alloc]initWithObjects:@[selectCellValues] forKeys:@[@"SelectCellValues"]];
    kvoViewController = (KVOViewController*) _kvoViewDelegate;
    [selectDictionary addObserver:kvoViewController forKeyPath:@"SelectCellValues" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
//    }
    
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
    
    NSMutableArray *initArry=[NSMutableArray arrayWithCapacity:100];
    for (int i=1; i<=100; i++) {
        NSString *item = [NSString stringWithFormat:@"KVO%d",i];
        [initArry addObject:item];
    }
    
    self.dwarves=initArry;
    
    NSLog(@"%@",self.dwarves);
}
- (void) initNavigationBar {
    
    self.title=@"KVOList";
    UIBarButtonItem *applyBtn = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStylePlain target:self action:@selector(handleApply)];
    self.navigationItem.rightBarButtonItem = applyBtn;
   
}
- (void)handleApply{
    
    NSLog(@"handleApply is called");
    if ([selectCellValues count]!=0) {
        [selectDictionary setValue:selectCellValues forKey:@"SelectCellValues"];
    }else{
        [selectDictionary setValue:nil forKey:@"SelectCellValues"];
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
    static NSString *simpleTableIdentifier=@"KVOListTable";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
   
    NSString *selectCellName=[self.dwarves objectAtIndex:[indexPath row]];
    cell.textLabel.text=selectCellName;
    if ([selectCellValues containsObject:selectCellName]) {
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
        [selectCellValues removeObject:cell.textLabel.text];
    }else
    {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        [selectCellValues addObject:cell.textLabel.text];
    }
}
- (void)dealloc {
    
    
        [selectDictionary removeObserver:kvoViewController forKeyPath:@"SelectCellValues"];
       }
@end
