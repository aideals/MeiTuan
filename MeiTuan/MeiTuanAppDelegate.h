//
//  MeiTuanAppDelegate.h
//  MeiTuan
//
//  Created by liupeng on 15-11-2.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TuanGouViewController.h"
#import "ShangJiaViewController.h"
#import "UserViewController.h"
#import "MoreViewController.h"

@interface MeiTuanAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;
@end
