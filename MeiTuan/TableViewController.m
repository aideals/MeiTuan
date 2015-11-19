//
//  TableViewController.m
//  MeiTuan
//
//  Created by liupeng on 15-11-19.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController () <UISearchBarDelegate>

@end

@implementation TableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(75, 13, 100.0, 10.0)];
    searchBar.delegate = self;
    searchBar.placeholder = @"button";
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor blackColor]];
    
    self.parentViewController.navigationItem.titleView = searchBar;
    
}



@end
