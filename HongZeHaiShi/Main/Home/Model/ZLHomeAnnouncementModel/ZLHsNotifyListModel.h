//
//  ZLHsNotifyListModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLHsNotifyListDetailModel.h"
@interface ZLHsNotifyListModel : JSONModel

@property (nonatomic, strong) NSArray<ZLHsNotifyListDetailModel, Optional> *hsNotifyList;

@end
