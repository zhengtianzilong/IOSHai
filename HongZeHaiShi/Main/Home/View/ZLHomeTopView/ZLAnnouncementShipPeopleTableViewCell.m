//
//  ZLAnnouncementShipPeopleTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLAnnouncementShipPeopleTableViewCell.h"

@implementation ZLAnnouncementShipPeopleTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.peopleLabel];
    [self.contentView addSubview:self.oneLineView];
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.twoLineView];
    [self.contentView addSubview:self.timeLabel];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}

- (void)setDetailModel:(ZLHsNotifyListDetailModel *)detailModel {
    _detailModel = detailModel;

    self.peopleLabel.text = detailModel.userName;
    
    if ([detailModel.isRead isEqualToString:@"1"]) {
        self.typeLabel.text = @"已阅";
    }else{
        self.typeLabel.text = @"未阅";
    }
    
    
    self.timeLabel.text = detailModel.updateTime;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self.peopleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width / 3.0 - 1 );
        //        make.width.mas_equalTo(100);
        
    }];
    
    [self.oneLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.peopleLabel.mas_right).offset(0);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(1);
        //        make.width.mas_equalTo(100);
        
    }];
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.oneLineView.mas_right);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width / 3.0 - 1 );
        //        make.width.mas_equalTo(20);
        
    }];
    
    [self.twoLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.typeLabel.mas_right).offset(0);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(1);
        //        make.width.mas_equalTo(100);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.twoLineView.mas_right);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(20);
        make.right.equalTo(self.contentView.mas_right);
        //        make.width.mas_equalTo(50);
        
    }];
    
    
}

- (UILabel *)peopleLabel{
    if (!_peopleLabel) {
        _peopleLabel = [[UILabel alloc]init];
        _peopleLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        _peopleLabel.text = @"江苏拖4003";
        _peopleLabel.font = CHINESE_SYSTEM(15);
    }
    return _peopleLabel;
}

- (UIView *)oneLineView{
    if (!_oneLineView) {
        _oneLineView = [[UIView alloc]init];
        _oneLineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _oneLineView;
}

- (UIView *)twoLineView{
    if (!_twoLineView) {
        _twoLineView = [[UIView alloc]init];
        _twoLineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _twoLineView;
}

- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.text = @"船籍港:";
        _typeLabel.font = CHINESE_SYSTEM(13);
    }
    return _typeLabel;
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
