//
//  ZLZbbListDetail.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@protocol ZLZbbListDetailModel

@end
@interface ZLZbbListDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *SEQ_ID;
@property (nonatomic, strong) NSString<Optional> *CREATETIME;
@property (nonatomic, strong) NSString<Optional> *CREATEUSER;
@property (nonatomic, strong) NSString<Optional> *TITLE;
@property (nonatomic, strong) NSString<Optional> *CONTENT;
@end
