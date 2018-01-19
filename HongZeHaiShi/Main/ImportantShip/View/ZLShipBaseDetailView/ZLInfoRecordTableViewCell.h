//
//  ZLInfoRecordTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/19.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLShipInfoView.h"
@interface ZLInfoRecordTableViewCell : UITableViewCell
@property (nonatomic, strong) ZLShipInfoView *people;

@property (nonatomic, strong) ZLShipInfoView *caseCount;

@property (nonatomic, strong) ZLShipInfoView *money;

@property (nonatomic, strong) ZLShipInfoView *caseAction;

@property (nonatomic, strong) ZLShipInfoView *time;

@end
