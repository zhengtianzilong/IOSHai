//
//  ZLBaseJSONModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface ZLBaseJSONModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *cmd;

@property (nonatomic, strong) NSString<Optional> *result;

@property (nonatomic, strong) NSString<Optional> *resultNote;
@property (nonatomic, strong) NSString<Optional> *totalRecordNum;
@property (nonatomic, strong) NSString<Optional> *pageNum;
@property (nonatomic, strong) NSString<Optional> *pageNo;
@end
