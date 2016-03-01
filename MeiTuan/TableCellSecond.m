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
        [self initData];
    }
    
    return self;
}

- (void)initData
{
    self.array = [[NSArray alloc] initWithObjects:@"不限",@"单人餐",@"双人餐",@"3~4人餐",@"5~10人餐",@"10人以上",@"代金劵",@"其它",nil];
    CGFloat button_wid = self.frame.size.width / self.array.count;
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 35, 30)];
    self.titleLabel.font = [UIFont systemFontOfSize:25.0];

    for (int i = 0; i < self.array.count; i++) {
        
        NSString *name = [self.array objectAtIndex:i];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(button_wid * i, 20, 35, 30)];
        [button setTitle:name forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:0.2 green:0.2 blue:0.2 alpha:0.2]];
        [button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
        button.titleLabel.font = [UIFont systemFontOfSize:10.0];
        button.tag = i;
        [self addSubview:button];
    }
    
}

- (IBAction)buttonClickAction:(id)sender
{
    
}


@end
