//
//  ZLAnnounceQueryRiverRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLAnnounceQueryRiverRequest.h"
@interface ZLAnnounceQueryRiverRequest()

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;
@end

@implementation ZLAnnounceQueryRiverRequest

- (instancetype)initWithPageNo:(NSInteger)pageNo
                      pageSize:(NSInteger)pageSize{
    
    if (self = [super init]) {
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
                            @(_pageNo),@"pageNo",
                            @(_pageSize),@"pageSize",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"queryPassRiverRecord",@"cmd",
                         params,@"params", nil];
    
    
    return  dic;
}
@end
