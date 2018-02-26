//
//  ZLHomeShipReportTableViewCell.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportTableViewCell.h"

@interface ZLHomeShipReportTableViewCell()

@property (nonatomic, strong) UIView *lineView;

@end

@implementation ZLHomeShipReportTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
    
}

- (void)setupUI{
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.lineView];
    [self.contentView addSubview:self.tipImageV];
    [self.contentView addSubview:self.shipLable];
    [self.contentView addSubview:self.ship];
    [self.contentView addSubview:self.weightLabel];
    [self.contentView addSubview:self.weight];
    [self.contentView addSubview:self.tuoshuLabel];
    [self.contentView addSubview:self.tuoshu];
    [self.contentView addSubview:self.wattLabel];
    [self.contentView addSubview:self.watt];
    [self.contentView addSubview:self.captainLabel];
    [self.contentView addSubview:self.captain];
    [self.contentView addSubview:self.phoneLabel];
    [self.contentView addSubview:self.phone];
    [self.contentView addSubview:self.startTimeLabel];
    [self.contentView addSubview:self.startTime];
    [self.contentView addSubview:self.endTimeLabel];
    [self.contentView addSubview:self.endTime];
    [self.contentView addSubview:self.noteLabel];
    [self.contentView addSubview:self.note];
    
}

- (void)updateConstraints{
    
    [super updateConstraints];
    
}

- (void)setFlotillaModel:(ZLFlotillaReportModel *)flotillaModel{
    
    _flotillaModel = flotillaModel;
    self.titleLabel.text = flotillaModel.shipHeadName;
    self.ship.text = flotillaModel.shipNationality;
    self.weight.text = flotillaModel.shipTonnage;
    self.tuoshu.text = [NSString stringWithFormat:@"%@拖",flotillaModel.shipDragNumber];
    self.watt.text = flotillaModel.shipKilowatt;
    self.captain.text = [NSString stringWithFormat:@"%@米",flotillaModel.shipCaptain]; ;
    self.phone.text = flotillaModel.shipContactNumber;
    self.startTime.text = flotillaModel.reportHarborTime;
    self.endTime.text = flotillaModel.releaseTime;
    self.note.text = flotillaModel.remark;
    
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(5);
        make.height.mas_equalTo(20);
        make.width.equalTo(self.contentView);
        //        make.width.mas_equalTo(100);
        
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView).offset(0);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(1);
        make.width.equalTo(self.contentView);
        //        make.width.mas_equalTo(100);
        
    }];
    
   
    
    [self.shipLable mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.lineView.mas_bottom).offset(5);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.ship mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.shipLable.mas_right);
        make.top.equalTo(self.shipLable);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.weightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.shipLable);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.weight mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.weightLabel.mas_right);
        make.top.equalTo(self.weightLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    
    [self.tuoshuLabel mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.shipLable.mas_left);
        make.top.equalTo(self.shipLable.mas_bottom).offset(0);
        make.height.mas_equalTo(20);

    }];

    [self.tuoshu mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.equalTo(self.tuoshuLabel.mas_right);
        make.top.equalTo(self.tuoshuLabel);
        make.height.mas_equalTo(20);

    }];
    
    [self.wattLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.tuoshuLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.watt mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.wattLabel.mas_right);
        make.top.equalTo(self.wattLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.captainLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.tuoshuLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.captain mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.captainLabel.mas_right);
        make.top.equalTo(self.captainLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.contentView.mas_centerX);
        make.top.equalTo(self.captainLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.phone mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.phoneLabel.mas_right);
        make.top.equalTo(self.phoneLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.captainLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.startTimeLabel.mas_right);
        make.top.equalTo(self.startTimeLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
   
    
    [self.endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.startTimeLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.endTime mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.endTimeLabel.mas_right);
        make.top.equalTo(self.endTimeLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
  
    
    [self.noteLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.endTimeLabel.mas_bottom).offset(0);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.note mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(self.noteLabel.mas_right);
        make.top.equalTo(self.noteLabel);
        make.height.mas_equalTo(20);
        //        make.width.mas_equalTo(50);
        
    }];
    
    [self.tipImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.equalTo(self.contentView.mas_right).offset(0);
        make.centerY.equalTo(self.endTimeLabel.mas_centerY);
//        make.height.mas_equalTo(20);
//        make.width.mas_equalTo(20);
        
    }];
    
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

- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = HEXCOLOR(CVIEW_GRAY_COLOR);
    }
    return _lineView;
}


- (UIImageView *)tipImageV{
    if (!_tipImageV) {
        _tipImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_ship_report_detail"]];
//        _tipImageV.backgroundColor = [UIColor redColor];
//        _tipImageV.image = ;
    }
    return _tipImageV;
}

