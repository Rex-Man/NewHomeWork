//
//  UIColor+MJCategory.h
//  HomeWork
//
//  Created by admin on 8/4/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MJCategory)
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;
+ (UIColor *)randomColor;
@end
