//
//  ZLHomeShipQueryVC.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/24.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import "ZLBaseCustomNavViewController.h"

typedef void(^shipQueryBlock)(NSString *name);

@interface ZLHomeShipQueryVC : ZLBaseCustomNavViewController

@property (nonatomic, copy) shipQueryBlock shipBlock;

// 标记点击cell时,需要跳转到哪个控制器
@property (nonatomic, strong) NSString *tag;


@end
