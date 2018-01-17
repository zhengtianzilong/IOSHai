//
//  ZLHomeBottomCollectionViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeBottomCollectionViewCell.h"

@interface ZLHomeBottomCollectionViewCell ()


@property(nonatomic, strong) UIView *lineView_w;
@property(nonatomic, strong) UIView *lineView_h;

@end

@implementation ZLHomeBottomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
        
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.customBtn];
    [self.contentView addSubview:self.lineView_w];
    [self.contentView addSubview:self.lineView_h];
    [self.contentView addSubview:self.tipBtn];
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.customBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.center.equalTo(self.contentView);
        make.height.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        
    }];
    
    [self.customBtn setImagePosition:LXMImagePositionTop spacing:5];
    
    [self.tipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right);
        make.top.equalTo(self.contentView);
        make.width.equalTo(self.contentView).multipliedBy(0.25);
        make.height.equalTo(self.contentView).multipliedBy(0.25);
        
    }];
    
    [self.lineView_h mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right);
        make.height.equalTo(self.contentView);
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(1);
        
    }];
    
    [self.lineView_w mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.contentView.mas_bottom);
        make.width.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.height.mas_equalTo(1);
        
    }];
}

-(void)setModel:(ZLHomeBottomCollectionModel *)model{
    
    if (nil != model) {
        _model = model;
        
        [_customBtn setTitle:self.model.title forState:(UIControlStateNormal)];
        [_customBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [_customBtn setImage:[UIImage imageNamed:self.model.imageTitle] forState:(UIControlStateNormal)];
    }
    
    
    
    
}


#pragma mark -- 懒加载
- (UIButton *)customBtn{
    
    if (!_customBtn)
    {
        _customBtn = [[UIButton alloc]init];
        //        [_customBtn setTitle:@"我的任务" forState:(UIControlStateNormal)];
        [_customBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        _customBtn.userInteractionEnabled = NO;
        _customBtn.titleLabel.font = CHINESE_SYSTEM(14);
        //        [_customBtn setImage:[UIImage imageNamed:@"day_rivers_total"] forState:(UIControlStateNormal)];
        
    }
    return _customBtn;
    
}

- (UIButton *)tipBtn{
    if (!_tipBtn) {
        
        _tipBtn = [[UIButton alloc]init];
        
        [_tipBtn setTitle:@"500" forState:(UIControlStateNormal)];
        _tipBtn.titleLabel.font = CHINESE_SYSTEM(14);
        [_tipBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _tipBtn.backgroundColor = [UIColor redColor];
        
    }
    return _tipBtn;
    
}


- (UIView *)lineView_w
{
    if (!_lineView_w)
    {
        _lineView_w = [UIView new];
        
        _lineView_w.backgroundColor = [UIColor redColor];
    }
    return _lineView_w;
}

- (UIView *)lineView_h
{
    if (!_lineView_h)
    {
        _lineView_h = [UIView new];
        
        _lineView_h.backgroundColor = [UIColor redColor];
        
    }
    return _lineView_h;
}

@end
