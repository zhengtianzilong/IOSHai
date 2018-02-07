//
//  ZLWeatherDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ZLWeatherDetailModel

@end
@interface ZLWeatherDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *weather;

@property (nonatomic, strong) NSString<Optional> *temperature;
@property (nonatomic, strong) NSString<Optional> *wind_direction;
@property (nonatomic, strong) NSString<Optional> *wind;
@property (nonatomic, strong) NSString<Optional> *time;
@end
