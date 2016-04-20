//
//  TableCellSecond.m
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/28.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import "TableCellSecond.h"

@implementation TableCellSecond

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
        
    }
    
    return self;
}

- (void)initLayout
{
    NSString *title;
    
    self.buttonName = [[NSArray alloc] initWithObjects:@"不限",@"单人餐",@"双人餐",@"3～4人餐",@"5～10人餐",@"10人以上",@"代金劵",@"其它", @"不限",@"优惠买单",@"在线点菜",@"外卖送餐",@"在线排队",nil];
   
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 45)];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17.5];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.font = font;
   
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 4; j ++) {
         self.button = [[UIButton alloc] initWithFrame:CGRectMake(ButtonX + (60 + ButtonX) * j, ButtonY + (30 + ButtonY) * i + 38, 65, 30)];
         self.button.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.4 alpha:0.2];
         [self.button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
         self.button.tag = i * 4 + j + ButtonTag;
         [self.contentView addSubview:self.button];
    
        }
      
    }
    [self.contentView addSubview:self.titleLabel];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    NSArray *currentShowTitles = [self getCurrentShowButtonTitlesWithIndexPath:indexPath];
    [self setButtonTitles:currentShowTitles];
    
    return cell;
}

- (void)getCurrentShowButtonTitlesWithIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *currentButtonIndex = [[NSMutableArray alloc] init];
    
    for (NSInteger i = indexPath.row * 8;i < self.buttonName.count && i < indexPath.row * 8 + 8;i++) {
        [currentButtonIndex addObject:self.buttonName[i]];
    }
}




- (void)setButtonTitles:(NSArray *)array
{
    for (int i = 0; i < 8; i ++) {
        
        NSInteger tag = i + ButtonTag;
        UIButton *btn = (UIButton *)[self.contentView viewWithTag:tag];
        if (i < array.count) {
            btn.hidden = NO;
        }
        else
            btn.hidden = YES;
    }
    
}



- (IBAction)buttonClickAction:(id)sender
{
    
}

@end
