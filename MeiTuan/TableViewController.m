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
	
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 40)];
    searchBar.delegate = self;
    searchBar.placeholder = @"button";
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
    [self.navigationController.navigationBar addSubview:searchBar];
    
}



@end
