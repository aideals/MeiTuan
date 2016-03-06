//
//  TableCell.m
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/24.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import "TableCell.h"

@implementation TableCell

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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 60, 50)];
    self.buttonSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(250.0, 4.0, 30, 25)];
    [self.buttonSwitch setOn:NO];
    [self.buttonSwitch addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.contentView addSubview:self.buttonSwitch];
    [self.contentView addSubview:self.titleLabel];
}

- (void)switchAction:(id)sender
{
    self.buttonSwitch = (UISwitch *)sender;
    
    BOOL isButtonOn = [self.buttonSwitch isOn];
    
}



@end
