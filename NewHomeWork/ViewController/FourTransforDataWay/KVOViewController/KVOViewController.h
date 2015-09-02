//
//  KVOViewController.h
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KVOViewDelegate <NSObject>
@end

@interface KVOViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *kvoTextField;
@property (retain, nonatomic) IBOutlet UIButton *kvoButton;

@end
