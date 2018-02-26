//
//  ZLShipReportDetailTopTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipReportDetailTopTableViewCell.h"

@implementation ZLShipReportDetailTopTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    [self.contentView addSubview:self.shipCountLabel];
    [self.contentView addSubview:self.count];
    [self.contentView addSubview:self.lengehLabel];
    [self.contentView addSubview:self.length];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self.shipCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.contentView).offset(5);
        
    }];
    [self.count mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(0);
        make.right.equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.shipCountLabel.mas_bottom).offset(0);
    }];
    [self.lengehLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_centerX);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(20);
         make.top.equalTo(self.contentView).offset(5);
    }];
    
    [self.length mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_centerX);
        make.right.equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(20);
        make.top.equalTo(self.lengehLabel.mas_bottom).offset(0);
    }];
    
}


- (UILabel *)shipCountLabel{
    if (!_shipCountLabel) {
        _shipCountLabel = [[UILabel alloc]init];
        _shipCountLabel.text = @"合计船数量";
        _shipCountLabel.textAlignment = NSTextAlignmentCenter;
        _shipCountLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    }
    return _shipCountLabel;
}

- (UILabel *)count{
    if (!_count) {
        _count = [[UILabel alloc]init];
        _count.textAlignment = NSTextAlignmentCenter;
        _count.text = @"已报港";
    }
    return _count;
}

- (UILabel *)lengehLabel{
    if (!_lengehLabel) {
        _lengehLabel = [[UILabel alloc]init];
        _lengehLabel.text = @"合计船队长度(米)";
        _lengehLabel.textAlignment = NSTextAlignmentCenter;
        _lengehLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
    }
    return _lengehLabel;
}
- (UILabel *)length{
    if (!_length) {
        _length = [[UILabel alloc]init];
        _length.text = @"已报港";
        _length.textAlignment = NSTextAlignmentCenter;
    }
    return _length;
}
@end
