//
//  ZLLawListDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "ZLLawUrlModel.h"
@protocol ZLLawListDetailModel

@end
@interface ZLLawListDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *SEQ_ID;
@property (nonatomic, strong) NSString<Optional> *FROM_ID;
@property (nonatomic, strong) NSString<Optional> *USER_NAME;
@property (nonatomic, strong) NSString<Optional> *SUBJECT;
@property (nonatomic, strong) NSString<Optional> *TOP;
@property (nonatomic, strong) NSString<Optional> *TYPE_ID;
@property (nonatomic, strong) NSString<Optional> *CLASS_DESC;
@property (nonatomic, strong) NSString<Optional> *BEGIN_DATE;
@property (nonatomic, strong) NSString<Optional> *SEND_TIME;
@property (nonatomic, strong) NSString<Optional> *ATTACHMENT_ID;
@property (nonatomic, strong) NSString<Optional> *ATTACHMENT_NAME;
@property (nonatomic, strong) NSString<Optional> *CONTENT;
@property (nonatomic, strong) NSArray<ZLLawUrlModel,Optional> *url;
@end
