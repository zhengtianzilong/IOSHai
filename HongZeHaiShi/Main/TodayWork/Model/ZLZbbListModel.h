//
//  ZLZbbListModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLZbbListDetailModel.h"
@interface ZLZbbListModel : JSONModel
@property (nonatomic, strong) NSArray<ZLZbbListDetailModel> *zbbList;
@property (nonatomic, strong) NSArray<Optional> *zbbDetails;
@end
