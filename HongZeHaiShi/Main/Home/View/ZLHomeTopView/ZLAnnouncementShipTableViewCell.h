//
//  ZLAnnouncementShipTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLOaNotifyListDetailModel.h"
@interface ZLAnnouncementShipTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *detailLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) ZLOaNotifyListDetailModel *detailModel;

@end
