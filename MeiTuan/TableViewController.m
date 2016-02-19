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
@property (nonatomic,strong) UIButton *shaixuanButton;
@property (nonatomic,strong) NSArray *strArray;
@property (nonatomic,strong) UITableView *displayTB;
@property (nonatomic,strong) UITableView *contentTB;
@property (nonatomic,strong) NSArray *array1;
@property (nonatomic,strong) NSArray *array2;
@property (nonatomic,strong) NSArray *array3;
@property (nonatomic,strong) NSArray *array4;
@property (nonatomic,strong) UIButton *button;
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

    NSArray* names = @[@"美食",@"全城",@"智能排序",@"筛选"];
    CGFloat btn_width = self.view.frame.size.width / names.count;
    UIView* menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    
    [self.view addSubview:menuView];
    
    for(int i = 0 ; i < names.count; i ++) {
        
        NSString* name = [names objectAtIndex:i];
        
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(btn_width * i, 0, btn_width, 30)];
        [self.button setTitle:name forState:UIControlStateNormal];
        [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.button setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1]];
        [self.button addTarget:self action:@selector(buttonClickAction:) forControlEvents:UIControlEventTouchDown];
        self.button.titleLabel.font = [UIFont systemFontOfSize:12.0];
        self.button.tag = i;
        [menuView addSubview:self.button];
    }
    
    self.foodButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 120, self.view.bounds.size.width, 20)];
    self.foodButton.backgroundColor = [UIColor grayColor];
    [self.foodButton addTarget:self action:@selector(deleteFoodView:) forControlEvents:UIControlEventTouchDown];
    
    self.allCityButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 150, self.view.bounds.size.width, 20)];
    self.allCityButton.backgroundColor = [UIColor grayColor];
    [self.allCityButton addTarget:self action:@selector(deleteAllCityView:) forControlEvents:UIControlEventTouchDown];
    
    self.smartSortButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 250, self.view.bounds.size.width, 20)];
    self.smartSortButton.backgroundColor = [UIColor grayColor];
    [self.smartSortButton addTarget:self action:@selector(deleteSmartSortView:) forControlEvents:UIControlEventTouchDown];

    self.shaixuanButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 110, self.view.bounds.size.width, 20)];
    self.shaixuanButton.backgroundColor = [UIColor grayColor];
    [self.shaixuanButton addTarget:self action:@selector(deleteShaiXuanView:) forControlEvents:UIControlEventTouchDown];
    
    self.edgesForExtendedLayout = UIRectEdgeTop;
    
    [self initTableView];
    [self configData];
    
    tableData = [NSMutableArray array];

    self.array1 = [[NSArray alloc] initWithObjects:@"全部分类",@"美食",nil];
    self.array2 = [[NSArray alloc] initWithObjects:@"全部",@"优惠买单",nil];
    self.array3 = [[NSArray alloc] initWithObjects:@"附近",@"全城",@"源园广场", nil];
    self.array4 = [[NSArray alloc] initWithObjects:@"附近",@"1km",@"3km", nil];

}

- (void)initTableView
{
    self.displayTB = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.displayTB.delegate = self;
    self.displayTB.dataSource = self;
    
    self.contentTB = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.contentTB.delegate = self;
    self.contentTB.dataSource = self;
}

- (void)configData
{
    MeiTuanModel *model = [[MeiTuanModel alloc] init];
    [model setTitle:@"董小姐的面（西关店）"];
    [model setImage1:@"dongxiaojiedemian.png"];
    
    [tableData addObject:model];
}

- (IBAction)buttonClickAction:(UIButton *)button
{
    switch (button.tag) {
        case 0:
            self.displayTB.frame = CGRectMake(0, 30, 140, 89);
            self.contentTB.frame = CGRectMake(140, 30, 180, 89);
            [self.view addSubview:self.displayTB];
            [self.view addSubview:self.contentTB];
            [self.view addSubview:self.foodButton];
            [self.displayTB reloadData];
            [self.contentTB reloadData];
            break;
        
        case 1:
            self.displayTB.frame = CGRectMake(0, 30, 120, 120);
            self.contentTB.frame = CGRectMake(120, 30, 200, 120);
            [self.view addSubview:self.contentTB];
            [self.view addSubview:self.displayTB];
            [self.view addSubview:self.allCityButton];
            [self.displayTB reloadData];
            [self.contentTB reloadData];
            break;
            
        case 2:
            self.displayTB.frame = CGRectMake(0, 30, self.view.bounds.size.width, 240);
            [self.view addSubview:self.displayTB];
            [self.view addSubview:self.smartSortButton];
            break;
            
         case 3:
            self.displayTB.frame = CGRectMake(0, 30, self.view.bounds.size.width, 100);
            [self.view addSubview:self.displayTB];
            [self.view addSubview:self.shaixuanButton];
            break;
        
        default:
            break;
    }
}
    
- (IBAction)deleteFoodView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.contentTB removeFromSuperview];
    [self.foodButton removeFromSuperview];
}

- (IBAction)deleteAllCityView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.contentTB removeFromSuperview];
    [self.allCityButton removeFromSuperview];
}

- (IBAction)deleteSmartSortView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.smartSortButton removeFromSuperview];
}

- (IBAction)deleteShaiXuanView:(id)sender
{
    [self.displayTB removeFromSuperview];
    [self.shaixuanButton removeFromSuperview];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.button.tag == 0) {
        if (tableView == self.displayTB) {
            return [self.array1 count];
        }
        else if (tableView == self.contentTB) {
            return [self.array2 count];
        }
 
    }
    else if (self.button.tag == 1) {
        if (tableView == self.displayTB) {
            return [self.array3 count];
        }
        else if (tableView == self.contentTB) {
            return [self.array4 count];
        }
    }
    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger row = [indexPath row];
    UITableViewCell *cell;
    
    if (self.button.tag == 0) {
        if (tableView == self.displayTB) {
            NSString *identifier = @"cell";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.textLabel.text = [self.array1 objectAtIndex:row];
            
        }
        
        else if (tableView == self.contentTB) {
            
            cell.textLabel.text = [self.array2 objectAtIndex:row];
           
        }
        
    }
    
     else if (self.button.tag == 1) {
        if (tableView == self.displayTB) {
            NSString *identifier = @"cell1";
            cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (cell == nil) {
                cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
            cell.textLabel.text = [self.array3 objectAtIndex:row];
            
        }
        else if (tableView == self.contentTB) {
            
            cell.textLabel.text = [self.array4 objectAtIndex:row];
            
        }
    }
    
    
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

