//
//  ZLShipInfoView.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/18.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLShipInfoView : UIView

// 图片
@property (nonatomic, strong) UIImageView *imageV;

// 名字
@property (nonatomic, strong) UILabel *titleLabel;

// 对应信息
@property (nonatomic, strong) UILabel *infoLabel;

- (instancetype)initWithTitle:(NSString *)title
                    imageName:(NSString *)imageName
                     fontSize:(NSInteger)fontSize;


@end
