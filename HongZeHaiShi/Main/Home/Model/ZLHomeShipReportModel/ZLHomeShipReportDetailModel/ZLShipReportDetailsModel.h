//
//  ZLShipReportDetailsModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLShipReportDetailListModel.h"
@interface ZLShipReportDetailsModel : ZLBaseJSONModel

@property (nonatomic, strong) ZLShipReportDetailListModel *detail;

@end
