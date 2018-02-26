//
//  ZLAnnounceQueryNoticeListRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLAnnounceQueryNoticeListRequest.h"
@interface ZLAnnounceQueryNoticeListRequest()

@property (nonatomic, strong) NSString *Id;
@property (nonatomic, strong) NSString *isRead;
@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;
@end

@implementation ZLAnnounceQueryNoticeListRequest

- (instancetype)initWithId:(NSString *)Id
                    isRead:(NSString *)isRead
                    pageNo:(NSInteger)pageNo
                  pageSize:(NSInteger)pageSize{
    
    if (self = [super init]) {
        self.Id = Id;
        self.isRead = isRead;
        self.pageNo = pageNo;
        self.pageSize = pageSize;
    }
    return self;
    
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            self.Id,@"id",
                            self.isRead,@"isRead",
                            @(_pageNo),@"pageNo",
                            @(_pageSize),@"pageSize",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"queryNoticeList",@"cmd",
                         params,@"params", nil];
    
    
    return  dic;
}
@end
