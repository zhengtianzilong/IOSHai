//
//  ZLHomeShipReportDetailRequest.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@interface ZLHomeShipReportDetailRequest : ZLBaseRequest
- (instancetype)initWithCode:(NSString *)code
                      pageNo:(NSInteger)pageNo
                    pageSize:(NSInteger)pageSize;
@end
