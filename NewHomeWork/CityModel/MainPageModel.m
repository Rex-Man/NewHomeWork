//
//  MainPageModel.m
//  NewHomeWork
//
//  Created by REX MAN (EUCD-EUC-ISD-OOCLL/ZHA) on 8/21/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "MainPageModel.h"

@implementation MainPageModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"title":@"title",
             @"detail":@"detail",
             @"note":@"note",
             @"information":@"information",
             @"date":@"date",
             @"isFavorate":@"isFavorate"
             };
}

@end
