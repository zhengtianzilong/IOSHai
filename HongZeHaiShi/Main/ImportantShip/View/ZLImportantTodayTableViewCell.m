//
//  ZLImportantTodayTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLImportantTodayTableViewCell.h"

@implementation ZLImportantTodayTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.tipImageV];
    [self.contentView addSubview:self.shipLable];
    [self.contentView addSubview:self.ship];
    [self.contentView addSubview:self.weightLabel];
    [self.contentView addSubview:self.weight];
    [self.contentView addSubview:self.deadWeightLabel];
    [self.contentView addSubview:self.deadWeight];
    [self.contentView addSubview:self.people];
}

- (void)updateConstraints{
    
    [super updateConstraints];
   
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(100);
        
    }];
    
    
    [self.tipImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel.mas_right).offset(0);
        make.top.equalTo(self.titleLabel);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(20);
        
    }];
    
    [self.shipLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.ship mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable.mas_right);
        make.top.equalTo(self.shipLable);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.shipLable.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.weight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.weightLabel.mas_right);
        make.top.equalTo(self.weightLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    
    [self.deadWeightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable.mas_right);
        make.top.equalTo(self.weightLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.deadWeight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.deadWeightLabel.mas_right);
        make.top.equalTo(self.deadWeightLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.people mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable);
        make.top.equalTo(self.weightLabel.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        _titleLabel.text = @"江苏拖4003";
        _titleLabel.font = CHINESE_SYSTEM(15);
    }
    return _titleLabel;
}

- (UIImageView *)tipImageV{
    if (!_tipImageV) {
        _tipImageV = [[UIImageView alloc]init];
        _tipImageV.backgroundColor = [UIColor redColor];
    }
    return _tipImageV;
}

- (UILabel *)shipLable{
    if (!_shipLable) {
        _shipLable = [[UILabel alloc]init];
        _shipLable.text = @"船籍港:";
        _shipLable.font = CHINESE_SYSTEM(14);
    }
    return _shipLable;
}
- (UILabel *)ship{
    if (!_ship) {
        _ship = [[UILabel alloc]init];
        _ship.text = @"XXXXX";
        _ship.font = CHINESE_SYSTEM(14);
    }
    return _ship;
}

- (UILabel *)weightLabel{
    if (!_weightLabel) {
        _weightLabel = [[UILabel alloc]init];
        _weightLabel.text = @"总吨:";
        _weightLabel.font = CHINESE_SYSTEM(13);
    }
    return _weightLabel;
}

- (UILabel *)weight{
    if (!_weight) {
        _weight = [[UILabel alloc]init];
        _weight.text = @"80";
        _weight.font = CHINESE_SYSTEM(13);
    }
    return _weight;
}

- (UILabel *)deadWeightLabel{
    if (!_deadWeightLabel) {
        _deadWeightLabel = [[UILabel alloc]init];
        _deadWeightLabel.text = @"载重吨:";
        _deadWeightLabel.font = CHINESE_SYSTEM(13);
    }
    return _deadWeightLabel;
}
- (UILabel *)deadWeight{
    if (!_deadWeight) {
        _deadWeight = [[UILabel alloc]init];
        _deadWeight.text = @"136";
        _deadWeight.font = CHINESE_SYSTEM(13);
    }
    return _deadWeight;
}

- (UILabel *)people{
    if (!_people) {
        _people = [[UILabel alloc]init];
        _people.text = @"系统管理员标记";
        _people.font = CHINESE_SYSTEM(13);
    }
    return _people;
}

@end
