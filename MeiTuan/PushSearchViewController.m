//
//  PushSearchViewController.m
//  MeiTuan
//
//  Created by liupeng on 15-11-5.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "PushSearchViewController.h"

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
    [self.scrollView setContentOffset:CGPointMake((CGRectGetWidth(self.scrollView.frame)), 0)];
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
    int i;
    
    for (i = 0; i <= 2; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(20, 20 + 35 * i, 55, 20)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [self.scrollView addSubview:button];
    }
    if (i == 2) {
        for (int a = 0; a <= 2; a++) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(70, 20 + 35 * a, 55, 20)];
            [button setBackgroundColor:[UIColor whiteColor]];
            [self.scrollView addSubview:button];
        }
    }
    

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
