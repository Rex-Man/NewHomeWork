//
//  ResultViewController.h
//  NewHomeWork
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CityViewDelegate.h"
@interface ResultViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property (strong, nonatomic) IBOutlet UISearchBar *citySearchBar;
@property (strong, nonatomic) IBOutlet UITableView *cityTableView;
@property (nonatomic, assign) id<CityViewDelegate> cityViewDelegate;
@property (retain, nonatomic) NSMutableArray *selectCellValues;
@end
