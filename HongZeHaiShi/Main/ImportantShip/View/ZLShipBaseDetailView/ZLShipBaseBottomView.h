//
//  ZLShipBaseBottomView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLShipInfoView.h"
@interface ZLShipBaseBottomView : UIView
// 船籍港
@property (nonatomic, strong) ZLShipInfoView *portOfRegistry;
// 适航证书
@property (nonatomic, strong)  ZLShipInfoView *airworthinessCertificate;
// 配员证书
@property (nonatomic, strong) ZLShipInfoView *manningCertificate;
// 最近报港
@property (nonatomic, strong) ZLShipInfoView *recentlySubmitted ;
// 更新时间
@property (nonatomic, strong) ZLShipInfoView *updateTime;
// 吃水深度
@property (nonatomic, strong) ZLShipInfoView *depth;
// 防污证书
@property (nonatomic, strong) ZLShipInfoView *antifoulCertificate;
// 国籍证书
@property (nonatomic, strong) ZLShipInfoView *nationalityCertificate;
// 最近处罚
@property (nonatomic, strong) ZLShipInfoView *recentPenalties;
@end
