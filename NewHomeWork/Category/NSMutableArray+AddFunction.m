//
//  NSMutableArray+AddFunction.m
//  HomeWork
//
//  Created by admin on 7/31/15.
//  Copyright (c) 2015 admin. All rights reserved.
//

#import "NSMutableArray+AddFunction.h"

@implementation NSMutableArray (AddFunction)
-(NSMutableArray *) returnInitArray:(NSInteger *) num initName:(NSString *) valueName;
{
  
    for (int i=1; i<=num; i++) {
        NSString *item = [NSString stringWithFormat:valueName,i];
        [self addObject:item];
    }
    return self;
}
-(void) testArrayShow{
      NSLog(@"你好 伦敦奥运!");  
}
@end
