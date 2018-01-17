//
//  ZLMeTopView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMeTopView.h"

@interface ZLMeTopView()

@end

@implementation ZLMeTopView

- (instancetype)init{
    
    if (self = [super init]) {
        
        self.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.userImageView];
    [self addSubview:self.userLevel];
    [self addSubview:self.department];
    
}

- (void)updateConstraints{
    [super updateConstraints];
    [self.userImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(50);
        make.top.equalTo(self).offset(10);
    }];
    
    [self.userLevel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.userImageView.mas_bottom).offset(10);
        //        make.width.equalTo(self.userImageView);
    }];
    
    [self.department mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.equalTo(self.userLevel);
        make.top.equalTo(self.userLevel.mas_bottom);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
        //        make.width.mas_equalTo(Main_Screen_Width  / 4);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (UIImageView *)userImageView{
    if (!_userImageView) {
        _userImageView = [[UIImageView alloc]init];
        _userImageView.backgroundColor = [UIColor redColor];
    }
    return _userImageView;
}

- (UILabel *)userLevel{
    if (!_userLevel) {
        _userLevel = [[UILabel alloc]init];
        _userLevel.text = @"管理员";
        _userLevel.font = CHINESE_SYSTEM(16);
        _userLevel.textColor = [UIColor whiteColor];
        
    }
    return _userLevel;
}


- (UILabel *)department{
    if (!_department) {
        _department = [[UILabel alloc]init];
        _department.text = @"部门: 办公室";
        _department.font = CHINESE_SYSTEM(14);
        _department.textColor = [UIColor whiteColor];
    }
    return _department;
}

@end
