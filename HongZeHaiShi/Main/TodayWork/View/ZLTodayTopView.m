//
//  ZLTodayTopView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/2.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayTopView.h"
#import "ZLTodayTopViewCellView.h"
@implementation ZLTodayTopView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        self.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        
        [self setUpViews];
        
    }
    return self;
    
}


- (void)setUpViews{
    
    [self addSubview:self.timeView];
    [self addSubview:self.firstView];
    [self addSubview:self.secondView];
    [self addSubview:self.thirdView];
    [self addSubview:self.forthView];
    [self addSubview:self.fifthView];
    [self addSubview:self.sixView];
    [self addSubview:self.sevenView];
    [self addSubview:self.eightView];
    [self addSubview:self.nineView];
    [self addSubview:self.tenView];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.timeView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.top.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(50);
    }];
    
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.timeView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.mas_equalTo(35);
    }];
    
    [self.secondView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.firstView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    
    [self.thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.secondView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    
    [self.forthView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.thirdView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    
    [self.fifthView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.forthView.mas_bottom);
        make.right.equalTo(self.mas_right);
       make.height.equalTo(self.firstView);
    }];
    
    [self.sixView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.fifthView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    
    [self.sevenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.sixView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    
    [self.eightView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.sevenView.mas_bottom);
        make.right.equalTo(self.mas_right);
       make.height.equalTo(self.firstView);
    }];
    
    [self.nineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.eightView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    [self.tenView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self);
        make.top.equalTo(self.nineView.mas_bottom);
        make.right.equalTo(self.mas_right);
        make.height.equalTo(self.firstView);
    }];
    
    
}



- (ZLTodayTopTimeView *)timeView{
    if (!_timeView) {
        _timeView = [[ZLTodayTopTimeView alloc]init];
        
    }
    return _timeView;
}
- (ZLTodayTopViewCellView *)firstView{
    if (!_firstView) {
        _firstView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _firstView;
}

- (ZLTodayTopViewCellView *)secondView{
    if (!_secondView) {
        _secondView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _secondView;
}


- (ZLTodayTopViewCellView *)thirdView{
    if (!_thirdView) {
        _thirdView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _thirdView;
}


- (ZLTodayTopViewCellView *)forthView{
    if (!_forthView) {
        _forthView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _forthView;
}


- (ZLTodayTopViewCellView *)fifthView{
    if (!_fifthView) {
        _fifthView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _fifthView;
}


- (ZLTodayTopViewCellView *)sixView{
    if (!_sixView) {
        _sixView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _sixView;
}


- (ZLTodayTopViewCellView *)sevenView{
    if (!_sevenView) {
        _sevenView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _sevenView;
}


- (ZLTodayTopViewCellView *)eightView{
    if (!_eightView) {
        _eightView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _eightView;
}


- (ZLTodayTopViewCellView *)nineView{
    if (!_nineView) {
        _nineView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _nineView;
}
- (ZLTodayTopViewCellView *)tenView{
    if (!_tenView) {
        _tenView = [[ZLTodayTopViewCellView alloc]init];
    }
    return _tenView;
}




@end
