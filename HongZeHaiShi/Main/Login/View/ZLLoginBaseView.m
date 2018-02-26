//
//  ZLLoginBaseView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLoginBaseView.h"

@interface ZLLoginBaseView()

@property (nonatomic, strong) UIImageView *bgImageV;
@end

@implementation ZLLoginBaseView

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.bgImageV];
    [self.bgImageV addSubview:self.loginTopView];
    
    [self.bgImageV addSubview:self.loginInputView];
    [self.bgImageV addSubview:self.loginBottomView];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.bgImageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self);
        make.width.mas_equalTo(Main_Screen_Width);
        make.height.mas_equalTo(Main_Screen_Height);
        make.top.equalTo(self);
        
    }];
    
    
    [self.loginTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.width.mas_equalTo(Main_Screen_Width);
//        make.height.mas_equalTo(@0);
        make.top.equalTo(self).offset(TopBarHeight);
    }];
    

    [self.loginBottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.height.mas_equalTo((Main_Screen_Height - TopBarHeight)/4 * kScreenHeightRatio);
        make.width.mas_equalTo(Main_Screen_Width);
        make.bottom.equalTo(self.mas_bottom).offset(0);
    }];
    
    [self.loginInputView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.width.mas_equalTo(Main_Screen_Width);
        make.top.equalTo(self.loginTopView.mas_bottom).offset(0);
        make.bottom.equalTo(self.loginBottomView.mas_top).offset(20 * kScreenHeightRatio);
    }];
    
    
}

- (UIImageView *)bgImageV{
    if (!_bgImageV) {
        
        _bgImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"login_bg"]];
        _bgImageV.userInteractionEnabled = YES;
    }
    return _bgImageV;
}

- (ZLLoginTopView *)loginTopView{
    if (!_loginTopView) {
        
        _loginTopView = [[ZLLoginTopView alloc]init];
        
    }
    return _loginTopView;
}
- (ZLLoginInputView *)loginInputView{
    if (!_loginInputView) {
        
        _loginInputView = [[ZLLoginInputView alloc]init];
        
    }
    return _loginInputView;
}

- (ZLLoginBottomView *)loginBottomView{
    if (!_loginBottomView) {
        
        _loginBottomView = [[ZLLoginBottomView alloc]init];
        
    }
    return _loginBottomView;
}

@end
