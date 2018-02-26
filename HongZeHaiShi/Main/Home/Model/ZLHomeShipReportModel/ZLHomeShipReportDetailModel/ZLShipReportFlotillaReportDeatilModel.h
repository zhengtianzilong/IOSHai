//
//  ZLShipReportFlotillaReportDeatilModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ZLShipReportFlotillaReportDeatilModel

@end

@interface ZLShipReportFlotillaReportDeatilModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *shipName;
@property (nonatomic, strong) NSString<Optional> *tonnage;
@property (nonatomic, strong) NSString<Optional> *shipLength;
@property (nonatomic, strong) NSString<Optional> *remark;
@end
