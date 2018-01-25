//
//  ZLMeChangePasswordView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/16.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMeChangePasswordView.h"
#import "UIView+RoundedCorner.h"
@interface ZLMeChangePasswordView()

@property (nonatomic, strong) UITextField *oldTextField;
@property (nonatomic, strong) UIView *oldLine;
@property (nonatomic, strong) UITextField *newTextField;
@property (nonatomic, strong) UIView *newsLine;
@property (nonatomic, strong) UITextField *sureTextField;
@property (nonatomic, strong) UIView *sureLine;

@property (nonatomic, strong) UIButton *sureBtn;


@end

@implementation ZLMeChangePasswordView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.oldTextField];
    [self addSubview:self.oldLine];
    [self addSubview:self.newTextField];
    [self addSubview:self.newsLine];
    [self addSubview:self.sureTextField];
    [self addSubview:self.sureLine];
    [self addSubview:self.sureBtn];
}

- (void)updateConstraints{
    [super updateConstraints];
    [self.oldTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(Main_Screen_Width * 2 / 3);
        make.top.equalTo(self).offset(20);
    }];
    
    [self.oldLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(Main_Screen_Width * 2 / 3);
        make.top.equalTo(self.oldTextField.mas_bottom).offset(0);
    }];
    
    [self.newTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.equalTo(self.oldTextField );
        make.top.equalTo(self.oldTextField.mas_bottom).offset(20);
        make.width.equalTo(self.oldTextField );
    }];
    [self.newsLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(Main_Screen_Width * 2 / 3);
        make.top.equalTo(self.newTextField.mas_bottom).offset(0);
    }];
    [self.sureTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.equalTo(self.oldTextField );
        make.top.equalTo(self.newTextField.mas_bottom).offset(20);
        make.width.equalTo(self.oldTextField);
    }];
    [self.sureLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(1);
        make.width.mas_equalTo(Main_Screen_Width * 2 / 3);
        make.top.equalTo(self.sureTextField.mas_bottom).offset(0);
    }];
    
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.height.mas_equalTo(40);
        make.width.mas_equalTo(Main_Screen_Width * 2 / 3);
        make.top.equalTo(self.sureLine.mas_bottom).offset(30);
    }];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (UITextField *)oldTextField{
    if (!_oldTextField) {
        _oldTextField = [[UITextField alloc]init];
        _oldTextField.placeholder = @"旧密码";
        _oldTextField.borderStyle = UITextBorderStyleNone;
        
    }
    return _oldTextField;
}

- (UIView *)oldLine{
    if (!_oldLine) {
        _oldLine = [[UIView alloc]init];
        _oldLine.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _oldLine;
}
- (UIView *)newsLine{
    if (!_newsLine) {
        _newsLine = [[UIView alloc]init];
        _newsLine.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _newsLine;
}
- (UIView *)sureLine{
    if (!_sureLine) {
        _sureLine = [[UIView alloc]init];
        _sureLine.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _sureLine;
}

- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [[UIButton alloc]init];
        [_sureBtn setTitle:@"完成" forState:(UIControlStateNormal)];
//        _sureBtn.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        [self.sureBtn jm_setCornerRadius:10 withBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
    }
    return _sureBtn;
}

- (UITextField *)newTextField{
    if (!_newTextField) {
        _newTextField = [[UITextField alloc]init];
        _newTextField.placeholder = @"新密码";
        _newTextField.borderStyle = UITextBorderStyleNone;
        
    }
    return _newTextField;
}

- (UITextField *)sureTextField{
    if (!_sureTextField) {
        _sureTextField = [[UITextField alloc]init];
        _sureTextField.placeholder = @"确认密码";
        _sureTextField.borderStyle = UITextBorderStyleNone;
        
    }
    return _sureTextField;
}
@end
