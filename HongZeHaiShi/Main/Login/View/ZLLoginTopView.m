//
//  ZLLoginTopView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLoginTopView.h"

@interface ZLLoginTopView()

@property (nonatomic, strong) UIImageView *logoImageV;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZLLoginTopView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.logoImageV];
    
    [self addSubview:self.titleLabel];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.logoImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.width.mas_equalTo(80 * kScreenWidthRatio);
        make.height.mas_equalTo(80 * kScreenWidthRatio);
        make.top.equalTo(self).offset(5 * kScreenHeightRatio);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.mas_equalTo(25);
        make.top.equalTo(self.logoImageV.mas_bottom).offset(10 * kScreenHeightRatio);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}

- (UIImageView *)logoImageV{
    if (!_logoImageV) {
        
        _logoImageV = [[UIImageView alloc]init];
//        _logoImageV.backgroundColor = [UIColor redColor];
        _logoImageV.image = [UIImage imageNamed:@"login_logo"];
        
    }
    return _logoImageV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = SLOGIN_TOP_TITLE;
        _titleLabel.font = CHINESE_SYSTEMBold(24);
        _titleLabel.textColor = [UIColor whiteColor];
        
    }
    return _titleLabel;
}


@end
