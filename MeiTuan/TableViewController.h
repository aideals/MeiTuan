//
//  TableViewController.h
//  MeiTuan
//
//  Created by liupeng on 15-11-19.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,assign) NSString *placheHolder;
@end
