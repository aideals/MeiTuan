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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 35, 30)];
    self.titleLabel.font = [UIFont systemFontOfSize:25.0];

    for (int i = 0; i < ButtonNumber; i ++) {
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(35 * i, 20, 35, 30)];
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
