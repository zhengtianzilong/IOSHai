//
//  ZLLoginBaseView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/15.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLLoginTopView.h"
#import "ZLLoginBottomView.h"
#import "ZLLoginInputView.h"
@interface ZLLoginBaseView : UIView
@property (nonatomic, strong) ZLLoginTopView *loginTopView;

@property (nonatomic, strong) ZLLoginInputView *loginInputView;

@property (nonatomic, strong) ZLLoginBottomView *loginBottomView;
@end
