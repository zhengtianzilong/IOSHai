//
//  ZLShipBaseDetailView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipBaseDetailView.h"

@interface ZLShipBaseDetailView()

@property (nonatomic, strong) UILabel *baseInfoLabel;
@property (nonatomic, strong) ZLShipBaseTopInfoView *topInfoView;
@property (nonatomic, strong) ZLShipBaseBottomView *bottomInfoView;
@property (nonatomic, strong) UIButton *cancelImaportantBtn;
@property (nonatomic, strong) UILabel *infoQueryLabel;
@end

@implementation ZLShipBaseDetailView

- (instancetype)init{
    if (self = [super init]) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    [self addSubview:self.baseInfoLabel];
    [self addSubview:self.topInfoView];
    [self addSubview:self.bottomInfoView];
    [self addSubview:self.cancelImaportantBtn];
    [self addSubview:self.infoQueryLabel];
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.baseInfoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    
    [self.topInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.baseInfoLabel.mas_bottom);
//        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width);
        //        make.width.mas_equalTo(100);
        
    }];
    
    [self.bottomInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.topInfoView.mas_bottom).offset(1);
        //        make.height.mas_equalTo(20);
        make.width.mas_equalTo(Main_Screen_Width);
//                make.height.mas_equalTo(200);
    }];
    
    [self.cancelImaportantBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(0);
        make.top.equalTo(self.bottomInfoView.mas_bottom).offset(0);
                make.height.mas_equalTo(40);
        make.width.mas_equalTo(Main_Screen_Width);
        //                make.height.mas_equalTo(200);
    }];
    
    [self.infoQueryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self.cancelImaportantBtn.mas_bottom).offset(0);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(Main_Screen_Width);
        
    }];
    

}

- (UILabel *)baseInfoLabel{
    if (!_baseInfoLabel) {
        _baseInfoLabel = [[UILabel alloc]init];
        _baseInfoLabel.font = CHINESE_SYSTEM(15);
        _baseInfoLabel.backgroundColor = [UIColor lightGrayColor];
        _baseInfoLabel.text = @"基本信息";
    }
    return _baseInfoLabel;
}

- (ZLShipBaseTopInfoView *)topInfoView{
    if (!_topInfoView) {
        _topInfoView = [[ZLShipBaseTopInfoView alloc]init];
    }
    return _topInfoView;
}

- (ZLShipBaseBottomView *)bottomInfoView{
    if (!_bottomInfoView) {
        _bottomInfoView = [[ZLShipBaseBottomView alloc]init];
    }
    return _bottomInfoView;
}

- (UIButton *)cancelImaportantBtn{
    if (!_cancelImaportantBtn) {
        _cancelImaportantBtn = [[UIButton alloc]init];
        [_cancelImaportantBtn setTitle:@"取消重点" forState:(UIControlStateNormal)];
        [_cancelImaportantBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_cancelImaportantBtn setBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
    }
    return _cancelImaportantBtn;
}

- (UILabel *)infoQueryLabel{
    if (!_infoQueryLabel) {
        _infoQueryLabel = [[UILabel alloc]init];
        _infoQueryLabel.font = CHINESE_SYSTEM(15);
        _infoQueryLabel.backgroundColor = [UIColor lightGrayColor];
        _infoQueryLabel.text = @"信息查询";
    }
    return _infoQueryLabel;
}

@end
