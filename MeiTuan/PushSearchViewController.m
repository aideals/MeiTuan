//
//  PushSearchViewController.m
//  MeiTuan
//
//  Created by liupeng on 15-11-5.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "PushSearchViewController.h"
#import "TableViewController.h"

@interface PushSearchViewController ()<UISearchBarDelegate,UIScrollViewDelegate>
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic) NSInteger currentPage;
@end

@implementation PushSearchViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(75, 13, 180.0, 10.0)];
    searchBar.placeholder = @"请输入商家名、品类或商圈。。。";
    self.navigationItem.titleView = searchBar;

    UILabel *searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 58, 70, 40)];
    searchLabel.text = @"热门搜索";
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:12.0];
    [searchLabel setFont:font];
    [self.view addSubview:searchLabel];

    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 87, self.view.bounds.size.width, 130)];
    [self.scrollView setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.1]];
    [self.scrollView setContentSize:CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height)];
    [self.scrollView setContentOffset:CGPointMake(0,0)];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.currentPage = 0;
    [self.scrollView autoresizingMask];
    [self.view addSubview:self.scrollView];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(140, 205, 45, 10)];
    self.pageControl.currentPage = 0;
    self.pageControl.numberOfPages = 2;
    [self.pageControl setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.0]];
    [self.pageControl addTarget:self action:@selector(countChange:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.currentPageIndicatorTintColor = [UIColor colorWithRed:0.0 green:0.6 blue:0.1 alpha:0.6];
    [self.view addSubview:self.pageControl];
    
    [self installButtons];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSInteger current;
    
    int contentOffsetX = self.scrollView.contentOffset.x;
    int page = contentOffsetX / CGRectGetWidth(self.scrollView.bounds);
    
    if (page == 1) {
        current = _currentPage + 1;
        self.pageControl.currentPage = current;
    }
    else if (page == 0) {
        current = _currentPage - 1;
        self.pageControl.currentPage = current;
    }
    
}

- (void)installButtons
{
    NSInteger x_space;
    NSInteger y_space;
    
    x_space = 20;
    y_space = 12;
    
    NSArray *stringArr = [[NSArray alloc] initWithObjects:@"小肥羊",@"肯德基",@"德克士",@"全家来",@"华莱士",@"上岛",@"沙县小吃",@"欢乐牧场自主火锅",@"黄鹤楼",@"佳客来",@"董小姐的面",@"爱拉屋",@"玲珑足浴",@"素百味自助餐",@"咖啡之屋",@"口水鸡排",@"曹打胖擀面皮",@"去蜀火锅", nil];
    
    for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 6; j++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x_space + (85 + x_space) * j, y_space + (20 + y_space) * i, 85, 20)];
            [button setBackgroundColor:[UIColor whiteColor]];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:13.0];
            [button addTarget:self action:@selector(changeView:) forControlEvents:UIControlEventTouchDown];
            button.tag = j + 6 * i + 10;
            NSString *title = [stringArr objectAtIndex:j + 6 * i];
            [button setTitle:title forState:UIControlStateNormal];
            [self.scrollView addSubview:button];
        }
    }
}

- (IBAction)changeView:(id)sender
{
    TableViewController *tableViewController = [[TableViewController alloc] initWithNibName:nil bundle:nil];
    [self presentViewController:tableViewController animated:YES completion:nil];
}

- (IBAction)countChange:(id)sender
{
    NSInteger page = self.pageControl.currentPage;
    
    CGRect bounds = self.scrollView.bounds;
    bounds.origin.x = CGRectGetWidth(self.scrollView.bounds) * page;
    bounds.origin.y = 0;
    
    [self.scrollView scrollRectToVisible:bounds animated:YES];
}


@end
