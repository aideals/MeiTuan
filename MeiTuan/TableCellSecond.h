//
//  TableCellSecond.h
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/28.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCellSecond : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,copy) NSArray *array;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;


@end
