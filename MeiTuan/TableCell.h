//
//  TableCell.h
//  MeiTuan
//
//  Created by 鹏 刘 on 16/2/24.
//  Copyright © 2016年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell
@property (strong,nonatomic) UILabel *titleLabel;
@property (strong,nonatomic) IBOutlet UISwitch *buttonSwitch;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
