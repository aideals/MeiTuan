//
//  StarScore.m
//  MeiTuan
//
//  Created by liupeng on 15-12-1.
//  Copyright (c) 2015年 aideals. All rights reserved.
//

#import "StarScore.h"

#define NUMBER_OF_STARS 5
#define FOREGROUND_IMAGE @"b27_icon_star_yellow.png"
#define BACKGROUND_IMAGE @"b27_icon_star_gray.png"
#define ANIMATION_TIME_INTERVAL 0.2


@interface StarScore()
@property (nonatomic,strong) UIView *foreground;
@property (nonatomic,strong) UIView *background;
@property (nonatomic,assign) NSInteger numberOfStars;
@end

@implementation StarScore

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame numberOfStars:NUMBER_OF_STARS];
        
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        self.numberOfStars = NUMBER_OF_STARS;
        [self installContent];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame numberOfStars:(NSInteger)number
{
    self = [super initWithFrame:frame];
    if (self) {
        [self installContent];
        number = NUMBER_OF_STARS;
    }
    return self;
}

- (void)installContent
{
    self.isAnimation = NO;
    self.incompleteStar = NO;
    self.scorePercent = 1;
    
    self.foreground = [self addImage:FOREGROUND_IMAGE];
    self.background = [self addImage:BACKGROUND_IMAGE];

    [self addSubview:self.foreground];
    [self addSubview:self.background];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(userTap:)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
    
}

- (void)userTap:(UITapGestureRecognizer *)gesture
{
    CGPoint tapPoint = [gesture locationInView:self];
    CGFloat offset = tapPoint.x;
    CGFloat score = offset / (self.bounds.size.width / self.numberOfStars);
    CGFloat realScore = self.incompleteStar ? score : ceilf(score);
    self.scorePercent = realScore / self.numberOfStars;
}

- (UIView *)addImage:(NSString *)imageName
{
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    
    for (int i = 0; i < self.numberOfStars; i++) {
        UIImageView *view = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        view.frame = CGRectMake(i * self.bounds.size.width / self.numberOfStars, 0, self.bounds.size.width / self.numberOfStars, self.bounds.size.height);
        view.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:view];
    }
    return view;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    __weak StarScore *weakSelf = self;
    CGFloat animationTimeInterval = self.isAnimation ? ANIMATION_TIME_INTERVAL : 0;
    [UIView animateWithDuration:animationTimeInterval animations:^{
        weakSelf.foreground.frame = CGRectMake(0, 0, weakSelf.bounds.size.width * self.numberOfStars, weakSelf.bounds.size.height);
    }];
}

- (void)setScorePercent:(CGFloat)scorePercent
{
    if (scorePercent == self.scorePercent) {
        return;
    }

    if (scorePercent < 0) {
        self.scorePercent = 0;
    }
    else if (scorePercent > 1) {
        self.scorePercent = 1;
    }
    else {
        scorePercent = self.scorePercent;
    }
    
    if ([self.delegate respondsToSelector:@selector(starScore:scorePercentDidChange:)]) {
        
    }

}



@end
