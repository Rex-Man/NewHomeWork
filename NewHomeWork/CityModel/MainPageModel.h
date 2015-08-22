//
//  MainPageModel.h
//  NewHomeWork
//
//  Created by REX MAN (EUCD-EUC-ISD-OOCLL/ZHA) on 8/21/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MainPageModel : MTLModel <MTLJSONSerializing>

@property (nonatomic,strong) NSString * title;
@property (nonatomic,strong) NSString * detail;
@property (nonatomic,strong) NSString * note;
@property (nonatomic,strong) NSString * information;
@property (nonatomic,strong) NSString * date;
@property (nonatomic,assign) BOOL isFavorate;

@end
