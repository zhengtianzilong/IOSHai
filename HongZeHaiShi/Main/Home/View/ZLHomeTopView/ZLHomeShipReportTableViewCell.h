//
//  ZLHomeShipReportTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLFlotillaReportModel.h"
@interface ZLHomeShipReportTableViewCell : UITableViewCell
// 标题
@property (nonatomic, strong) UILabel *titleLabel;
// 船队详情
@property (nonatomic, strong) UIImageView *tipImageV;
// 船籍港:
@property (nonatomic, strong) UILabel *shipLable;
// 船籍
@property (nonatomic, strong) UILabel *ship;
// 吨位
@property (nonatomic, strong) UILabel *weightLabel;
@property (nonatomic, strong) UILabel *weight;
// 拖数
@property (nonatomic, strong) UILabel *tuoshuLabel;
@property (nonatomic, strong) UILabel *tuoshu;
// 千瓦
@property (nonatomic, strong) UILabel *wattLabel;
@property (nonatomic, strong) UILabel *watt;

// 队长
@property (nonatomic, strong) UILabel *captainLabel;
@property (nonatomic, strong) UILabel *captain;

// 电话
@property (nonatomic, strong) UILabel *phoneLabel;
@property (nonatomic, strong) UILabel *phone;

// 报港时间
@property (nonatomic, strong) UILabel *startTimeLabel;
@property (nonatomic, strong) UILabel *startTime;

// 放行时间
@property (nonatomic, strong) UILabel *endTimeLabel;
@property (nonatomic, strong) UILabel *endTime;

// 备注
@property (nonatomic, strong) UILabel *noteLabel;
@property (nonatomic, strong) UILabel *note;

@property (nonatomic, strong) ZLFlotillaReportModel *flotillaModel;


@end
