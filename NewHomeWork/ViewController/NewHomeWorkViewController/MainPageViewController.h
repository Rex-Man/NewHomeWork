//
//  MainPageViewController.h
//  NewHomeWork
//
//  Created by admin on 8/13/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *mainPageTableView;

@end
