//
//  ZLBaseRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/5.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@implementation ZLBaseRequest

- (NSTimeInterval)requestTimeoutInterval{
    
    return 20;
    
}


- (NSString *)requestUrl{
    
    return Base_URL;
    
}

- (YTKRequestSerializerType)requestSerializerType{
    return YTKRequestSerializerTypeJSON;
}





@end
