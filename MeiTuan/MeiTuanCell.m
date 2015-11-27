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
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)configureContent
{
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 40, 50, 25)];
    self.imageLabel = [UIImageView alloc] initWithFrame:CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)
}

@end
