//
//  ZLTodayWorkDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLTodayMaritimeDutyModel.h"
@interface ZLTodayWorkDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *title;
@property (nonatomic, strong) NSString<Optional> *createtime;
@property (nonatomic, strong) NSArray<ZLTodayMaritimeDutyModel> *maritimeDutys;
@end
