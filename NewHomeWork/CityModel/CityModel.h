//
//  CityModel.h
//  NewHomeWork
//
//  Created by admin on 8/20/15.
//  Copyright (c) 2015 admin. All rights reserved.
//


#import <Mantle/Mantle.h>

@interface CityModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,strong) NSString * city;
@property (nonatomic,strong) NSString * country;

@end
