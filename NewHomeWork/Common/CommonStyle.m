//
//  CommonStyle.m
//  HomeWork
//
//  Created by admin on 8/4/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CommonStyle.h"
#import "UIColor+MJCategory.h"
@implementation CommonStyle

+ (void) setProjectCommonStyle {
    //UINavigationBar
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithHex:0xF6F6F6 alpha:1]];
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithHex:0x136366 alpha:1]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHex:0x000000 alpha:1], NSForegroundColorAttributeName, [UIFont fontWithName:@"HelveticaNeue-Medium" size:17], NSFontAttributeName, nil]];
    
    //UISegmentedControl
    [[UISegmentedControl appearance] setTintColor:[UIColor colorWithHex:0x4569cb alpha:1]];
    [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:14], NSFontAttributeName, nil] forState:UIControlStateSelected];
    [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHex:0x4569cb alpha:1], NSForegroundColorAttributeName, [UIFont systemFontOfSize:14], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    //UITabBar
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithHex:0xFFFFFF alpha:1]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithHex:0xFFFFFF alpha:1]];
    //    [[UITabBar appearance] setSelectionIndicatorImage:[UIImage createImageWithColor:[UIColor colorWithHex:0x136366 alpha:1] Rect:CGRectMake(0, 0, 100, 100)]];
    
    //UITabBarItem
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHex:0xffffff alpha:1], NSForegroundColorAttributeName,[UIFont fontWithName:@"HelveticaNeue-Light" size:10],NSFontAttributeName, nil] forState:UIControlStateSelected];
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithHex:0x136366 alpha:1], NSForegroundColorAttributeName, [UIFont fontWithName:@"HelveticaNeue-Light" size:10],NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    
    [[UIToolbar appearance] setTintColor:[UIColor colorWithHex:0x136366 alpha:1]];
    
    //Hide Navigation bar back tile
    //    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    
    //UIStatusBar
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

+ (void) setBackgroundImageForView:(UIView *)view{
    
    [self setBackgroundImage:[UIImage imageNamed:@"bg"] ForView:view];
}

+ (void) setBackgroundImage:(UIImage *)image ForView:(UIView *)view{
    UIGraphicsBeginImageContext(view.frame.size);
    [image drawInRect:view.bounds];
    UIImage *bgImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [view setBackgroundColor:[UIColor colorWithPatternImage:bgImage]];
}

@end

