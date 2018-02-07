//
//  ZLTodayWorkModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLTodayWorkDetailModel.h"
@interface ZLTodayWorkModel : ZLBaseJSONModel
@property (nonatomic, strong) ZLTodayWorkDetailModel *detail;
@end
