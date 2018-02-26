//
//  ZLHomeDynamicView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeDynamicView.h"
@interface ZLHomeDynamicView()

@property (nonatomic, strong) UIImageView *dynamicImageV;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation ZLHomeDynamicView

- (instancetype)init{
    
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.dynamicImageV];
    
    [self addSubview:self.titleLabel];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.dynamicImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.width.mas_equalTo(50 * kScreenWidthRatio);
        make.height.mas_equalTo(50 * kScreenWidthRatio);
        make.left.equalTo(self).offset(20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.height.mas_equalTo(30);
        make.left.equalTo(self.dynamicImageV.mas_right).offset(10 * kScreenHeightRatio);
        make.right.equalTo(self.mas_right);
    }];
    
}

- (UIImageView *)dynamicImageV{
    if (!_dynamicImageV) {
        
        _dynamicImageV = [[UIImageView alloc]init];
//        _dynamicImageV.backgroundColor = [UIColor redColor];
        _dynamicImageV.image = [UIImage imageNamed:@"home_dyna_pic"];
        
    }
    return _dynamicImageV;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = SLOGIN_TOP_TITLE;
        _titleLabel.font = CHINESE_SYSTEMBold(14);
        
    }
    return _titleLabel;
}

@end
