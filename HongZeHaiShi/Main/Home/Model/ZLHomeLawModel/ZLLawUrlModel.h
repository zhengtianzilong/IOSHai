//
//  ZLLawUrlModel.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/7.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <JSONModel/JSONModel.h>
@protocol ZLLawUrlModel

@end
@interface ZLLawUrlModel : JSONModel
@property (nonatomic, strong) NSString<Optional> *attachurl;
@end
