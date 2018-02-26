//
//  ZLAnnounceQueryNoticeListRequest.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@interface ZLAnnounceQueryNoticeListRequest : ZLBaseRequest
- (instancetype)initWithId:(NSString *)Id
                    isRead:(NSString *)isRead
                    pageNo:(NSInteger)pageNo
                  pageSize:(NSInteger)pageSize;
@end
