//
//  ZLTodayTopTimeView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayTopTimeView.h"
@interface ZLTodayTopTimeView()

@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, strong) UIView *leftFirstLineView;
@property (nonatomic, strong) UIView *leftSecondLineView;

@end
@implementation ZLTodayTopTimeView
- (instancetype)init{
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self setUpViews];
        
    }
    return self;
    
}


- (void)setUpViews{
    [self addSubview:self.timeLabel];
    [self addSubview:self.bottomLineView];
    [self addSubview:self.leftFirstLineView];
    [self addSubview:self.leftSecondLineView];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
    [self.leftFirstLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.height.equalTo(self);
        make.width.mas_equalTo(1);
        make.top.equalTo(self);
    }];
    
    [self.leftSecondLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftFirstLineView).offset(8);
        make.height.equalTo(self);
        make.width.mas_equalTo(1);
        make.top.equalTo(self);
    }];
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
    }];
    
    
    
}


- (UILabel *)timeLabel{
    
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.text = @"XZXXXXXXXXXX";
        _timeLabel.font = CHINESE_SYSTEM(12);
        _timeLabel.textAlignment = NSTextAlignmentRight;
    }
    return _timeLabel;
    
}


- (UIView *)bottomLineView{
    
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _bottomLineView;
    
}
- (UIView *)leftFirstLineView{
    
    if (!_leftFirstLineView) {
        _leftFirstLineView = [[UIView alloc]init];
        _leftFirstLineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _leftFirstLineView;
    
}

- (UIView *)leftSecondLineView{
    
    if (!_leftSecondLineView) {
        _leftSecondLineView = [[UIView alloc]init];
        _leftSecondLineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _leftSecondLineView;
    
}
@end
