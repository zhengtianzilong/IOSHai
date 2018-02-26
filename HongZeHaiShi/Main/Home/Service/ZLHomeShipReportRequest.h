//
//  ZLHomeShipReportRequest.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@interface ZLHomeShipReportRequest : ZLBaseRequest
- (instancetype)initWithType:(NSString *)type
                    boatName:(NSString *)boatName
                      pageNo:(NSInteger)pageNo
                    pageSize:(NSInteger)pageSize
                          st:(NSString *)st
                          et:(NSString *)et;
@end
