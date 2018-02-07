//
//  ZLLawAttachView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLLawAttachView.h"

@interface ZLLawAttachView()

@property (nonatomic, strong) UILabel *attacthabel;



@end

@implementation ZLLawAttachView
- (instancetype)init{
    
    if (self = [super init]) {
        self.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
        [self setUpViews];
        
    }
    return self;
    
}

- (void)setUpViews{
    [self addSubview:self.attacthBtn];
    [self addSubview:self.attacthabel];

}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.attacthabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
        
        
    }];
    [self.attacthBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.attacthabel.mas_right).offset(10);
        make.top.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
        make.right.equalTo(self.mas_right);
        
    }];
}

- (UILabel *)attacthabel{
    if (!_attacthabel) {
        _attacthabel = [[UILabel alloc]init];
        _attacthabel.text = @"附件:";
        _attacthabel.font = CHINESE_SYSTEM(14);
    }
    return _attacthabel;
}

- (UIButton *)attacthBtn{
    
    if (!_attacthBtn) {
        _attacthBtn = [[UIButton alloc]init];
        [_attacthBtn setTitleColor:HEXCOLOR(CNAVGATIONBAR_COLOR) forState:(UIControlStateNormal)];
        _attacthBtn.titleLabel.font = CHINESE_SYSTEM(13);
    }
    return _attacthBtn;
    
}


@end
