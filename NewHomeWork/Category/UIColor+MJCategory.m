//
//  UIColor+MJCategory.m
//  HomeWork
//
//  Created by admin on 8/4/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "UIColor+MJCategory.h"

@implementation UIColor (MJCategory)
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+ (UIColor *)randomColor
{
    
    return [self colorWithRed:arc4random() %256 /255.0 green:arc4random() %256 /255.0 blue:arc4random() %256 /255.0 alpha:1];
    
}

@end
