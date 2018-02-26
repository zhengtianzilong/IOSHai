//
//  ZLAnnouncementShipTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLAnnouncementShipTableViewCell.h"

@implementation ZLAnnouncementShipTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.detailLabel];
    [self.contentView addSubview:self.timeLabel];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}

- (void)setDetailModel:(ZLOaNotifyListDetailModel *)detailModel {
    _detailModel = detailModel;
    
    self.titleLabel.text = detailModel.SUBJECT;
    self.detailLabel.text = detailModel.CONTENT;
    self.timeLabel.text = detailModel.SEND_TIME;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(100);
        
    }];
    
    
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.height.mas_equalTo(20);
        make.right.equalTo(self.contentView.mas_right).offset(-30);
        //        make.width.mas_equalTo(20);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.detailLabel.mas_bottom);
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



- (UILabel *)detailLabel{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.text = @"船籍港:";
        _detailLabel.font = CHINESE_SYSTEM(13);
    }
    return _detailLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.text = @"XXXXX";
        _timeLabel.font = CHINESE_SYSTEM(12);
    }
    return _timeLabel;
}

@end
