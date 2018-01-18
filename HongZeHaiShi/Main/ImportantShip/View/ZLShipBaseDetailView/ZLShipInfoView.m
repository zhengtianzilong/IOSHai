//
//  ZLShipInfoView.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLShipInfoView.h"

@interface ZLShipInfoView()

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *imageName;

@property (nonatomic, assign) NSInteger fontSize;

@end

@implementation ZLShipInfoView

- (instancetype)initWithTitle:(NSString *)title
                    imageName:(NSString *)imageName
                     fontSize:(NSInteger)fontSize{
    if (self = [super init]) {
        
        self.title = title;
        self.imageName = imageName;
        self.fontSize = fontSize;
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
     [self addSubview:self.imageV];
    [self addSubview:self.titleLabel];
    [self addSubview:self.infoLabel];
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    if (nil != self.imageName) {
        [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self.mas_bottom);
            make.width.equalTo(self.mas_height);
        }];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right);
            make.top.equalTo(self);
            make.bottom.equalTo(self.mas_bottom);
            //        make.height.equalTo(self.mas_width);
        }];
    }else{
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.top.equalTo(self);
            make.bottom.equalTo(self.mas_bottom);
            //        make.height.equalTo(self.mas_width);
        }];
    }

    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right);
        make.top.equalTo(self);
        make.bottom.equalTo(self.mas_bottom);
//        make.height.equalTo(self.);
    }];
    
}


- (UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc]init];
        _imageV.backgroundColor = [UIColor blueColor];
        
    }
    return _imageV;
    
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = self.title;
        _titleLabel.font = CHINESE_SYSTEM(self.fontSize);
    }
    return _titleLabel;
}

- (UILabel *)infoLabel{
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]init];
        _infoLabel.font = CHINESE_SYSTEM(self.fontSize);
    }
    return _infoLabel;
}



@end
