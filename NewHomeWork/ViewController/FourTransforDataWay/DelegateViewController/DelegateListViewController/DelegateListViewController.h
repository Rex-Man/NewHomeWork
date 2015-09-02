//
//  DelegateListViewController.h
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DelegateViewController.h"
@interface DelegateListViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,DelegateViewDelegate>

@property (nonatomic, assign) id<DelegateViewDelegate> dalegateViewDelegate;
@property (retain, nonatomic) IBOutlet UITableView *delegateListTableView;
@property (retain, nonatomic) NSMutableArray *selectCellValues;
@end
