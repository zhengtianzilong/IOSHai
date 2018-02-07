//
//  ZLTodayListRequest.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@interface ZLTodayListRequest : ZLBaseRequest
- (instancetype)initWithId:(NSString *)Id
                    pageNo:(NSInteger)pageNo
                  pageSize:(NSInteger)pageSize;
@end
