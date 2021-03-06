//
//  ZLSelectInfoView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLSelectInfoView.h"

@interface ZLSelectInfoView ()




@property (nonatomic, strong) UIView *lineView;
@end

@implementation ZLSelectInfoView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        
//        [self addSubview:self.shipLabel];
//        [self addSubview:self.shipTextField];
//        [self addSubview:self.shipLineView];
        [self addSubview:self.shipName];
        [self addSubview:self.startTimeView];
        [self addSubview:self.lineView];
        [self addSubview:self.endTimeView];
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.shipName mas_remakeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(41);
        make.right.equalTo(self.mas_right);
    }];
    
    
    [self.startTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self.shipName.mas_bottom).offset(0);
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

- (ZLLabelAndTextFieldView *)shipName{
    if (!_shipName) {
        
        _shipName = [[ZLLabelAndTextFieldView alloc]initWithFrame:CGRectZero title:@"船舶名称:" placeHolder:@"请输入船舶名称"];
        
    }
    return _shipName;
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
        
        _lineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _lineView;
}

@end
