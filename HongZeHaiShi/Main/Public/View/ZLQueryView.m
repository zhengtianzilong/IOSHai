//
//  ZLQueryView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLQueryView.h"
#import "ZLTimeSelectView.h"
#import "ZLThreeButtonView.h"
#import "UIView+RoundedCorner.h"
#import "ZLSelectInfoView.h"
@interface ZLQueryView ()
//@property (nonatomic, strong) UILabel *shipLabel;
//
//@property (nonatomic, strong) UITextField *shipTextField;
//
//@property (nonatomic, strong) UIView *shipLineView;
//
//@property (nonatomic, strong) ZLTimeSelectView *startTimeView;
//@property (nonatomic, strong) ZLTimeSelectView *endTimeView;

@property (nonatomic, strong) ZLSelectInfoView *selectInfoView;

@property (nonatomic, strong) ZLThreeButtonView *threeButton;
//@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIButton *queryButton;
@end

@implementation ZLQueryView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor lightGrayColor];
        
//        [self addSubview:self.shipLabel];
//        [self addSubview:self.shipTextField];
//        [self addSubview:self.shipLineView];
//
//        [self addSubview:self.startTimeView];
//        [self addSubview:self.lineView];
//        [self addSubview:self.endTimeView];
        
        [self addSubview:self.selectInfoView];
        [self addSubview:self.threeButton];
        [self addSubview:self.queryButton];
        
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
//
//    [self.shipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(10);
//        make.top.equalTo(self).offset(0);
//        make.height.mas_equalTo(40);
//
//    }];
//
//    [self.shipTextField mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.shipLabel.mas_right).offset(0);
//        make.top.equalTo(self.mas_top).offset(0);
//        make.height.mas_equalTo(40);
//        make.right.equalTo(self.mas_right);
//
//    }];
//
//    [self.shipLineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(0);
//        make.top.equalTo(self.shipTextField.mas_bottom).offset(0);
//        make.height.mas_equalTo(1);
//        make.right.equalTo(self.mas_right);
//    }];
//
//
//
//    [self.startTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self);
//        make.right.equalTo(self.mas_right).offset(0);
//        make.top.equalTo(self.shipLineView.mas_bottom).offset(0);
//        make.height.mas_equalTo(40);
//    }];
//
//
//
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self).offset(0);
//        make.top.equalTo(self.startTimeView.mas_bottom).offset(0);
//        make.height.mas_equalTo(1);
//        make.right.equalTo(self.mas_right);
//    }];
//
//    [self.endTimeView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self);
//        make.right.equalTo(self.mas_right).offset(0);
//        make.top.equalTo(self.lineView.mas_bottom).offset(0);
//        make.height.mas_equalTo(40);
//    }];
    
    [self.selectInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self);
        make.right.equalTo(self.mas_right).offset(0);
        make.top.equalTo(self).offset(10);
//        make.height.mas_equalTo(40);
    }];
    
    [self.threeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.selectInfoView.mas_bottom).offset(10);
        make.height.mas_equalTo(35);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    [self.queryButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self);
        make.top.equalTo(self.threeButton.mas_bottom).offset(10);
        make.height.mas_equalTo(40);
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
    }];
    
    [self.threeButton jm_setCornerRadius:6 withBorderColor:[UIColor blackColor] borderWidth:1];
    
    [self.queryButton jm_setCornerRadius:6 withBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
    
    
}

//- (UILabel *)shipLabel{
//    if (!_shipLabel) {
//
//        _shipLabel = [[UILabel alloc]init];
//        [_shipLabel setText:@"船舶名称:"];
//        _shipLabel.backgroundColor = [UIColor whiteColor];
//        _shipLabel.font = CHINESE_SYSTEM(15);
//
//    }
//    return _shipLabel;
//
//
//}
//
//- (UITextField *)shipTextField{
//    if (!_shipTextField) {
//        _shipTextField = [[UITextField alloc]init];
//        _shipTextField.placeholder = @"请输入船舶名称";
//        _shipTextField.backgroundColor = [UIColor whiteColor];
//
//    }
//    return _shipTextField;
//}
//- (UIView *)shipLineView{
//    if (!_shipLineView) {
//        _shipLineView = [[UIView alloc]init];
//        _shipLineView.backgroundColor = [UIColor redColor];
//    }
//    return _shipLineView;
//}
//
//
//- (ZLTimeSelectView *)startTimeView{
//    if (!_startTimeView) {
//
//        _startTimeView = [[ZLTimeSelectView alloc]init];
//        _startTimeView.timeLabel.text = @"开始时间:";
//    }
//    return _startTimeView;
//}
//
//- (ZLTimeSelectView *)endTimeView{
//    if (!_endTimeView) {
//
//        _endTimeView = [[ZLTimeSelectView alloc]init];
//
//        _endTimeView.timeLabel.text = @"结束时间:";
//
//    }
//    return _endTimeView;
//}

- (ZLSelectInfoView *)selectInfoView{
    if (!_selectInfoView) {
        _selectInfoView = [[ZLSelectInfoView alloc]init];
        
    }
    return _selectInfoView;
}


- (ZLThreeButtonView *)threeButton{
    
    if (!_threeButton) {
        _threeButton = [[ZLThreeButtonView alloc]init];
        
    }
    return _threeButton;
    
}

- (UIButton *)queryButton{
    if (!_queryButton) {
        _queryButton = [[UIButton alloc]init];
//        _queryButton.backgroundColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        
        [_queryButton setTitle:@"查询" forState:(UIControlStateNormal)];
        
    }
    return _queryButton;
    
}

//- (UIView *)lineView{
//    if (!_lineView) {
//        _lineView = [[UIView alloc]init];
//
//        _lineView.backgroundColor = [UIColor redColor];
//    }
//    return _lineView;
//}

@end
