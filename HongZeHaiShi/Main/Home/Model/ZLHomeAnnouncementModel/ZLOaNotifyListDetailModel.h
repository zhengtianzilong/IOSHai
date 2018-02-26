//
//  ZLOaNotifyListDetailModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/10.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ZLOaNotifyListDetailModel

@end


@interface ZLOaNotifyListDetailModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *SEQ_ID;
@property (nonatomic, strong) NSString<Optional> *SUBJECT;
@property (nonatomic, strong) NSString<Optional> *CONTENT;
@property (nonatomic, strong) NSString<Optional> *SEND_TIME;
@property (nonatomic, strong) NSString<Optional> *detailsUrl;
@end
