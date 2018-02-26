//
//  ZLShipReportDetailTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLShipReportFlotillaReportDeatilModel.h"
@interface ZLShipReportDetailTableViewCell : UITableViewCell

// 船籍港:
@property (nonatomic, strong) UILabel *shipLable;
// 船籍
@property (nonatomic, strong) UILabel *ship;
// 千瓦
@property (nonatomic, strong) UILabel *wattLabel;
@property (nonatomic, strong) UILabel *watt;

// 队长
@property (nonatomic, strong) UILabel *lengthLabel;
@property (nonatomic, strong) UILabel *length;
// 备注
@property (nonatomic, strong) UILabel *noteLabel;
@property (nonatomic, strong) UILabel *note;

@property (nonatomic, strong) ZLShipReportFlotillaReportDeatilModel *detailModel;
@end
