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
@property (nonatomic,strong) UIView *foodView;
@property (nonatomic,strong) UITableView *allCityTB;
@property (nonatomic,strong) UITableView *smartSortTB;
@property (nonatomic,strong) UITableView *selectTB;
@property (nonatomic,strong) UIButton *foodButton;
@property (nonatomic,strong) UIButton *allCityButton;
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

    self.foodButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, 20)];
    self.foodButton.backgroundColor = [UIColor grayColor];
    [self.foodButton addTarget:self action:@selector(foodView:) forControlEvents:UIControlEventTouchDown];
    
    
    self.allCityButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, 20)];
    self.allCityButton.backgroundColor = [UIColor grayColor];
    [self.allCityButton addTarget:self action:@selector(allCityView:) forControlEvents:UIControlEventTouchDown];
    

}

- (IBAction)meishi:(id)sender
{
    self.foodView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 85)];
    self.foodView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_foodButton];
    [self.view addSubview:self.foodView];
    
    
}

- (IBAction)quancheng:(id)sender
{
    self.allCityTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 100) style:UITableViewStylePlain];
    
    [self.view addSubview:self.allCityTB];
    [self.view addSubview:_allCityButton];
}

- (IBAction)zhinengpaixu:(id)sender
{
    self.smartSortTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 120) style:UITableViewStylePlain];
}

- (IBAction)shaixuan:(id)sender
{
    
}

- (IBAction)foodView:(id)sender
{
    self.foodView.alpha = 0.0;
    self.foodButton.alpha = 0.0;
}

- (IBAction)allCityView:(id)sender
{
    self.allCityTB.alpha = 0.0;
    self.allCityButton.alpha = 0.0;
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
