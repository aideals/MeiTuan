//
//  NSObject_MyPoint.h
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/22.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyPoint : NSObject <MKAnnotation>
@property (nonatomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c andTitle:(NSString *)t;
@end
