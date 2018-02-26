//
//  ZLHomeShipReportDetailRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/9.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportDetailRequest.h"
@interface ZLHomeShipReportDetailRequest()

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSString *code;
@end

@implementation ZLHomeShipReportDetailRequest

- (instancetype)initWithCode:(NSString *)code
                      pageNo:(NSInteger)pageNo
                    pageSize:(NSInteger)pageSize{
    
    if (self = [super init]) {
        self.code = code;
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
                            self.code,@"reportHarborCode",
                            @(_pageNo),@"pageNo",
                            @(_pageSize),@"pageSize",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"flotillaReportDetails",@"cmd",
                         params,@"params", nil];
    
    
    return  dic;
}
@end
