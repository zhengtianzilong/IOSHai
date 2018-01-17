//
//  ZLHomeTopView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeTopView.h"

@interface ZLHomeTopView()

@property (nonatomic, strong) UIImageView *logoImageV;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *windLabel;

@property (nonatomic, strong) UILabel *weatherLabel;

@end

@implementation ZLHomeTopView

- (instancetype)init{
    
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.logoImageV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.windLabel];
    [self addSubview:self.weatherLabel];
    
    
}

- (void)updateConstraints{
    [super updateConstraints];
    [self.logoImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.width.mas_equalTo(50 * kScreenWidthRatio);
        make.height.mas_equalTo(50 * kScreenWidthRatio);
        make.top.equalTo(self).offset(5 * kScreenHeightRatio);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.logoImageV.mas_bottom).offset(5 * kScreenHeightRatio);
//        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.windLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5 * kScreenHeightRatio);
//        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.weatherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.width.mas_equalTo(Main_Screen_Width);
        //        make.height.mas_equalTo(20);
        make.top.equalTo(self.windLabel.mas_bottom).offset(5 * kScreenHeightRatio);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    
}

- (void)layoutSubviews{
    [super layoutSubviews];

}

- (UIImageView *)logoImageV{
    if (!_logoImageV) {
        
        _logoImageV = [[UIImageView alloc]init];
        _logoImageV.backgroundColor = [UIColor redColor];
        
    }
    return _logoImageV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = SHOME_TOP_TITLE;
        _titleLabel.font = CHINESE_SYSTEMBold(15);
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}

- (UILabel *)windLabel{
    if (!_windLabel) {
        _windLabel = [[UILabel alloc]init];
        _windLabel.text = SLOGIN_TOP_TITLE;
        _windLabel.font = CHINESE_SYSTEMBold(14);
        _windLabel.textColor = [UIColor whiteColor];
        _windLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _windLabel;
}

- (UILabel *)weatherLabel{
    if (!_weatherLabel) {
        _weatherLabel = [[UILabel alloc]init];
        _weatherLabel.text = @"洪泽海事移动执法平台洪泽海事移动执法平台洪";
        _weatherLabel.font = CHINESE_SYSTEMBold(14);
        _weatherLabel.numberOfLines = 0;
        _weatherLabel.textColor = [UIColor whiteColor];
        _weatherLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _weatherLabel;
}

@end
