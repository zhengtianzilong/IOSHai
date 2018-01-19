//
//  ZLInfoRecordTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/19.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLInfoRecordTableViewCell.h"

@interface ZLInfoRecordTableViewCell()



@end

@implementation ZLInfoRecordTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI{
    [self.contentView addSubview:self.people];
    [self.contentView addSubview:self.caseCount];
    [self.contentView addSubview:self.money];
    [self.contentView addSubview:self.caseAction];
    [self.contentView addSubview:self.time];

}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self.people mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(0);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.contentView);
//                make.width.mas_equalTo(100);
        
    }];
    
    
    [self.caseCount mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.people);
        make.top.equalTo(self.people.mas_bottom);
        make.height.equalTo(self.people);
        make.width.equalTo(self.people);
        
    }];
    
    [self.money mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.people);
        make.top.equalTo(self.caseCount.mas_bottom);
        make.height.equalTo(self.people);
        make.width.equalTo(self.people);
        
    }];

    [self.caseAction mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.people);
        make.top.equalTo(self.money.mas_bottom);
        make.height.equalTo(self.people);
        make.width.equalTo(self.people);
        
    }];
    
    [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.people);
        make.top.equalTo(self.caseAction.mas_bottom);
        make.height.equalTo(self.people);
        make.width.equalTo(self.people);
        
    }];
    
    
    
    
}

- (ZLShipInfoView *)people{
    if (!_people) {
        _people = [[ZLShipInfoView alloc]initWithTitle:@"处罚人:" imageName:nil fontSize:13];
    }
    return _people;
}

- (ZLShipInfoView *)caseCount{
    if (!_caseCount) {
        _caseCount = [[ZLShipInfoView alloc]initWithTitle:@"案号:" imageName:nil fontSize:13];
    }
    return _caseCount;
}

- (ZLShipInfoView *)money{
    if (!_money) {
        _money = [[ZLShipInfoView alloc]initWithTitle:@"金额:" imageName:nil fontSize:13];
    }
    return _money;
}

- (ZLShipInfoView *)caseAction{
    if (!_caseAction) {
        _caseAction = [[ZLShipInfoView alloc]initWithTitle:@"案由:" imageName:nil fontSize:13];
    }
    return _caseAction;
}

- (ZLShipInfoView *)time{
    if (!_time) {
        _time = [[ZLShipInfoView alloc]initWithTitle:@"时间:" imageName:nil fontSize:13];
    }
    return _time;
}


@end
