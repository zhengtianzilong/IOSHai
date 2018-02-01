//
//  ZLMyMessageTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/1.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMyMessageTableViewCell.h"
#import "UIView+RoundedCorner.h"
@implementation ZLMyMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    [self.contentView addSubview:self.tipsLabel];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.title];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.tipBtn];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(20);
        
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.tipsLabel);
        make.top.equalTo(self.tipsLabel.mas_bottom);
        make.height.mas_equalTo(20);
//                make.width.mas_equalTo(100);
        
    }];
    
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel.mas_right).offset(0);
        make.top.equalTo(self.titleLabel);
        make.height.mas_equalTo(20);
//                make.width.mas_equalTo(100);
        
    }];

    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.tipsLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.tipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(25);
        make.width.mas_equalTo(60);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
    [self.tipBtn jm_setCornerRadius:10 withBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
//        _titleLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        _titleLabel.text = @"标题:";
        _titleLabel.font = CHINESE_SYSTEM(13);
    }
    return _titleLabel;
}

- (UILabel *)title{
    if (!_title) {
        _title = [[UILabel alloc]init];
//        _title.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        _title.text = @"2018年1月26日洪泽湖解除封航信息";
        _title.font = CHINESE_SYSTEM(13);
    }
    return _title;
}

- (UIButton *)tipBtn{
    if (!_tipBtn) {
        _tipBtn = [[UIButton alloc]init];
        _tipBtn.titleLabel.font = CHINESE_SYSTEM(13);
        [_tipBtn setTitle:@"通航信息" forState:(UIControlStateNormal)];
        //        _tipBtn.backgroundColor = [UIColor redColor];
    }
    return _tipBtn;
}

- (UILabel *)tipsLabel{
    if (!_tipsLabel) {
        _tipsLabel = [[UILabel alloc]init];
        _tipsLabel.text = @"请查看公告通知!";
        _tipsLabel.font = CHINESE_SYSTEM(13);
    }
    return _tipsLabel;
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
