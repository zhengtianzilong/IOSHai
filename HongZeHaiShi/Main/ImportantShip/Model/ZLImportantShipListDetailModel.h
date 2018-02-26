//
//  ZLImportantShipListDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ZLImportantShipListDetailModel
@end
@interface ZLImportantShipListDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *VESSELNAMECN;
@property (nonatomic, strong) NSString<Optional> *CREATETIME;
@property (nonatomic, strong) NSString<Optional> *DEADWEIGHTTONNAGE;
@property (nonatomic, strong) NSString<Optional> *GROSSTONNAGE;
@property (nonatomic, strong) NSString<Optional> *DATASOURCE;
@property (nonatomic, strong) NSString<Optional> *vesselnamecn;
@property (nonatomic, strong) NSString<Optional> *keyPonitCount;
@property (nonatomic, strong) NSString<Optional> *capacity;
@property (nonatomic, strong) NSString<Optional> *total;
@property (nonatomic, strong) NSString<Optional> *dataSource;
@property (nonatomic, strong) NSString<Optional> *NATIVEPORT;
@property (nonatomic, strong) NSString<Optional> *LASTDESC;
@property (nonatomic, strong) NSString<Optional> *REMARK;
@property (nonatomic, strong) NSString<Optional> *XQZDGZ;
@property (nonatomic, strong) NSString<Optional> *SZDGZ;
@end
