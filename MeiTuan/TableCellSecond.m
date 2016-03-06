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
     for (int i = 0; i < ButtonX; i ++) {
        for (int j = 0; j < ButtonY; j ++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 90, 60, 30)];
        [button setBackgroundColor:[UIColor blueColor]];
        [button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
        button.titleLabel.font = [UIFont systemFontOfSize:10.0];
        button.tag = i;
        [self.contentView addSubview:button];
    
        }
    }
    
}

- (IBAction)buttonClickAction:(id)sender
{
    
}


@end