- (UILabel *)shipLable{
    if (!_shipLable) {
        _shipLable = [[UILabel alloc]init];
        _shipLable.text = @"船籍:";
        _shipLable.font = CHINESE_SYSTEM(14);
    }
    return _shipLable;
}
- (UILabel *)ship{
    if (!_ship) {
        _ship = [[UILabel alloc]init];
        _ship.text = @"XXXXX";
        _ship.font = CHINESE_SYSTEM(14);
    }
    return _ship;
}

- (UILabel *)weightLabel{
    if (!_weightLabel) {
        _weightLabel = [[UILabel alloc]init];
        _weightLabel.text = @"吨位:";
        _weightLabel.font = CHINESE_SYSTEM(13);
    }
    return _weightLabel;
}

- (UILabel *)weight{
    if (!_weight) {
        _weight = [[UILabel alloc]init];
        _weight.text = @"80";
        _weight.font = CHINESE_SYSTEM(13);
    }
    return _weight;
}

- (UILabel *)tuoshuLabel{
    if (!_tuoshuLabel) {
        _tuoshuLabel = [[UILabel alloc]init];
        _tuoshuLabel.text = @"拖数:";
        _tuoshuLabel.font = CHINESE_SYSTEM(13);
    }
    return _tuoshuLabel;
}

- (UILabel *)tuoshu{
    if (!_tuoshu) {
        _tuoshu = [[UILabel alloc]init];
        _tuoshu.text = @"123";
        _tuoshu.font = CHINESE_SYSTEM(13);
    }
    return _tuoshu;
}

- (UILabel *)wattLabel{
    if (!_wattLabel) {
        _wattLabel = [[UILabel alloc]init];
        _wattLabel.text = @"千瓦:";
        _wattLabel.font = CHINESE_SYSTEM(13);
    }
    return _wattLabel;
}

- (UILabel *)watt{
    if (!_watt) {
        _watt = [[UILabel alloc]init];
        _watt.text = @"系统管理员标记";
        _watt.font = CHINESE_SYSTEM(13);
    }
    return _watt;
}



- (UILabel *)captainLabel{
    if (!_captainLabel) {
        _captainLabel = [[UILabel alloc]init];
        _captainLabel.text = @"队长:";
        _captainLabel.font = CHINESE_SYSTEM(13);
    }
    return _captainLabel;
}

- (UILabel *)captain{
    if (!_captain) {
        _captain = [[UILabel alloc]init];
        _captain.text = @"系统管理员标记";
        _captain.font = CHINESE_SYSTEM(13);
    }
    return _captain;
}

- (UILabel *)phoneLabel{
    if (!_phoneLabel) {
        _phoneLabel = [[UILabel alloc]init];
        _phoneLabel.text = @"电话:";
        _phoneLabel.font = CHINESE_SYSTEM(13);
    }
    return _phoneLabel;
}

- (UILabel *)phone{
    if (!_phone) {
        _phone = [[UILabel alloc]init];
        _phone.text = @"系统管理员标记";
        _phone.font = CHINESE_SYSTEM(13);
    }
    return _phone;
}
- (UILabel *)startTimeLabel{
    if (!_startTimeLabel) {
        _startTimeLabel = [[UILabel alloc]init];
        _startTimeLabel.text = @"报港时间:";
        _startTimeLabel.font = CHINESE_SYSTEM(13);
    }
    return _startTimeLabel;
}

- (UILabel *)startTime{
    if (!_startTime) {
        _startTime = [[UILabel alloc]init];
        _startTime.text = @"系统管理员标记";
        _startTime.font = CHINESE_SYSTEM(13);
    }
    return _startTime;
}
- (UILabel *)endTimeLabel{
    if (!_endTimeLabel) {
        _endTimeLabel = [[UILabel alloc]init];
        _endTimeLabel.text = @"放行时间:";
        _endTimeLabel.font = CHINESE_SYSTEM(13);
    }
    return _endTimeLabel;
}

- (UILabel *)endTime{
    if (!_endTime) {
        _endTime = [[UILabel alloc]init];
        _endTime.text = @"系统管理员标记";
        _endTime.font = CHINESE_SYSTEM(13);
    }
    return _endTime;
}

- (UILabel *)noteLabel{
    if (!_noteLabel) {
        _noteLabel = [[UILabel alloc]init];
        _noteLabel.text = @"备注:";
        _noteLabel.font = CHINESE_SYSTEM(13);
    }
    return _noteLabel;
}

- (UILabel *)note{
    if (!_note) {
        _note = [[UILabel alloc]init];
        _note.text = @"系统管理员标记";
        _note.font = CHINESE_SYSTEM(13);
    }
    return _note;
}

@end
