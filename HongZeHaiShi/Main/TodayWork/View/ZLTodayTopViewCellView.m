//
//  ZLTodayTopViewCellView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayTopViewCellView.h"
@interface ZLTodayTopViewCellView()

@property (nonatomic, strong) UIView *bottomLineView;

@property (nonatomic, strong) UIView *leftFirstLineView;
@property (nonatomic, strong) UIView *leftSecondLineView;

@end

@implementation ZLTodayTopViewCellView

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.bottomLineView];
    [self addSubview:self.departName];
    [self addSubview:self.dutyPersonnel];
    [self addSubview:self.leftFirstLineView];
    [self addSubview:self.leftSecondLineView];
    
}

- (void)updateConstraints{
    [super updateConstraints];
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
    
    [self.departName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.leftSecondLineView).offset(10);
        make.height.equalTo(self);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.top.equalTo(self);
    }];
    
    [self.dutyPersonnel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.departName.mas_right).offset(0);
        make.height.equalTo(self);
        make.right.equalTo(self.mas_right);
        make.top.equalTo(self);
    }];
    
    
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom);
        make.height.mas_equalTo(1);
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}


- (UIView *)bottomLineView{
    
    if (!_bottomLineView) {
        _bottomLineView = [[UIView alloc]init];
        _bottomLineView.backgroundColor = [UIColor blueColor];
    }
    return _bottomLineView;
    
}
- (UIView *)leftFirstLineView{
    
    if (!_leftFirstLineView) {
        _leftFirstLineView = [[UIView alloc]init];
        _leftFirstLineView.backgroundColor = [UIColor blueColor];
    }
    return _leftFirstLineView;
    
}

- (UIView *)leftSecondLineView{
    
    if (!_leftSecondLineView) {
        _leftSecondLineView = [[UIView alloc]init];
        _leftSecondLineView.backgroundColor = [UIColor blueColor];
    }
    return _leftSecondLineView;
    
}

- (UILabel *)dutyPersonnel{
    if (!_dutyPersonnel) {
        _dutyPersonnel = [[UILabel alloc]init];
        _dutyPersonnel.text = @"管理员";
        _dutyPersonnel.font = CHINESE_SYSTEM(13);
        _dutyPersonnel.textColor = [UIColor whiteColor];
        
    }
    return _dutyPersonnel;
}


- (UILabel *)departName{
    if (!_departName) {
        _departName = [[UILabel alloc]init];
        _departName.text = @"部门: 办公室";
        _departName.font = CHINESE_SYSTEM(13);
        _departName.textColor = [UIColor whiteColor];
    }
    return _departName;
}


@end
