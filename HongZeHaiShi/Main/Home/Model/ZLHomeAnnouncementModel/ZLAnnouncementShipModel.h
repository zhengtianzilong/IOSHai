//
//  ZLAnnouncementShipModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLOaNotifyListModel.h"
@interface ZLAnnouncementShipModel : ZLBaseJSONModel
@property (nonatomic, strong) ZLOaNotifyListModel *detail;
@end
