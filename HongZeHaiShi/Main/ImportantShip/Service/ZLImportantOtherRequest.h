//
//  ZLImportantOtherRequest.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@interface ZLImportantOtherRequest : ZLBaseRequest
- (instancetype)initWithshipName:(NSString *)shipName
                         EndTime:(NSString *)EndTime
                        StarTime:(NSString *)StarTime

                          pageNo:(NSInteger)pageNo
                        pageSize:(NSInteger)pageSize;
@end
