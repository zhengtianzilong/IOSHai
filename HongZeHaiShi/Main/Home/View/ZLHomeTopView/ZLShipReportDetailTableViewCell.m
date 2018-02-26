//
//  ZLShipReportDetailTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipReportDetailTableViewCell.h"

@implementation ZLShipReportDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.shipLable];
    [self.contentView addSubview:self.ship];
    [self.contentView addSubview:self.wattLabel];
    [self.contentView addSubview:self.watt];
    [self.contentView addSubview:self.lengthLabel];
    [self.contentView addSubview:self.length];
    [self.contentView addSubview:self.noteLabel];
    [self.contentView addSubview:self.note];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}

- (void)setDetailModel:(ZLShipReportFlotillaReportDeatilModel *)detailModel{
    
    _detailModel = detailModel;
    
    self.ship.text = detailModel.shipName;
    self.watt.text = detailModel.tonnage;
    self.length.text = detailModel.shipLength; ;
    self.note.text = detailModel.remark;
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.shipLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width / 3);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.ship mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable.mas_right);
        make.top.equalTo(self.shipLable);
        make.height.mas_equalTo(20);
        make.right.equalTo(self.contentView.mas_right);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.wattLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable);
        make.top.equalTo(self.shipLable.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.shipLable);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.watt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.wattLabel.mas_right);
        make.top.equalTo(self.wattLabel);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.ship);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.lengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable);
        make.top.equalTo(self.wattLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.shipLable);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.length mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.lengthLabel.mas_right);
        make.top.equalTo(self.lengthLabel);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.ship);
        //        make.width.mas_equalTo(50);
        
    }];
    
    
    
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable);
        make.top.equalTo(self.lengthLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.shipLable);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.note mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.noteLabel.mas_right);
        make.top.equalTo(self.noteLabel);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.ship);
        //        make.width.mas_equalTo(50);
        
    }];
    
    
}


- (UILabel *)shipLable{
    if (!_shipLable) {
        _shipLable = [[UILabel alloc]init];
        _shipLable.text = @"船名:";
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


- (UILabel *)wattLabel{
    if (!_wattLabel) {
        _wattLabel = [[UILabel alloc]init];
        _wattLabel.text = @"千瓦/载重吨:";
        _wattLabel.font = CHINESE_SYSTEM(14);
    }
    return _wattLabel;
}

- (UILabel *)watt{
    if (!_watt) {
        _watt = [[UILabel alloc]init];
        _watt.text = @"系统管理员标记";
        _watt.font = CHINESE_SYSTEM(14);
    }
    return _watt;
}



- (UILabel *)lengthLabel{
    if (!_lengthLabel) {
        _lengthLabel = [[UILabel alloc]init];
        _lengthLabel.text = @"船队长度(米):";
        _lengthLabel.font = CHINESE_SYSTEM(14);
    }
    return _lengthLabel;
}

- (UILabel *)length{
    if (!_length) {
        _length = [[UILabel alloc]init];
        _length.text = @"系统管理员标记";
        _length.font = CHINESE_SYSTEM(14);
    }
    return _length;
}


- (UILabel *)noteLabel{
    if (!_noteLabel) {
        _noteLabel = [[UILabel alloc]init];
        _noteLabel.text = @"备注:";
        _noteLabel.font = CHINESE_SYSTEM(14);
    }
    return _noteLabel;
}

- (UILabel *)note{
    if (!_note) {
        _note = [[UILabel alloc]init];
        _note.text = @"系统管理员标记";
        _note.font = CHINESE_SYSTEM(13);
    }
    return _note;
}

@end
