//
//  CityModel.m
//  NewHomeWork
//
//  Created by admin on 8/20/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "CityModel.h"

@implementation CityModel

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"city":@"city",
             @"country":@"country"
             };
}

@end
