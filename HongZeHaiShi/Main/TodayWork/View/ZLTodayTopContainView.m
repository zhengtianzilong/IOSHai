//
//  ZLTodayTopContainView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayTopContainView.h"

@implementation ZLTodayTopContainView
- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        
        [self setUpViews];
        
    }
    return self;
    
}


- (void)setUpViews{
    
    [self addSubview:self.topView];
    
    [self addSubview:self.titleView];
    [self addSubview:self.pinImageV];
    [self addSubview:self.bottomImageV];
    self.cellViewArray = @[
                           self.topView.firstView,
                           self.topView.secondView,
                           self.topView.thirdView,
                           self.topView.forthView,
                           self.topView.fifthView,
                           self.topView.sixView,
                           self.topView.sevenView,
                           self.topView.eightView,
                           self.topView.nineView,
                           
                           ];
    
    
    
}



- (void)layoutSubviews{
    [super layoutSubviews];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self).offset(15);
        make.right.equalTo(self.mas_right).offset(-15);
        make.bottom.equalTo(self.mas_bottom).offset(-15);
    }];
    
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(20);
        make.width.equalTo(self.mas_width).multipliedBy(0.5);
        make.height.mas_equalTo(40);
    }];
  
    [self.pinImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.mas_right).offset(-15);
        make.top.equalTo(self).offset(10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(30);
    }];
    
    [self.bottomImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self).offset(15);
        make.top.equalTo(self.topView.mas_bottom).offset(0);
        make.right.equalTo(self.mas_right).offset(-15);
        make.height.mas_equalTo(10);
    }];
    
    
}

- (void)setTodayWorkModel:(ZLTodayWorkModel *)todayWorkModel{
    
    _todayWorkModel = todayWorkModel;
    for (int i = 0; i < self.cellViewArray.count; i++) {
        
        ZLTodayMaritimeDutyModel *maritimeDutyModel = todayWorkModel.detail.maritimeDutys[i];
        
        ZLTodayTopViewCellView *cellView = self.cellViewArray[i];
        
        cellView.departName.text = maritimeDutyModel.departName;
        cellView.dutyPersonnel.text = maritimeDutyModel.dutyPersonnel;
        
    }
    
    self.titleView.titleLabel.text = todayWorkModel.detail.title;
    
    self.topView.timeView.timeLabel.text = todayWorkModel.detail.createtime;
    
}

- (ZLTodayTitleView *)titleView{
    if (!_titleView) {
        
        _titleView = [[ZLTodayTitleView alloc]init];
        
    }
    return _titleView;
}


- (UIImageView *)pinImageV{
    if (!_pinImageV) {
        _pinImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"today_pin"]];
        
    }
    return _pinImageV;
}

- (UIImageView *)bottomImageV{
    if (!_bottomImageV) {
        _bottomImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"today_bottom_bg"]];
    }
    return _bottomImageV;
}


- (ZLTodayTopView *)topView{
    if (!_topView) {
        _topView = [[ZLTodayTopView alloc]init];
        
    }
    return _topView;
}


@end
