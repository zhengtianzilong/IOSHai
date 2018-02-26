//
//  ZLImportantOtherRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLImportantOtherRequest.h"
@interface ZLImportantOtherRequest()

@property (nonatomic, assign) NSInteger pageNo;
@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, strong) NSString *starTime;
@property (nonatomic, strong) NSString *endTime;
@property (nonatomic, strong) NSString *shipName;
@end

@implementation ZLImportantOtherRequest

- (instancetype)initWithshipName:(NSString *)shipName
                         EndTime:(NSString *)EndTime
                        StarTime:(NSString *)StarTime

                          pageNo:(NSInteger)pageNo
                        pageSize:(NSInteger)pageSize{
    
    if (self = [super init]) {
        self.endTime = EndTime;
        self.starTime = StarTime;
        self.shipName = shipName;
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
                            self.shipName,@"shipName",
                            self.endTime,@"EndTime",
                            self.starTime,@"StarTime",
                            @(_pageNo),@"pageNo",
                            @(_pageSize),@"pageSize",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"queryOtherDayShip",@"cmd",
                         params,@"params", nil];
    
    
    return  dic;
}
@end
