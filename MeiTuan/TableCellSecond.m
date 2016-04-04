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
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ButtonX + (60 + ButtonX) * j, ButtonY + (30 + ButtonY) * i + 38, 65, 30)];
        button.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.4 alpha:0.2];
        [button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
        button.titleLabel.font = [UIFont systemFontOfSize:13.0];
        button.tag = i * 4 + j;
        title = [self.buttonName objectAtIndex:i * 4 + j];
        [button setTitle:title forState:UIControlStateNormal];
        [self.contentView addSubview:button];
    
        }
      
    }
    [self.contentView addSubview:self.titleLabel];
}

- (void)buttonTitle:(NSMutableArray*)currentButtonTitleArray
{
    NSUInteger row;
    NSString *title;
    
    row = self.buttonName.count / 8 + (self.buttonName.count % 8 > 0 ? 1 : 0);
    
    for (NSUInteger i = row / 8; i < self.buttonName.count && i < row * 8 + 8; i++) {
        [currentButtonTitleArray addObject:self.buttonName[i]];
    }
    
    for (int i = 0; i < currentButtonTitleArray.count; i++) {
        title = [currentButtonTitleArray objectAtIndex:i];
        
    }
    
}



- (IBAction)buttonClickAction:(id)sender
{
    
}


@end
