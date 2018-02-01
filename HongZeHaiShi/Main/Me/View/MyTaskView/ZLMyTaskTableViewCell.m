//
//  ZLMyTaskTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/31.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLMyTaskTableViewCell.h"

@implementation ZLMyTaskTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.typeLabel];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.tipBtn];

}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(10);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(100);
        
    }];
    
    
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(20);
        
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.typeLabel.mas_bottom);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.tipBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo(100);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
    }];
    
   [self.tipBtn jm_setCornerRadius:10 withBackgroundColor:HEXCOLOR(CNAVGATIONBAR_COLOR)];
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = HEXCOLOR(CNAVGATIONBAR_COLOR);
        _titleLabel.text = @"江苏拖4003";
        _titleLabel.font = CHINESE_SYSTEM(15);
    }
    return _titleLabel;
}

- (UIButton *)tipBtn{
    if (!_tipBtn) {
        _tipBtn = [[UIButton alloc]init];
        _tipBtn.titleLabel.font = CHINESE_SYSTEM(13);
        [_tipBtn setTitle:@"提交到安检中队" forState:(UIControlStateNormal)];
//        _tipBtn.backgroundColor = [UIColor redColor];
    }
    return _tipBtn;
}

- (UILabel *)typeLabel{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc]init];
        _typeLabel.text = @"船籍港:";
        _typeLabel.font = CHINESE_SYSTEM(14);
    }
    return _typeLabel;
}
- (UILabel *)timeLabel{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.text = @"XXXXX";
        _timeLabel.font = CHINESE_SYSTEM(14);
    }
    return _timeLabel;
}



@end
