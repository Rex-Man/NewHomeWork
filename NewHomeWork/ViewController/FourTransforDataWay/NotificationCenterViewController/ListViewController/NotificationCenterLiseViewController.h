//
//  NotificationCenterLiseViewController.h
//  HomeWork
//
//  Created by admin on 7/24/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotificationCenterLiseViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UITableView *notificatinCenterListTableView;
@property (retain, nonatomic) NSMutableArray *selectCellValues;
@end
