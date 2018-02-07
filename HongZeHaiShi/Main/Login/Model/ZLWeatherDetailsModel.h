//
//  ZLWeatherDetailsModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLWeatherDetailModel.h"
@interface ZLWeatherDetailsModel : JSONModel
@property (nonatomic, strong) NSArray<ZLWeatherDetailModel> *WeatherDetails;
@end
