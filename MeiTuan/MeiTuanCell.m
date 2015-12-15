//
//  MeiTuanCell.m
//  MeiTuan
//
//  Created by liupeng on 15-11-26.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "MeiTuanCell.h"

@implementation MeiTuanCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 35, 60, 30)];
    self.imageLabel = [[UIImageView alloc] initWithFrame:CGRectMake(10, 35, 30, 30)];
    self.starScore = [[UIImageView alloc] initWithFrame:CGRectMake(40, 50, 50, 30)];
    
    
    [self addSubview:_titleLabel];
    [self addSubview:_imageLabel];
    [self addSubview:_starScore];
}

@end
