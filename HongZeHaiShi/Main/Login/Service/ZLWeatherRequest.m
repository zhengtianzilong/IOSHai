//
//  ZLWeatherRequest.m
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/5.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLWeatherRequest.h"

@implementation ZLWeatherRequest

- (YTKRequestMethod)requestMethod{
    return YTKRequestMethodPOST;
}

- (id)requestArgument{
    return  @{
              @"cmd": @"getWeather",
              @"params": @{
                      }
              };
}

@end
