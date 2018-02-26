//
//  ZLShipReportDetailListModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLShipReportFlotillaReportDeatilModel.h"
@interface ZLShipReportDetailListModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *countShipSum;
@property (nonatomic, strong) NSString<Optional> *countShipLength;
@property (nonatomic, strong) NSArray<ZLShipReportFlotillaReportDeatilModel, Optional> *flotillaReportDetailsList;
@end
