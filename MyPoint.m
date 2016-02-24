//
//  MyPoint.m
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/22.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import "MyPoint.h"

@implementation MyPoint

- (id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString *)t
{
    self = [super init];
    if (self) {
        _coordinate = c;
        _title = t;
    }
    
    return self;
}


@end