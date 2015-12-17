//
//  MeiTuanCell.h
//  MeiTuan
//
//  Created by liupeng on 15-11-26.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MeiTuanCell : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *imageLabel;
@property (nonatomic,strong) UIImageView *starScore;


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
