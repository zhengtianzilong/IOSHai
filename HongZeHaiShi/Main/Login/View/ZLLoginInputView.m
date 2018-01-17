//
//  ZLLoginInputView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLoginInputView.h"
#import "UIView+RoundedCorner.h"
@interface ZLLoginInputView()


@end

@implementation ZLLoginInputView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.nameTextField];
    
    [self addSubview:self.passTextField];
    
    [self addSubview:self.loginBtn];
    
   
    
}

- (void)updateConstraints{
    [super updateConstraints];
    [self.nameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self).offset(10 * kScreenHeightRatio);
        make.width.mas_equalTo(Main_Screen_Width * 3 / 4);
        make.height.mas_equalTo(40 * kScreenHeightRatio);
    }];
    
    [self.passTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.nameTextField.mas_bottom).offset(5);
        make.width.equalTo(self.nameTextField);
        make.height.mas_equalTo(40 * kScreenHeightRatio);
    }];
    
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.passTextField.mas_bottom).offset(35 * kScreenHeightRatio);
        make.width.mas_equalTo(Main_Screen_Width * 3 / 4 - 20);
        make.height.mas_equalTo(40 * kScreenHeightRatio);
    }];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.loginBtn jm_setCornerRadius:20 * kScreenHeightRatio withBorderColor:[UIColor redColor] borderWidth:1];

    
}

- (UITextField *)nameTextField{
    if (!_nameTextField) {
        _nameTextField = [[UITextField alloc]init];
        
        _nameTextField.borderStyle = UITextBorderStyleRoundedRect;
        _nameTextField.backgroundColor = [UIColor blueColor];
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40 * kScreenHeightRatio, 40 * kScreenHeightRatio)];
        imageV.backgroundColor = [UIColor redColor];
        _nameTextField.leftViewMode = UITextFieldViewModeAlways;
        _nameTextField.leftView = imageV;
        
    }
    return _nameTextField;
}

- (UITextField *)passTextField{
    if (!_passTextField) {
        _passTextField = [[UITextField alloc]init];
        
        _passTextField.borderStyle = UITextBorderStyleRoundedRect;
        
        _passTextField.backgroundColor = [UIColor blueColor];
        
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 40 * kScreenHeightRatio, 40 * kScreenHeightRatio)];
        imageV.backgroundColor = [UIColor redColor];
        _passTextField.leftViewMode = UITextFieldViewModeAlways;
        _passTextField.leftView = imageV;
    }
    return _passTextField;
}

- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc]init];
        [_loginBtn setTitle:@"登录" forState:(UIControlStateNormal)];
        [_loginBtn setTitleColor:[UIColor blueColor] forState:(UIControlStateNormal)];

    }
    return _loginBtn;
}

@end
