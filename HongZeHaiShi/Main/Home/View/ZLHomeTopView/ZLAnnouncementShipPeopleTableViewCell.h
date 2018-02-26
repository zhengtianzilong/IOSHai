//
//  ZLAnnouncementShipPeopleTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLHsNotifyListDetailModel.h"
@interface ZLAnnouncementShipPeopleTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *peopleLabel;

@property (nonatomic, strong) UIView *oneLineView;

@property (nonatomic, strong) UILabel *typeLabel;
@property (nonatomic, strong) UIView *twoLineView;
@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) ZLHsNotifyListDetailModel *detailModel;

@end
