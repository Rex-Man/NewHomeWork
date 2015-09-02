//
//  BlockListViewController.h
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
//other
//typedef void (^ReturnArrayBlock)(NSMutableArray *selectValue);
@interface BlockListViewController : UIViewController
@property (retain, nonatomic) IBOutlet UITableView *blockTableView;
@property (retain, nonatomic) NSMutableArray *selectCellValues;
//other
//@property (nonatomic, copy) ReturnArrayBlock returnSelectArrayValue;
//- (void)returnSelectArrayValue:(ReturnArrayBlock)block;
@property (nonatomic, copy) void (^ReturnArrayBlock)(NSMutableArray *selectValue);
@end
