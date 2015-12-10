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
@property (nonatomic,strong) UIView *meiShiView;
@property (nonatomic,strong) UIButton *disButton;
@property (nonatomic,strong) UITableView *quanChengTB;
@property (nonatomic,strong) UITableView *smartSortTB;
@property (nonatomic,strong) UITableView *shaixuanTB;
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

    self.disButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 20)];
    self.disButton.backgroundColor = [UIColor whiteColor];
    [self.disButton addTarget:self action:@selector(disappearView:) forControlEvents:UIControlEventTouchDown];
}

- (IBAction)meishi:(id)sender
{
    self.meiShiView = [[UIView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 85)];
    self.meiShiView.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
    [self.view addSubview:self.meiShiView];
    [self.view addSubview:self.disButton];
    
}

- (IBAction)quancheng:(id)sender
{
    self.quanChengTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 100) style:UITableViewStylePlain];
    self.quanChengTB.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1];
    [self.view addSubview:self.quanChengTB];
    [self.view addSubview:self.disButton];
}

- (IBAction)zhinengpaixu:(id)sender
{
    self.smartSortTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 100) style:UITableViewStylePlain];
    self.smartSortTB.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.smartSortTB];
    [self.view addSubview:self.disButton];
}

- (IBAction)shaixuan:(id)sender
{
    self.shaixuanTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 30, self.view.bounds.size.width, 250) style:UITableViewStylePlain];
    self.shaixuanTB.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.shaixuanTB];
    [self.view addSubview:self.disButton];
}

- (IBAction)disappearView:(id)sender
{
    self.meiShiView.alpha = 0.0;
    self.disButton.alpha = 0.0;

    self.quanChengTB.alpha = 0.0;
    self.disButton.alpha = 0.0;
    
    self.smartSortTB.alpha = 0.0;
    self.disButton.alpha = 0.0;
    
    self.shaixuanTB.alpha = 0.0;
    self.disButton.alpha = 0.0;
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
