//
//  ZLHomeBottomView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLHomeBottomCollectionViewCell.h"
typedef void(^ZLHomeBottomViewBlock)(ZLHomeBottomCollectionModel *model, NSIndexPath *indexpath);

@interface ZLHomeBottomView : UIView
@property (nonatomic, copy) ZLHomeBottomViewBlock bottomViewBlock;
@end
