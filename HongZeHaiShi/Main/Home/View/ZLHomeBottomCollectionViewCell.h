//
//  ZLHomeBottomCollectionViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+JKImagePosition.h"
#import "ZLHomeBottomCollectionModel.h"
@interface ZLHomeBottomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *customBtn;

@property (nonatomic, strong) UIButton *tipBtn;;

@property (nonatomic, strong) ZLHomeBottomCollectionModel *model;


@end
