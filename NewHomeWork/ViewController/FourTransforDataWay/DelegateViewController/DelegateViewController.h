//
//  DelegateViewController.h
//  HomeWork
//
//  Created by admin on 7/23/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DelegateViewDelegate <NSObject>
    -(void)setTextFieldValue:(NSMutableArray *)fillTextFieldValue;
@end


@interface DelegateViewController : UIViewController<DelegateViewDelegate,UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *delegateTextField;
@property (retain, nonatomic) IBOutlet UIButton *delegateButton;

@end
