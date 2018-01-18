//
//  ZLShipBaseBottomView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipBaseBottomView.h"
@interface ZLShipBaseBottomView()


@end

@implementation ZLShipBaseBottomView

- (instancetype)init{
    if (self = [super init]) {
        [self setupUI];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.portOfRegistry];
    [self addSubview:self.airworthinessCertificate];
    [self addSubview:self.manningCertificate];
    [self addSubview:self.recentlySubmitted];
    [self addSubview:self.updateTime];
    [self addSubview:self.depth];
    [self addSubview:self.antifoulCertificate];
    [self addSubview:self.nationalityCertificate];
    [self addSubview:self.recentPenalties];
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    
    [self.portOfRegistry mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(0);
        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width / 2);
        //        make.width.mas_equalTo(100);
        
    }];
    
    
    [self.airworthinessCertificate mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.portOfRegistry);
        make.top.equalTo(self.portOfRegistry.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
        
    }];
    
    [self.manningCertificate mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.portOfRegistry);
        make.top.equalTo(self.airworthinessCertificate.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
        
    }];
    
    [self.recentlySubmitted mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.portOfRegistry);
        make.top.equalTo(self.manningCertificate.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
        
    }];
    
    [self.updateTime mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.portOfRegistry);
        make.top.equalTo(self.recentlySubmitted.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
        make.bottom.equalTo(self.mas_bottom);
    }];
    
    [self.depth mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.portOfRegistry.mas_right);
        make.top.equalTo(self.portOfRegistry);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
        
    }];
    
    
    [self.antifoulCertificate mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.depth);
        make.top.equalTo(self.depth.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
        
    }];
    
    [self.nationalityCertificate mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.manningCertificate.mas_right);
        make.top.equalTo(self.antifoulCertificate.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
    }];
    
    [self.recentPenalties mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.recentlySubmitted.mas_right);
        make.top.equalTo(self.nationalityCertificate.mas_bottom);
        make.height.equalTo(self.portOfRegistry);
        make.width.equalTo(self.portOfRegistry);
//        make.bottom.equalTo(self.mas_bottom);
    }];
}


- (ZLShipInfoView *)portOfRegistry{
    if (!_portOfRegistry) {
        _portOfRegistry = [[ZLShipInfoView alloc]initWithTitle:@"船籍港:" imageName:nil fontSize:13];
    }
    return _portOfRegistry;
}

- (ZLShipInfoView *)airworthinessCertificate{
    if (!_airworthinessCertificate) {
        _airworthinessCertificate = [[ZLShipInfoView alloc]initWithTitle:@"适航证书有效期:" imageName:nil fontSize:13];
    }
    return _airworthinessCertificate;
}

- (ZLShipInfoView *)manningCertificate{
    if (!_manningCertificate) {
        _manningCertificate = [[ZLShipInfoView alloc]initWithTitle:@"配员证书有效期:" imageName:nil fontSize:13];
    }
    return _manningCertificate;
}

- (ZLShipInfoView *)recentlySubmitted{
    if (!_recentlySubmitted) {
        _recentlySubmitted = [[ZLShipInfoView alloc]initWithTitle:@"最近报港:" imageName:nil fontSize:13];
    }
    return _recentlySubmitted;
}

- (ZLShipInfoView *)updateTime{
    if (!_updateTime) {
        _updateTime = [[ZLShipInfoView alloc]initWithTitle:@"更新时间:" imageName:nil fontSize:13];
    }
    return _updateTime;
}

- (ZLShipInfoView *)depth{
    if (!_depth) {
        _depth = [[ZLShipInfoView alloc]initWithTitle:@"吃水深度:" imageName:nil fontSize:13];
    }
    return _depth;
}

- (ZLShipInfoView *)antifoulCertificate{
    if (!_antifoulCertificate) {
        _antifoulCertificate = [[ZLShipInfoView alloc]initWithTitle:@"防污证书有效期:" imageName:nil fontSize:13];
    }
    return _antifoulCertificate;
}

- (ZLShipInfoView *)nationalityCertificate{
    if (!_nationalityCertificate) {
        _nationalityCertificate = [[ZLShipInfoView alloc]initWithTitle:@"国籍证书有效期:" imageName:nil fontSize:13];
    }
    return _nationalityCertificate;
}
- (ZLShipInfoView *)recentPenalties{
    if (!_recentPenalties) {
        _recentPenalties = [[ZLShipInfoView alloc]initWithTitle:@"最近处罚:" imageName:nil fontSize:13];
    }
    return _recentPenalties;
}
@end
