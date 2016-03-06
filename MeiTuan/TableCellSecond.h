//
//  TableCellSecond.h
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/28.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>


#define ButtonX  3
#define ButtonY  5

@interface TableCellSecond : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
