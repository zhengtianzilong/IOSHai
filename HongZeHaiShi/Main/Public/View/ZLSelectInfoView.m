//
//  ZLSelectInfoView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLSelectInfoView.h"
#import "ZLTimeSelectView.h"
@interface ZLSelectInfoView ()
@property (nonatomic, strong) UILabel *shipLabel;

@property (nonatomic, strong) UITextField *shipTextField;

@property (nonatomic, strong) UIView *shipLineView;

@property (nonatomic, strong) ZLTimeSelectView *startTimeView;
@property (nonatomic, strong) ZLTimeSelectView *endTimeView;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation ZLSelectInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.shipLabel];
        [self addSubview:self.shipTextField];
        [self addSubview:self.shipLineView];
        
        [self addSubview:self.startTimeView];
        [self addSubview:self.lineView];
        [self addSubview:self.endTimeView];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.shipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(40);
        
    }];
    
    [self.shipTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shipLabel.mas_right).offset(0);
        make.top.equalTo(self.mas_top).offset(0);
        make.height.mas_equalTo(40);
        make.right.equalTo(self.mas_right);
        
    }];
    
    [self.shipLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.shipTextField.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
        make.right.equalTo(self.mas_right);
    }];
    
    
    
    [self.startTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.shipLineView.mas_bottom).offset(0);
        make.height.mas_equalTo(40);
    }];
    
    
    
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.startTimeView.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
        make.right.equalTo(self.mas_right);
    }];
    
    [self.endTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.lineView.mas_bottom).offset(0);
        make.height.mas_equalTo(40);
        make.bottom.equalTo(self.mas_bottom);
    }];
}

- (UILabel *)shipLabel{
    if (!_shipLabel) {
        
        _shipLabel = [[UILabel alloc]init];
        [_shipLabel setText:@"船舶名称:"];
        _shipLabel.backgroundColor = [UIColor whiteColor];
        _shipLabel.font = CHINESE_SYSTEM(15);
        
    }
    return _shipLabel;
    
    
}

- (UITextField *)shipTextField{
    if (!_shipTextField) {
        _shipTextField = [[UITextField alloc]init];
        _shipTextField.placeholder = @"请输入船舶名称";
        _shipTextField.backgroundColor = [UIColor whiteColor];
        
    }
    return _shipTextField;
}
- (UIView *)shipLineView{
    if (!_shipLineView) {
        _shipLineView = [[UIView alloc]init];
        _shipLineView.backgroundColor = [UIColor redColor];
    }
    return _shipLineView;
}


- (ZLTimeSelectView *)startTimeView{
    if (!_startTimeView) {
        
        _startTimeView = [[ZLTimeSelectView alloc]init];
        _startTimeView.timeLabel.text = @"开始时间:";
    }
    return _startTimeView;
}

- (ZLTimeSelectView *)endTimeView{
    if (!_endTimeView) {
        
        _endTimeView = [[ZLTimeSelectView alloc]init];
        
        _endTimeView.timeLabel.text = @"结束时间:";
        
    }
    return _endTimeView;
}

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        
        _lineView.backgroundColor = [UIColor redColor];
    }
    return _lineView;
}

@end
