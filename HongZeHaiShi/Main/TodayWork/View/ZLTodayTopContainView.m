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
    
  
    
    
}

- (void)setTodayWorkModel:(ZLTodayWorkModel *)todayWorkModel{
    
    _todayWorkModel = todayWorkModel;
    for (int i = 0; i < self.cellViewArray.count; i++) {
        
        ZLTodayMaritimeDutyModel *maritimeDutyModel = todayWorkModel.detail.maritimeDutys[i];
        
        ZLTodayTopViewCellView *cellView = self.cellViewArray[i];
        
        cellView.departName.text = maritimeDutyModel.departName;
        cellView.dutyPersonnel.text = maritimeDutyModel.dutyPersonnel;
        
    }
    
    
    
    
}

- (ZLTodayTopView *)topView{
    if (!_topView) {
        _topView = [[ZLTodayTopView alloc]init];
        
    }
    return _topView;
}


@end
