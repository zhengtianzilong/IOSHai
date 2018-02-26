//
//  ZLHomeShipReportModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLFlotillaDetailModel.h"
@interface ZLHomeShipReportModel : ZLBaseJSONModel

@property (nonatomic, strong) ZLFlotillaDetailModel<Optional> *detail;

@end
