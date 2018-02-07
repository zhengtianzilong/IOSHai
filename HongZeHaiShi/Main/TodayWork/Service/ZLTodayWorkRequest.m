//
//  ZLTodayWorkRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLTodayWorkRequest.h"

@interface ZLTodayWorkRequest()

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;

@end

@implementation ZLTodayWorkRequest

- (instancetype)initWithId:(NSString *)Id
                    pageNo:(NSInteger)pageNo
                  pageSize:(NSInteger)pageSize{
    
    if (self = [super init]) {
        
        self.pageSize = pageSize;
        self.pageNo = pageNo;
        
    }
    return self;
    
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument{
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"",@"id",
                            @(_pageNo),@"pageNo",
                            @(_pageSize),@"pageSize",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"getMaritimeDutys",@"cmd",
                         params,@"params", nil];

    
    return  dic;
}
@end
