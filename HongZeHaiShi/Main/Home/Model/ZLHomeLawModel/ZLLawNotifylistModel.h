//
//  ZLLawNotifylistModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLLawListDetailModel.h"
@interface ZLLawNotifylistModel : JSONModel
@property (nonatomic, strong) NSArray<ZLLawListDetailModel> *notifyList;
@end