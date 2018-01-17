//
//  ZLMeCollectionViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/16.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+JKImagePosition.h"
#import "ZLMeCollectionModel.h"
@interface ZLMeCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) UIButton *customBtn;

@property (nonatomic, strong) UIButton *tipBtn;;

@property (nonatomic, strong) ZLMeCollectionModel *model;

@end
