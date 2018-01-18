//
//  ZLShipBaseTopInfoView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLShipInfoView.h"
@interface ZLShipBaseTopInfoView : UIView
// 船名
@property (nonatomic, strong) ZLShipInfoView *shipName;
// 船主
@property (nonatomic, strong)  ZLShipInfoView *shipOwner;
// 经营人
@property (nonatomic, strong) ZLShipInfoView *shipOperator;
// 电话
@property (nonatomic, strong) ZLShipInfoView *telephone;

// 载重吨
@property (nonatomic, strong) ZLShipInfoView *deadWeight;
// 总吨
@property (nonatomic, strong) ZLShipInfoView *weight;
// 长
@property (nonatomic, strong) ZLShipInfoView *lengthAndWidth;
// 配员
@property (nonatomic, strong) ZLShipInfoView *people;
@end
