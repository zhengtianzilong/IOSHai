//
//  ZLLoginRequest.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/5.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseRequest.h"

@interface ZLLoginRequest : ZLBaseRequest
- (instancetype)initWithName:(NSString *)name password:(NSString *)password;
@end
