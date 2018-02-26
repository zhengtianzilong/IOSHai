//
//  ZLFlotillaDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>

#import "ZLFlotillaReportModel.h"
@interface ZLFlotillaDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *countShipSum;
@property (nonatomic, strong) NSArray<ZLFlotillaReportModel, Optional> *flotillaReportList;
@end
