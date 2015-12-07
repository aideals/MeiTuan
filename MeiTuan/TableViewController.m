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

    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 75, 35, 30)];
    button.titleLabel.text = @"美食";
    [self.view addSubview:button];
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(35, 50, 35, 30)];
    button.titleLabel.text = @"全城";
    [self.view addSubview:button1];
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(70, 50, 35, 30)];
    button2.titleLabel.text = @"智能排序";
    [self.view addSubview:button2];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(105, 50, 35, 30)];
    button3.titleLabel.text = @"筛选";
    [self.view addSubview:button3];
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
