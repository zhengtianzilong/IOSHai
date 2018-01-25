//
//  ZLHoomeShipQueryTopView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/24.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipQueryTopView.h"
#import "ZLLabelAndTextFieldView.h"
#import "UIView+RoundedCorner.h"
@interface ZLHomeShipQueryTopView()

// 船号
@property (nonatomic, strong) ZLLabelAndTextFieldView *shipCount;


@property (nonatomic, strong) ZLLabelAndTextFieldView *shipPeopleName;

@property (nonatomic, strong) ZLLabelAndTextFieldView *phoneNumber;

// 船舶识别号
@property (nonatomic, strong) ZLLabelAndTextFieldView *shipIdentify;
@property (nonatomic, strong) UIButton *queryButton;
@end

@implementation ZLHomeShipQueryTopView

- (instancetype)init{
    
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.shipCount];
    [self addSubview:self.shipPeopleName];
    [self addSubview:self.phoneNumber];
    [self addSubview:self.shipIdentify];
    [self addSubview:self.queryButton];
    
}

- (void)updateConstraints{
    [super updateConstraints];
    [self.shipCount mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(41);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.shipPeopleName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.shipCount.mas_bottom).offset(0);
        make.height.mas_equalTo(41);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.phoneNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.shipPeopleName.mas_bottom).offset(0);
        make.height.mas_equalTo(41);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.shipIdentify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.phoneNumber.mas_bottom).offset(0);
        make.height.mas_equalTo(41);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.queryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.shipIdentify.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    [self.queryButton jm_setCornerRadius:6 withBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
}

- (ZLLabelAndTextFieldView *)shipCount{
    if (!_shipCount) {
        
        _shipCount = [[ZLLabelAndTextFieldView alloc]initWithFrame:CGRectZero title:@"船号:" placeHolder:@"请输入船舶号"];
        
    }
    return _shipCount;
}

- (ZLLabelAndTextFieldView *)shipPeopleName{
    if (!_shipPeopleName) {
        
        _shipPeopleName = [[ZLLabelAndTextFieldView alloc]initWithFrame:CGRectZero title:@"船员姓名:" placeHolder:@"请输入船员姓名"];
        
    }
    return _shipPeopleName;
}

- (ZLLabelAndTextFieldView *)phoneNumber{
    if (!_phoneNumber) {
        
        _phoneNumber = [[ZLLabelAndTextFieldView alloc]initWithFrame:CGRectZero title:@"电话号码:" placeHolder:@"请输入电话号码"];
        
    }
    return _phoneNumber;
}
- (ZLLabelAndTextFieldView *)shipIdentify{
    if (!_shipIdentify) {
        
        _shipIdentify = [[ZLLabelAndTextFieldView alloc]initWithFrame:CGRectZero title:@"船舶识别号:" placeHolder:@"请输入船舶识别号"];
        
    }
    return _shipIdentify;
}
- (UIButton *)queryButton{
    if (!_queryButton) {
        _queryButton = [[UIButton alloc]init];
        //        _queryButton.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        
        [_queryButton setTitle:@"查询" forState:(UIControlStateNormal)];
        
    }
    return _queryButton;
    
}

@end
