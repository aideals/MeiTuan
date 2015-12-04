//
//  StarScore.h
//  MeiTuan
//
//  Created by liupeng on 15-12-1.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StarScore;
@protocol starScoreDelegate <NSObject>
@optional
- (void)starScore:(StarScore *)starScore scorePercentDidChange:(CGFloat)newScorePercent;
@end

@interface StarScore : UIView

@property (nonatomic,assign) CGFloat scorePercent;
@property (nonatomic,assign) BOOL isAnimation;
@property (nonatomic,assign) BOOL incompleteStar;


@property (nonatomic,weak) id<starScoreDelegate> delegate;

- (id)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)number;
@end
