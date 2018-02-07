//
//  ZLLawModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseJSONModel.h"
#import "ZLLawNotifylistModel.h"
@interface ZLLawModel : ZLBaseJSONModel

@property (nonatomic, strong) ZLLawNotifylistModel<Optional> *detail;

@end
