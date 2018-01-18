//
//  ZLImportantTodayTableViewCell.h
//  HongZeHaiShi
//
//  Created by 蔡紫龙 on 2018/1/17.
//  Copyright © 2018年 xgzl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLImportantTodayTableViewCell : UITableViewCell

// 标题,江苏托
@property (nonatomic, strong) UILabel *titleLabel;
// 红色感叹号
@property (nonatomic, strong) UIImageView *tipImageV;
// 船籍港:
@property (nonatomic, strong) UILabel *shipLable;
// 船籍
@property (nonatomic, strong) UILabel *ship;
// 总吨
@property (nonatomic, strong) UILabel *weightLabel;
@property (nonatomic, strong) UILabel *weight;
// 载重吨
@property (nonatomic, strong) UILabel *deadWeightLabel;
@property (nonatomic, strong) UILabel *deadWeight;
// 系统管理员标记
@property (nonatomic, strong) UILabel *people;

@end
