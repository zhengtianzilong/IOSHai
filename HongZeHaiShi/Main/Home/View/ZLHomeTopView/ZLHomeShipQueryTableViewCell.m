//
//  ZLHomeShipQueryTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/25.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipQueryTableViewCell.h"
@implementation ZLHomeShipQueryTableViewCell

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
    [self.contentView addSubview:self.peopleNameLabel];
    [self.contentView addSubview:self.peopleName];
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.phone];
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
    
    [self.peopleNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.shipLable.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.peopleName mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.peopleNameLabel.mas_right);
        make.top.equalTo(self.peopleNameLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.peopleNameLabel.mas_right).offset(60);
        make.top.equalTo(self.peopleNameLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.phone mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.phoneLabel.mas_right);
        make.top.equalTo(self.phoneLabel);
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
        _shipLable.text = @"船舶识别号:";
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

- (UILabel *)peopleNameLabel{
    if (!_peopleNameLabel) {
        _peopleNameLabel = [[UILabel alloc]init];
        _peopleNameLabel.text = @"船员姓名:";
        _peopleNameLabel.font = CHINESE_SYSTEM(13);
    }
    return _peopleNameLabel;
}

- (UILabel *)peopleName{
    if (!_peopleName) {
        _peopleName = [[UILabel alloc]init];
        _peopleName.text = @"征天紫龙";
        _peopleName.font = CHINESE_SYSTEM(13);
    }
    return _peopleName;
}

- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.text = @"电话:";
        _phoneLabel.font = CHINESE_SYSTEM(13);
    }
    return _phoneLabel;
}
- (UILabel *)phone{
    if (!_phone) {
        _phone = [[UILabel alloc]init];
        _phone.text = @"15951751905";
        _phone.font = CHINESE_SYSTEM(13);
    }
    return _phone;
}


@end
