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

@property (nonatomic,strong) StarScore *starScore;
@property (nonatomic,strong) UIView *foodView;
@property (nonatomic,strong) UIButton *foodButton;
@property (nonatomic,strong) UIButton *allCityButton;
@property (nonatomic,strong) UIButton *smartSortButton;
@property (nonatomic,strong) NSArray *strArray;
@property (nonatomic,strong) UITableView *displayTB;
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

    self.starScore = [[StarScore alloc] initWithFrame:CGRectMake(0, 0, 55, 40) numberOfStars:5];
    self.starScore.isAnimation = YES;
    self.starScore.incompleteStar = YES;
    self.starScore.scorePercent = 0.2;

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

    self.foodButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 20)];
    self.foodButton.backgroundColor = [UIColor grayColor];
    [self.foodButton addTarget:self action:@selector(deleteFoodView:) forControlEvents:UIControlEventTouchDown];
    
    
    self.allCityButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 20)];
    self.allCityButton.backgroundColor = [UIColor grayColor];
    [self.allCityButton addTarget:self action:@selector(deleteAllCityView:) forControlEvents:UIControlEventTouchDown];
    
    self.smartSortButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, 20)];
    self.smartSortButton.backgroundColor = [UIColor grayColor];
    [self.smartSortButton addTarget:self action:@selector(deleteSmartSortView:) forControlEvents:UIControlEventTouchDown];

    self.strArray = [[NSArray alloc] initWithObjects:@"智能排序",@"好评优先",@"距离优先",@"人均最高", @"人均最低",nil];
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    
    [self initTableView];
    [self configData];
    
    tableData = [NSMutableArray array];
}

- (void)initTableView
{
    self.displayTB = [[UITableView alloc] init];
    self.displayTB.delegate = self;
    self.displayTB.dataSource = self;
}

- (void)configData
{
    MeiTuanModel *model = [[MeiTuanModel alloc] init];
    [model setTitle:@"董小姐的面（西关店）"];
    [model setImage1:@"dongxiaojiedemian.png"];
    
    [tableData addObject:model];
}


- (IBAction)meishi:(id)sender
{
    self.displayTB.frame = CGRectMake(0, 30, self.view.bounds.size.width, 65);
    [self.view addSubview:self.displayTB];
    [self.view addSubview:self.foodButton];
}

- (IBAction)quancheng:(id)sender
{
    
}

- (IBAction)zhinengpaixu:(UIButton *)sender
{
    self.displayTB.frame = CGRectMake(0, 30, self.view.bounds.size.width, 240);
    [self.view addSubview:self.displayTB];
    [self.view addSubview:self.smartSortButton];

    if ([sender.titleLabel.text isEqualToString:@"智能排序"]) {
        
    }
    
    
}

- (IBAction)shaixuan:(id)sender
{
    
}

- (IBAction)deleteFoodView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.foodButton removeFromSuperview];
}

- (IBAction)deleteAllCityView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.allCityButton removeFromSuperview];
}

- (IBAction)deleteSmartSortView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.smartSortButton removeFromSuperview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView == self.displayTB) {
       return  1;
    }
    else if ([self.placheHolder isEqualToString:@"董小姐的面"]) {
        return 3;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.displayTB) {
        return [self.strArray count];
    }
    else if ([self.placheHolder isEqualToString:@"董小姐的面"]) {
        return [tableData count];
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [self.strArray objectAtIndex:indexPath.row];
    return cell;
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
