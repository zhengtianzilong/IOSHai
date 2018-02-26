//
//  ZLQueryNoticeListModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLHsNotifyListModel.h"
@interface ZLQueryNoticeListModel : ZLBaseJSONModel
@property (nonatomic, strong) ZLHsNotifyListModel *detail;
@end
