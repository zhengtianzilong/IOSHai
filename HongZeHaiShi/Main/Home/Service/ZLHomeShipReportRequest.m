//
//  ZLHomeShipReportRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/8.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLHomeShipReportRequest.h"
@interface ZLHomeShipReportRequest()

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, strong) NSString *boatName;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *st;
@property (nonatomic, strong) NSString *et;
@end

@implementation ZLHomeShipReportRequest

- (instancetype)initWithType:(NSString *)type
                     boatName:(NSString *)boatName
                       pageNo:(NSInteger)pageNo
                     pageSize:(NSInteger)pageSize
                           st:(NSString *)st
                           et:(NSString *)et{
    
    if (self = [super init]) {
        self.type = type;
        self.boatName = boatName;
        self.pageSize = pageSize;
        self.pageNo = pageNo;
        self.st = st;
        self.et = et;
    }
    return self;
    
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            self.type,@"type",
                            self.boatName,@"boatName",
                            @(_pageNo),@"pageNo",
                            @(_pageSize),@"pageSize",
                            self.st,@"startTime",
                            self.et,@"endTime",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"flotillaReport",@"cmd",
                         params,@"params", nil];
    
    
    return  dic;
}
@end
