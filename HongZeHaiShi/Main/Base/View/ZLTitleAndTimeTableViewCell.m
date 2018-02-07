//
//  ZLTitleAndTimeTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTitleAndTimeTableViewCell.h"

@implementation ZLTitleAndTimeTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.timeLabel];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
//        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(100);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
//        _titleLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        _titleLabel.text = @"江苏拖4003";
        _titleLabel.numberOfLines = 0;
        _titleLabel.font = CHINESE_SYSTEM(14);
    }
    return _titleLabel;
}


- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.text = @"XXXXX";
        _timeLabel.font = CHINESE_SYSTEM(13);
    }
    return _timeLabel;
}
@end
