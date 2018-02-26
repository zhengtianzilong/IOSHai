//
//  ZLHsNotifyListDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ZLHsNotifyListDetailModel

@end


@interface ZLHsNotifyListDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *isRead;
@property (nonatomic, strong) NSString<Optional> *updateTime;
@property (nonatomic, strong) NSString<Optional> *userName;
@end
