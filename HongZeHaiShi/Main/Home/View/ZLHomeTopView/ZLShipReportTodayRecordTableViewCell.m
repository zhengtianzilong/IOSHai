//
//  ZLShipReportTodayRecordTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipReportTodayRecordTableViewCell.h"

@implementation ZLShipReportTodayRecordTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    [self.contentView addSubview:self.imageV];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.countLabel];
    [self.contentView addSubview:self.souLabel];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.contentView).offset(10);
        make.centerY.equalTo(self.contentView);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.imageV.mas_right).offset(10);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(20);
        
    }];
    [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right).offset(0);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(20);
    }];
    [self.souLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countLabel.mas_right).offset(0);
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(20);
    }];
}


- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"home_ship_todayReport"] ];
        
    }
    return _imageV;
    
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"已报港";
    }
    return _titleLabel;
}

- (UILabel *)countLabel{
    if (!_countLabel) {
        _countLabel = [[UILabel alloc]init];
        _countLabel.text = @"已报港";
        _countLabel.textColor = [UIColor redColor];
    }
    return _countLabel;
}

- (UILabel *)souLabel{
    if (!_souLabel) {
        _souLabel = [[UILabel alloc]init];
        _souLabel.text = @"艘";
    }
    return _souLabel;
}





@end
