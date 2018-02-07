//
//  ZLLoginDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZLLoginDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *seqId;

@property (nonatomic, strong) NSString<Optional> *userId;

@property (nonatomic, strong) NSString<Optional> *userName;
@property (nonatomic, strong) NSString<Optional> *deptId;
@property (nonatomic, strong) NSString<Optional> *videoAccount;
@property (nonatomic, strong) NSString<Optional> *videoPassword;
@property (nonatomic, strong) NSString<Optional> *xqzdgzState;
@end
