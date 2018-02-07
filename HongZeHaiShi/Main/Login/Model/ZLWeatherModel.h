//
//  ZLWeatherModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/5.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLWeatherDetailsModel.h"


@interface ZLWeatherModel : ZLBaseJSONModel

@property (nonatomic, strong) ZLWeatherDetailsModel *detail;

@end
