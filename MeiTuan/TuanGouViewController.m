//
//  TuanGouViewController.m
//  MeiTuan
//
//  Created by liupeng on 15-11-2.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "TuanGouViewController.h"
#import "PushSearchViewController.h"

@interface TuanGouViewController ()<UISearchBarDelegate>
@property (nonatomic,strong) PushSearchViewController *pushSearchViewController;
@end

@implementation TuanGouViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(75, 13, 100.0, 10.0)];
    searchBar.placeholder = @"输入商家，品类，商圈";
    searchBar.delegate = self;
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:0.0 green:5.0 blue:9.5 alpha:0.9]];
    //[self.navigationController.navigationBar addSubview:searchBar];//

    self.parentViewController.navigationItem.titleView = searchBar;
}

- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    self.pushSearchViewController = [[PushSearchViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:_pushSearchViewController animated:YES];
    
    return NO;
}

@end
