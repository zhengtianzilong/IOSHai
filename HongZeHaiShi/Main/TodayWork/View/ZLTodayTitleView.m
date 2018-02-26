//
//  ZLTodayTitleView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayTitleView.h"
@interface ZLTodayTitleView()

@property (nonatomic, strong) UIImageView *bgImageV;

@property (nonatomic, strong) UIImageView *dotImageV;


@end
@implementation ZLTodayTitleView
- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpViews];
        
    }
    return self;
    
}


- (void)setUpViews{
    [self addSubview:self.bgImageV];
    [self.bgImageV addSubview:self.dotImageV];
    [self.bgImageV addSubview:self.titleLabel];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.height.equalTo(self);
        make.width.equalTo(self.mas_width);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    
    [self.dotImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(15);
        make.centerY.equalTo(self.bgImageV.mas_centerY).offset(-5);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.dotImageV.mas_right).offset(8);
        make.height.mas_equalTo(20);
        make.right.equalTo(self.bgImageV.mas_right);
        make.centerY.equalTo(self.dotImageV);
    }];

    
    
}


- (UILabel *)titleLabel{
    
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"XZXXXXXXXXXX";
        _titleLabel.font = CHINESE_SYSTEM(13);
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
    
}


- (UIImageView *)bgImageV{
    
    if (!_bgImageV) {
        _bgImageV = [[UIImageView alloc]init];
        _bgImageV.image = [UIImage imageNamed:@"today_title_bg"];
    }
    return _bgImageV;
    
}
- (UIImageView *)dotImageV{
    
    if (!_dotImageV) {
        _dotImageV = [[UIImageView alloc]init];
        _dotImageV.image = [UIImage imageNamed:@"today_dot"];
    }
    return _dotImageV;
    
}


@end
