//
//  ZLShipBaseTopInfoView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipBaseTopInfoView.h"

@interface ZLShipBaseTopInfoView()

@property (nonatomic, strong) UILabel *baseInfoLabel;;

@end

@implementation ZLShipBaseTopInfoView

- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.baseInfoLabel];
    [self addSubview:self.shipName];
    [self addSubview:self.shipOwner];
    [self addSubview:self.shipOperator];
    [self addSubview:self.telephone];
    [self addSubview:self.deadWeight];
    [self addSubview:self.weight];
    [self addSubview:self.lengthAndWidth];
    [self addSubview:self.people];
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self.shipName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width / 2);
        //        make.width.mas_equalTo(100);
        
    }];
    
    
    [self.shipOwner mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipName);
        make.top.equalTo(self.shipName.mas_bottom);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        
    }];
    
    [self.shipOperator mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipName);
        make.top.equalTo(self.shipOwner.mas_bottom);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        
    }];
    
    [self.telephone mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipName);
        make.top.equalTo(self.shipOperator.mas_bottom);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        
    }];
    
    [self.deadWeight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipName);
        make.top.equalTo(self.telephone.mas_bottom);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        
    }];
    
    [self.weight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.deadWeight.mas_right);
        make.top.equalTo(self.deadWeight);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        
    }];
    
    
    [self.lengthAndWidth mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipName);
        make.top.equalTo(self.deadWeight.mas_bottom);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        
    }];
    
    [self.people mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.lengthAndWidth.mas_right);
        make.top.equalTo(self.lengthAndWidth);
        make.height.equalTo(self.shipName);
        make.width.equalTo(self.shipName);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
}

- (UILabel *)baseInfoLabel{
    if (!_baseInfoLabel) {
        _baseInfoLabel = [[UILabel alloc]init];
        _baseInfoLabel.font = CHINESE_SYSTEM(15);
        _baseInfoLabel.backgroundColor = [UIColor lightGrayColor];
        _baseInfoLabel.text = @"基本信息";
    }
    return _baseInfoLabel;
}

- (ZLShipInfoView *)shipName{
    if (!_shipName) {
        _shipName = [[ZLShipInfoView alloc]initWithTitle:@"船名:" imageName:@""];
    }
    return _shipName;
}

- (ZLShipInfoView *)shipOwner{
    if (!_shipOwner) {
        _shipOwner = [[ZLShipInfoView alloc]initWithTitle:@"船主:" imageName:@""];
    }
    return _shipOwner;
}

- (ZLShipInfoView *)shipOperator{
    if (!_shipOperator) {
        _shipOperator = [[ZLShipInfoView alloc]initWithTitle:@"经营人:" imageName:@""];
    }
    return _shipOperator;
}

- (ZLShipInfoView *)telephone{
    if (!_telephone) {
        _telephone = [[ZLShipInfoView alloc]initWithTitle:@"电话:" imageName:@""];
    }
    return _telephone;
}

- (ZLShipInfoView *)deadWeight{
    if (!_deadWeight) {
        _deadWeight = [[ZLShipInfoView alloc]initWithTitle:@"载重吨:" imageName:@""];
    }
    return _deadWeight;
}

- (ZLShipInfoView *)weight{
    if (!_weight) {
        _weight = [[ZLShipInfoView alloc]initWithTitle:@"总吨位:" imageName:@""];
    }
    return _weight;
}

- (ZLShipInfoView *)lengthAndWidth{
    if (!_lengthAndWidth) {
        _lengthAndWidth = [[ZLShipInfoView alloc]initWithTitle:@"长、宽:" imageName:@""];
    }
    return _lengthAndWidth;
}

- (ZLShipInfoView *)people{
    if (!_people) {
        _people = [[ZLShipInfoView alloc]initWithTitle:@"配员:" imageName:@""];
    }
    return _people;
}

@end
