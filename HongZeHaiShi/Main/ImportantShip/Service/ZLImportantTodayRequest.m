//
//  ZLImportantTodayRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLImportantTodayRequest.h"
@interface ZLImportantTodayRequest()

@property (nonatomic, assign) NSInteger pageNo;

@end

@implementation ZLImportantTodayRequest

- (instancetype)initWithPageNo:(NSInteger)pageNo{
    
    if (self = [super init]) {
        self.pageNo = pageNo;
        
    }
    return self;
    
}

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @(_pageNo),@"pageNo",
                            nil];
    
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:@"queryCurrentDayShip",@"cmd",
                         params,@"params", nil];
    
    
    return  dic;
}
@end
