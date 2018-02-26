//
//  ZLImportantShipListModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLImportantShipListDetailModel.h"

@interface ZLImportantShipListModel : JSONModel

@property (nonatomic, strong) NSArray<ZLImportantShipListDetailModel, Optional> *shipList;

@end
