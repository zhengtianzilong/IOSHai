//
//  ZLMeBottomView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/16.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLMeCollectionViewCell.h"
typedef void(^ZLMeBottomViewBlock)(ZLMeCollectionModel *model, NSIndexPath *indexpath);

@interface ZLMeBottomView : UIView

@property (nonatomic, copy) ZLMeBottomViewBlock bottomViewBlock;

@end
