//
//  ZLTodayTopContainView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/2/6.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLTodayTopView.h"
#import "ZLTodayWorkModel.h"
#import "ZLTodayTitleView.h"
@interface ZLTodayTopContainView : UIView
@property (nonatomic, strong) ZLTodayTopView *topView;

@property (nonatomic, strong) ZLTodayWorkModel *todayWorkModel;

@property (nonatomic, strong) ZLTodayTitleView *titleView;

@property (nonatomic, strong) UIImageView *pinImageV;

@property (nonatomic, strong) UIImageView *bottomImageV;

@property (nonatomic, strong) NSArray<ZLTodayTopViewCellView *> *cellViewArray;

@end
