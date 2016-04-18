//
//  TableCellSecond.h
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/28.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>


#define ButtonX  14
#define ButtonY  3
#define ButtonTag 150

@interface TableCellSecond : UITableViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,copy) NSArray *buttonName;
@property (nonatomic,strong) NSMutableArray *currentButtonTitleArray;
@property (nonatomic,strong) UIButton *button;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
