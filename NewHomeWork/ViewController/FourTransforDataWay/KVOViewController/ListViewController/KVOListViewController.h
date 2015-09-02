//
//  KVOListViewController.h
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KVOViewController.h"

@interface KVOListViewController : UIViewController<KVOViewDelegate>

@property (nonatomic, assign) id<KVOViewDelegate> kvoViewDelegate;
@property (retain, nonatomic) IBOutlet UITableView *kvoListTableView;
@property (retain, nonatomic) NSMutableArray *selectCellValues;
@end
