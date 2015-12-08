//
//  TableViewController.m
//  MeiTuan
//
//  Created by liupeng on 15-11-19.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "TableViewController.h"
#import "MapViewController.h"
#import "StarScore.h"
#import "MeiTuanModel.h"

@interface TableViewController () <UISearchBarDelegate>
{
    NSMutableArray *tableData;
}

@property (nonatomic,strong) StarScore *startScore;

@end

@implementation TableViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(45, 15, 85.0, 10.0)];
    searchBar.delegate = self;
    searchBar.placeholder = self.placheHolder;
    
    [self.navigationController.navigationBar setBackgroundColor:[UIColor whiteColor]];
    self.navigationItem.titleView = searchBar;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"back"
                                                                   style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                  action:@selector(back:)];

    [self.navigationItem setLeftBarButtonItem:leftButton];

    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"map"
                                                                   style:UIBarButtonItemStyleDone
                                                                  target:self
                                                                   action:@selector(map:)];

    [self.navigationItem setRightBarButtonItem:rightButton];

    self.startScore = [[StarScore alloc] initWithFrame:CGRectMake(0, 0, 55, 40) numberOfStars:5];
    self.startScore.isAnimation = YES;
    self.startScore.incompleteStar = YES;
    self.startScore.scorePercent = 0.2;

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 79, 30)];
    [button setTitle:@"美食" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1]];
    [button addTarget:self action:@selector(meishi:) forControlEvents:UIControlEventTouchDown];
    button.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(80, 0, 79, 30)];
    [button1 setTitle:@"全城" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button1 setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1]];
    [button1 addTarget:self action:@selector(quancheng:) forControlEvents:UIControlEventTouchDown];
    button1.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(160, 0, 79, 30)];
    [button2 setTitle:@"智能排序" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1]];
    [button2 addTarget:self action:@selector(zhinengpaixu:) forControlEvents:UIControlEventTouchDown];
    button2.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(240, 0, 79, 30)];
    [button3 setTitle:@"筛选" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1]];
    [button3 addTarget:self action:@selector(shaixuan:) forControlEvents:UIControlEventTouchDown];
    button3.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [self.view addSubview:button3];
}

- (IBAction)meishi:(id)sender
{
    
}

- (IBAction)quancheng:(id)sender
{
    
}

- (IBAction)zhinengpaixu:(id)sender
{
    
}

- (IBAction)shaixuan:(id)sender
{
    
}

- (void)setTableData
{
    if ([self.placheHolder  isEqual: @"董小姐的面"]) {
        MeiTuanModel *model = [[MeiTuanModel alloc] init];
        [model setTitle:@"董小姐的面"];
        [model setImage1:@"dongxiaojiedemian.png"];
        
    }
}

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)map:(id)sender
{
    MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:mapViewController];
    
    [self presentViewController:nav animated:YES completion:nil];
}




@end
