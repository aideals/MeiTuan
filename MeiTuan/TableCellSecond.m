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
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 15, 35, 30)];
    titleLabel.font = [UIFont systemFontOfSize:25.0];

    for (int i = 0; i < ButtonX; i ++) {
        for (int j = 0; j < ButtonY; j ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10 * i + 20, 15 * j + 25, 35, 30)];
        [button setBackgroundColor:[UIColor greenColor]];
        [button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
        button.titleLabel.font = [UIFont systemFontOfSize:10.0];
        button.tag = i;
        [self.contentView addSubview:button];
    
        }
    }
    
    [self.contentView addSubview:titleLabel];
}

- (IBAction)buttonClickAction:(id)sender
{
    
}


@end
