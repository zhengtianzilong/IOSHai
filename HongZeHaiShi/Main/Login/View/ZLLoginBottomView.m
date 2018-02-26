//
//  ZLLoginBottomView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLoginBottomView.h"

@interface ZLLoginBottomView()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZLLoginBottomView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.titleLabel];
    [self addSubview:self.lineView];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self.titleLabel.mas_top).offset(-2);
        make.width.mas_equalTo(Main_Screen_Width * 3 / 4);
    }];
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor whiteColor];
        
    }
    return _lineView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = SLOGIN_BOTTOM_TITLE;
        _titleLabel.font = CHINESE_SYSTEM(14);
        _titleLabel.textColor = [UIColor whiteColor];
        
    }
    return _titleLabel;
}

@end
