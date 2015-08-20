//
//  MainPageTableViewCell.h
//  NewHomeWork
//
//  Created by admin on 8/19/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainPageTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *userImage;
@property (strong, nonatomic) IBOutlet UILabel *userTitle;
@property (strong, nonatomic) IBOutlet UILabel *userTime;
@property (strong, nonatomic) IBOutlet UILabel *userDetail;
@property (strong, nonatomic) IBOutlet UIImageView *favoriteIcon;

@end
