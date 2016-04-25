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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 100, 45)];
    UIFont *font = [UIFont fontWithName:@"Helvetica" size:17.5];
    self.titleLabel.numberOfLines = 2;
    self.titleLabel.font = font;
   
    for (int i = 0; i < 2; i ++) {
        for (int j = 0; j < 4; j ++) {
         UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(ButtonX + (60 + ButtonX) * j, ButtonY + (30 + ButtonY) * i + 38, 65, 30)];
         button.backgroundColor = [UIColor colorWithRed:0.3 green:0.1 blue:0.4 alpha:0.2];
         [button addTarget:self action:@selector(buttonClickAction) forControlEvents:UIControlEventTouchDown];
         [self.contentView addSubview:button];
    
        }
      
    }
    [self.contentView addSubview:self.titleLabel];
}

- (void)setButtonTitles:(NSArray *)array
{
    for (int i = 0; i < 8; i ++) {
        
        NSInteger tag = i + ButtonTag;
        UIButton *btn = (UIButton *)[self.contentView viewWithTag:tag];
        
        if (i < array.count) {
            
            [btn setTitle:array[i] forState:UIControlStateNormal];
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
